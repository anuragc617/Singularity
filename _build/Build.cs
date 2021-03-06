using System.Collections.Generic;
using Nuke.Common;
using Nuke.Common.Execution;
using Nuke.Common.Git;
using Nuke.Common.ProjectModel;
using Nuke.Common.Tooling;
using Nuke.Common.Tools.DotNet;
using Nuke.Common.Tools.DotCover;
using Nuke.Common.Tools.GitVersion;
using Nuke.Common.Tools.ReportGenerator;
using Nuke.Common.Utilities;
using static Nuke.Common.IO.FileSystemTasks;
using static Nuke.Common.IO.PathConstruction;
using static Nuke.Common.Tools.DotNet.DotNetTasks;
using static Nuke.Common.Tools.DotCover.DotCoverTasks;
using static Nuke.Common.Tools.ReportGenerator.ReportGeneratorTasks;

[CheckBuildProjectConfigurations]
[UnsetVisualStudioEnvironmentVariables]
class Build : NukeBuild
{
    public static int Main() => Execute<Build>(x => x.Compile);

    readonly Configuration Configuration = CiConfiguration.CiConfig;

    [Parameter] readonly string ApiKey;
    [Parameter] readonly bool CoberturaReport;

    [Solution] readonly Solution Solution;
    [GitRepository] readonly GitRepository GitRepository;
    [GitVersion] readonly GitVersion GitVersion;

    AbsolutePath BuildOutput => RootDirectory / "BuildOutput";
    AbsolutePath ArtifactsDirectory => RootDirectory / "artifacts";

    AbsolutePath CoverageDirectory => RootDirectory / "coverage";

    private Dictionary<string, object> NoWarns = new Dictionary<string, object> { { "NoWarn", "NU1701" }, };

    Target Clean => _ => _
        .Before(Restore)
        .Executes(() =>
        {
            EnsureCleanDirectory(BuildOutput);
            EnsureCleanDirectory(ArtifactsDirectory);
        });

    Target Restore => _ => _
        .Executes(() =>
        {
            DotNetRestore(s => s
                .SetProjectFile(Solution)
                .SetProperties(NoWarns));
        });

    Target Compile => _ => _
        .DependsOn(Restore)
        .Executes(() =>
        {
            DotNetBuild(s => s
                .SetProjectFile(Solution)
                .SetConfiguration(Configuration)
                .SetAssemblyVersion(GitVersion.GetNormalizedAssemblyVersion())
                .SetFileVersion(GitVersion.GetNormalizedFileVersion())
                .SetInformationalVersion(GitVersion.InformationalVersion)
                .SetProperties(NoWarns)
                .EnableNoRestore());
        });

    Target Test => _ => _
        .DependsOn(Compile)
        .Executes(() =>
        {
            DotNetTest(s => s
            .SetOutput(BuildOutput / "netcoreapp2.0")
            .SetFramework("netcoreapp2.0")
            .SetConfiguration(Configuration)
            .SetProperties(NoWarns)
            .EnableNoBuild());
        });

    Target Coverage => _ => _
        .DependsOn(Compile)
        .Executes(() =>
    {
        string testdlls = GlobFiles(BuildOutput / "netcoreapp2.0", "*.Test.dll").Join(" ");
        string targetArgs = $"vstest {testdlls} /logger:trx;LogFileName=testresults.trx";
        string dotnetPath = ToolPathResolver.GetPathExecutable("dotnet");
        AbsolutePath coverageSnapshot = CoverageDirectory / "coverage.dcvr";
        AbsolutePath coverageXml = CoverageDirectory / "coverage.xml";
        AbsolutePath coverageReport = CoverageDirectory / "CoverageReport";
        AbsolutePath coberturaReport = CoverageDirectory / "cobertura_coverage.xml";

        DotCoverCover(c => c
             .SetTargetExecutable(dotnetPath)
             .SetTargetWorkingDirectory(RootDirectory)
             .SetTargetArguments(targetArgs)
             .SetFilters("+:Singularity*;-:Class=Singularity.FastExpressionCompiler*;-:*Test*")
             .SetOutputFile(coverageSnapshot));

        DotCoverReport(c => c
            .SetSource(coverageSnapshot)
            .SetOutputFile(coverageXml)
            .SetReportType(DotCoverReportType.DetailedXml));

        if (CoberturaReport)
        {
            ReportGenerator(c => c
                .SetReports(coverageXml)
                .SetTargetDirectory(CoverageDirectory)
                .SetReportTypes(Nuke.Common.Tools.ReportGenerator.ReportTypes.Cobertura));
        }
        else
        {
            ReportGenerator(c => c
                .SetReports(coverageXml)
                .SetTargetDirectory(coverageReport));
        }
    });

    Target Pack => _ => _
        .DependsOn(Compile)
        .Executes(() =>
        {
            DotNetPack(s => s
            .SetOutputDirectory(ArtifactsDirectory)
            .SetConfiguration(Configuration)
            .SetVersion(GitVersion.NuGetVersion)
            .EnableIncludeSymbols()
            .EnableNoBuild());
        });

    Target Push => _ => _
        .Requires(() => ApiKey)
        .After(Test)
        .After(Coverage)
        .OnlyWhenDynamic(() => GitRepository.Branch == "master")
        .After(Pack)
        .Executes(() =>
        {
            DotNetNuGetPush(s => s
            .SetApiKey(ApiKey)
            .CombineWith(
                ArtifactsDirectory.GlobFiles("*.nupkg").NotEmpty(), (cs, nupkgFile) =>
                    (nupkgFile.ToString().EndsWith(".symbols.nupkg") ? cs.SetSource("https://nuget.smbsrc.net/") : cs.SetSource("https://www.nuget.org"))
                    .SetTargetPath(nupkgFile)
                ), degreeOfParallelism: 10);
        });
}