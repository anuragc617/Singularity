﻿<root dataType="Struct" type="Duality.Resources.Scene" id="129723834">
  <assetInfo />
  <globalGravity dataType="Struct" type="Duality.Vector2">
    <X dataType="Float">0</X>
    <Y dataType="Float">33</Y>
  </globalGravity>
  <serializeObj dataType="Array" type="Duality.GameObject[]" id="427169525">
    <item dataType="Struct" type="Duality.GameObject" id="4294853445">
      <active dataType="Bool">true</active>
      <children />
      <compList dataType="Struct" type="System.Collections.Generic.List`1[[Duality.Component]]" id="892428855">
        <_items dataType="Array" type="Duality.Component[]" id="3177875086" length="4">
          <item dataType="Struct" type="Duality.Components.Transform" id="57163367">
            <active dataType="Bool">true</active>
            <angle dataType="Float">0</angle>
            <angleAbs dataType="Float">0</angleAbs>
            <gameobj dataType="ObjectRef">4294853445</gameobj>
            <ignoreParent dataType="Bool">false</ignoreParent>
            <pos dataType="Struct" type="Duality.Vector3">
              <X dataType="Float">0</X>
              <Y dataType="Float">0</Y>
              <Z dataType="Float">-500</Z>
            </pos>
            <posAbs dataType="Struct" type="Duality.Vector3">
              <X dataType="Float">0</X>
              <Y dataType="Float">0</Y>
              <Z dataType="Float">-500</Z>
            </posAbs>
            <scale dataType="Float">1</scale>
            <scaleAbs dataType="Float">1</scaleAbs>
          </item>
          <item dataType="Struct" type="Duality.Components.Camera" id="1546272626">
            <active dataType="Bool">true</active>
            <clearColor dataType="Struct" type="Duality.Drawing.ColorRgba" />
            <farZ dataType="Float">10000</farZ>
            <focusDist dataType="Float">500</focusDist>
            <gameobj dataType="ObjectRef">4294853445</gameobj>
            <nearZ dataType="Float">50</nearZ>
            <priority dataType="Int">0</priority>
            <projection dataType="Enum" type="Duality.Drawing.ProjectionMode" name="Perspective" value="1" />
            <renderSetup dataType="Struct" type="Duality.ContentRef`1[[Duality.Resources.RenderSetup]]" />
            <renderTarget dataType="Struct" type="Duality.ContentRef`1[[Duality.Resources.RenderTarget]]" />
            <shaderParameters dataType="Struct" type="Duality.Drawing.ShaderParameterCollection" id="3119336918" custom="true">
              <body />
            </shaderParameters>
            <targetRect dataType="Struct" type="Duality.Rect">
              <H dataType="Float">1</H>
              <W dataType="Float">1</W>
              <X dataType="Float">0</X>
              <Y dataType="Float">0</Y>
            </targetRect>
            <visibilityMask dataType="Enum" type="Duality.Drawing.VisibilityFlag" name="All" value="4294967295" />
          </item>
        </_items>
        <_size dataType="Int">2</_size>
      </compList>
      <compMap dataType="Struct" type="System.Collections.Generic.Dictionary`2[[System.Type],[Duality.Component]]" id="1484669504" surrogate="true">
        <header />
        <body>
          <keys dataType="Array" type="System.Object[]" id="2264469117">
            <item dataType="Type" id="1832466214" value="Duality.Components.Transform" />
            <item dataType="Type" id="4245473978" value="Duality.Components.Camera" />
          </keys>
          <values dataType="Array" type="System.Object[]" id="3402174904">
            <item dataType="ObjectRef">57163367</item>
            <item dataType="ObjectRef">1546272626</item>
          </values>
        </body>
      </compMap>
      <compTransform dataType="ObjectRef">57163367</compTransform>
      <identifier dataType="Struct" type="System.Guid" surrogate="true">
        <header>
          <data dataType="Array" type="System.Byte[]" id="886599511">/x0xyWvsWEuKEgjJIBJsHg==</data>
        </header>
        <body />
      </identifier>
      <initState dataType="Enum" type="Duality.InitState" name="Initialized" value="1" />
      <name dataType="String">MainCamera</name>
      <parent />
      <prefabLink />
    </item>
    <item dataType="Struct" type="Duality.GameObject" id="2086827962">
      <active dataType="Bool">true</active>
      <children />
      <compList dataType="Struct" type="System.Collections.Generic.List`1[[Duality.Component]]" id="1552680996">
        <_items dataType="Array" type="Duality.Component[]" id="461617860" length="4">
          <item dataType="Struct" type="Singularity.Duality.Examples.Components.GameManagerComponent" id="1223978886">
            <_x003C_Score_x003E_k__BackingField dataType="Int">0</_x003C_Score_x003E_k__BackingField>
            <active dataType="Bool">true</active>
            <gameobj dataType="ObjectRef">2086827962</gameobj>
          </item>
        </_items>
        <_size dataType="Int">1</_size>
      </compList>
      <compMap dataType="Struct" type="System.Collections.Generic.Dictionary`2[[System.Type],[Duality.Component]]" id="242567446" surrogate="true">
        <header />
        <body>
          <keys dataType="Array" type="System.Object[]" id="1691418478">
            <item dataType="Type" id="3854632016" value="Singularity.Duality.Examples.Components.GameManagerComponent" />
          </keys>
          <values dataType="Array" type="System.Object[]" id="2524557770">
            <item dataType="ObjectRef">1223978886</item>
          </values>
        </body>
      </compMap>
      <compTransform />
      <identifier dataType="Struct" type="System.Guid" surrogate="true">
        <header>
          <data dataType="Array" type="System.Byte[]" id="3524340062">iutc/O2KKEKrNSRGW/V1RQ==</data>
        </header>
        <body />
      </identifier>
      <initState dataType="Enum" type="Duality.InitState" name="Initialized" value="1" />
      <name dataType="String">GameManagerComponent</name>
      <parent />
      <prefabLink />
    </item>
    <item dataType="Struct" type="Duality.GameObject" id="3759254435">
      <active dataType="Bool">true</active>
      <children />
      <compList dataType="Struct" type="System.Collections.Generic.List`1[[Duality.Component]]" id="2439410577">
        <_items dataType="Array" type="Duality.Component[]" id="2935273966" length="4">
          <item dataType="Struct" type="Singularity.Duality.Examples.Components.GameDependenciesComponent" id="445930155">
            <active dataType="Bool">true</active>
            <gameobj dataType="ObjectRef">3759254435</gameobj>
          </item>
        </_items>
        <_size dataType="Int">1</_size>
      </compList>
      <compMap dataType="Struct" type="System.Collections.Generic.Dictionary`2[[System.Type],[Duality.Component]]" id="2234295968" surrogate="true">
        <header />
        <body>
          <keys dataType="Array" type="System.Object[]" id="3446565947">
            <item dataType="Type" id="3821977302" value="Singularity.Duality.Examples.Components.GameDependenciesComponent" />
          </keys>
          <values dataType="Array" type="System.Object[]" id="1996295720">
            <item dataType="ObjectRef">445930155</item>
          </values>
        </body>
      </compMap>
      <compTransform />
      <identifier dataType="Struct" type="System.Guid" surrogate="true">
        <header>
          <data dataType="Array" type="System.Byte[]" id="401159089">hc8dorQ3IkSqGFQdPBlk6w==</data>
        </header>
        <body />
      </identifier>
      <initState dataType="Enum" type="Duality.InitState" name="Initialized" value="1" />
      <name dataType="String">GameDependenciesComponent</name>
      <parent />
      <prefabLink />
    </item>
    <item dataType="Struct" type="Duality.GameObject" id="3082649165">
      <active dataType="Bool">true</active>
      <children />
      <compList dataType="Struct" type="System.Collections.Generic.List`1[[Duality.Component]]" id="1886360191">
        <_items dataType="Array" type="Duality.Component[]" id="158670638" length="4">
          <item dataType="Struct" type="Singularity.Duality.Examples.Components.ExampleComponent" id="558334838">
            <_x003C_GameManager_x003E_k__BackingField />
            <_x003C_Pathfinder_x003E_k__BackingField />
            <active dataType="Bool">true</active>
            <gameobj dataType="ObjectRef">3082649165</gameobj>
          </item>
        </_items>
        <_size dataType="Int">1</_size>
      </compList>
      <compMap dataType="Struct" type="System.Collections.Generic.Dictionary`2[[System.Type],[Duality.Component]]" id="1535210848" surrogate="true">
        <header />
        <body>
          <keys dataType="Array" type="System.Object[]" id="919881141">
            <item dataType="Type" id="2111030006" value="Singularity.Duality.Examples.Components.ExampleComponent" />
          </keys>
          <values dataType="Array" type="System.Object[]" id="760418120">
            <item dataType="ObjectRef">558334838</item>
          </values>
        </body>
      </compMap>
      <compTransform />
      <identifier dataType="Struct" type="System.Guid" surrogate="true">
        <header>
          <data dataType="Array" type="System.Byte[]" id="2522660095">RRY8Ym/fREe/tada9uKobg==</data>
        </header>
        <body />
      </identifier>
      <initState dataType="Enum" type="Duality.InitState" name="Initialized" value="1" />
      <name dataType="String">ExampleComponent</name>
      <parent />
      <prefabLink />
    </item>
  </serializeObj>
  <visibilityStrategy dataType="Struct" type="Duality.Components.DefaultRendererVisibilityStrategy" id="2035693768" />
</root>
<!-- XmlFormatterBase Document Separator -->
