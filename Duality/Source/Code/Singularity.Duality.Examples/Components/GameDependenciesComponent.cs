﻿using Duality;

namespace Singularity.Duality.Examples.Components
{
    public class GameDependenciesComponent : Component, IModule
    {
	    public void Register(ContainerBuilder config)
	    {
            config.Register<IPathfinder, Pathfinder>();
            config.Register<IGameManager>(c => c.Inject(() => GameObj.Scene.FindComponent<GameManagerComponent>(true)).With(Lifetime.PerContainer));
	    }
    }
}
