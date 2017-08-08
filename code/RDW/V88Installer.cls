Include %occInclude

Class RDW.V88Installer
{

XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>

  <Namespace Name="mia" Create="yes" Code="mia-rou" Data="mia-rou">
    <Configuration>
      <Database Name="mia-rou" Create="yes" Dir="/cachedb/v88/mia/rou/"/>
      <Database Name="mia-vaa" Create="yes" Dir="/cachedb/v88/mia/vaa/"/>
      <Database Name="mia-vbb" Create="yes" Dir="/cachedb/v88/mia/vbb/"/>
      <Database Name="mia-vcc" Create="yes" Dir="/cachedb/v88/mia/vcc/"/>
      <Database Name="mia-vdd" Create="yes" Dir="/cachedb/v88/mia/vdd/"/>
      <Database Name="mia-vee" Create="yes" Dir="/cachedb/v88/mia/vee/"/>
      <Database Name="mia-vff" Create="yes" Dir="/cachedb/v88/mia/vff/"/>
      <Database Name="mia-vgg" Create="yes" Dir="/cachedb/v88/mia/vgg/"/>
      <Database Name="mia-vhh" Create="yes" Dir="/cachedb/v88/mia/vhh/"/>
      <Database Name="mia-vii" Create="yes" Dir="/cachedb/v88/mia/vii/"/>
      <Database Name="mia-vjj" Create="yes" Dir="/cachedb/v88/mia/vjj/"/>
      <GlobalMapping Global="%Z*" From="MIA-VEE" />
      <GlobalMapping Global="A*" From="MIA-VDD" />
      <GlobalMapping Global="B*" From="MIA-VAA" />
      <GlobalMapping Global="C*" From="MIA-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="MIA-VAA" />
      <GlobalMapping Global="E*" From="MIA-VBB" />
      <GlobalMapping Global="F*" From="MIA-VBB" />
      <GlobalMapping Global="G*" From="MIA-VBB" />
      <GlobalMapping Global="H*" From="MIA-VBB" />
      <GlobalMapping Global="I*" From="MIA-VBB" />
      <GlobalMapping Global="J*" From="MIA-VBB" />
      <GlobalMapping Global="K*" From="MIA-VBB" />
      <GlobalMapping Global="L*" From="MIA-VCC" />
      <GlobalMapping Global="M*" From="MIA-VCC" />
      <GlobalMapping Global="N*" From="MIA-VCC" />
      <GlobalMapping Global="O*" From="MIA-VII" />
      <GlobalMapping Global="OR" From="MIA-VGG" />
      <GlobalMapping Global="P*" From="MIA-VCC" />
      <GlobalMapping Global="PS*" From="MIA-VFF" />
      <GlobalMapping Global="PXRMINDX" From="MIA-VHH" />
      <GlobalMapping Global="Q*" From="MIA-VDD" />
      <GlobalMapping Global="R*" From="MIA-VDD" />
      <GlobalMapping Global="S*" From="MIA-VDD" />
      <GlobalMapping Global="T*" From="MIA-VJJ" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="MIA-VDD" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="MIA-VDD" />
      <GlobalMapping Global="W*" From="MIA-VEE" />
      <GlobalMapping Global="X*" From="MIA-VEE" />
      <GlobalMapping Global="Y*" From="MIA-VEE" />
      <GlobalMapping Global="Z*" From="MIA-VEE" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="nfl" Create="yes" Code="nfl-rou" Data="nfl-rou">
    <Configuration>
      <Database Name="nfl-rou" Create="yes" Dir="/cachedb/v88/nfl/rou/"/>
      <Database Name="nfl-sql" Create="yes" Dir="/cachedb/v88/nfl/sql/"/>
      <Database Name="nfl-vaa" Create="yes" Dir="/cachedb/v88/nfl/vaa/"/>
      <Database Name="nfl-vbb" Create="yes" Dir="/cachedb/v88/nfl/vbb/"/>
      <Database Name="nfl-vcc" Create="yes" Dir="/cachedb/v88/nfl/vcc/"/>
      <Database Name="nfl-vdd" Create="yes" Dir="/cachedb/v88/nfl/vdd/"/>
      <Database Name="nfl-vee" Create="yes" Dir="/cachedb/v88/nfl/vee/"/>
      <Database Name="nfl-vff" Create="yes" Dir="/cachedb/v88/nfl/vff/"/>
      <Database Name="nfl-vgg" Create="yes" Dir="/cachedb/v88/nfl/vgg/"/>
      <Database Name="nfl-vhh" Create="yes" Dir="/cachedb/v88/nfl/vhh/"/>
      <Database Name="nfl-vii" Create="yes" Dir="/cachedb/v88/nfl/vii/"/>
      <Database Name="nfl-vjj" Create="yes" Dir="/cachedb/v88/nfl/vjj/"/>
      <GlobalMapping Global="%Z*" From="NFL-VGG" />
      <GlobalMapping Global="A*" From="NFL-VAA" />
      <GlobalMapping Global="B*" From="NFL-VAA" />
      <GlobalMapping Global="C*" From="NFL-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="NFL-VAA" />
      <GlobalMapping Global="E*" From="NFL-VBB" />
      <GlobalMapping Global="F*" From="NFL-VBB" />
      <GlobalMapping Global="G*" From="NFL-VBB" />
      <GlobalMapping Global="H*" From="NFL-VCC" />
      <GlobalMapping Global="I*" From="NFL-VCC" />
      <GlobalMapping Global="J*" From="NFL-VCC" />
      <GlobalMapping Global="K*" From="NFL-VCC" />
      <GlobalMapping Global="L*" From="NFL-VCC" />
      <GlobalMapping Global="M*" From="NFL-VDD" />
      <GlobalMapping Global="MDD" From="NFL-VDD" />
      <GlobalMapping Global="MDS" From="NFL-VDD" />
      <GlobalMapping Global="N*" From="NFL-VDD" />
      <GlobalMapping Global="O*" From="NFL-VEE" />
      <GlobalMapping Global="OR" From="NFL-VII" />
      <GlobalMapping Global="P*" From="NFL-VDD" />
      <GlobalMapping Global="PS*" From="NFL-VFF" />
      <GlobalMapping Global="PXRMINDX" From="NFL-VJJ" />
      <GlobalMapping Global="Q*" From="NFL-VDD" />
      <GlobalMapping Global="R*" From="NFL-VDD" />
      <GlobalMapping Global="S*" From="NFL-VDD" />
      <GlobalMapping Global="T*" From="NFL-VHH" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="NFL-VGG" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="NFL-VGG" />
      <GlobalMapping Global="W*" From="NFL-VGG" />
      <GlobalMapping Global="X*" From="NFL-VGG" />
      <GlobalMapping Global="Y*" From="NFL-VGG" />
      <GlobalMapping Global="Z*" From="NFL-VGG" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="orl" Create="yes" Code="orl-rou" Data="orl-rou">
    <Configuration>
      <Database Name="orl-rou" Create="yes" Dir="/cachedb/v88/orl/rou/"/>
      <Database Name="orl-vaa" Create="yes" Dir="/cachedb/v88/orl/vaa/"/>
      <Database Name="orl-vbb" Create="yes" Dir="/cachedb/v88/orl/vbb/"/>
      <Database Name="orl-vcc" Create="yes" Dir="/cachedb/v88/orl/vcc/"/>
      <Database Name="orl-vdd" Create="yes" Dir="/cachedb/v88/orl/vdd/"/>
      <Database Name="orl-vee" Create="yes" Dir="/cachedb/v88/orl/vee/"/>
      <Database Name="orl-vff" Create="yes" Dir="/cachedb/v88/orl/vff/"/>
      <Database Name="orl-vgg" Create="yes" Dir="/cachedb/v88/orl/vgg/"/>
      <Database Name="orl-vhh" Create="yes" Dir="/cachedb/v88/orl/vhh/"/>
      <GlobalMapping Global="%Z*" From="ORL-VDD" />
      <GlobalMapping Global="A*" From="ORL-VAA" />
      <GlobalMapping Global="B*" From="ORL-VAA" />
      <GlobalMapping Global="C*" From="ORL-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="ORL-VAA" />
      <GlobalMapping Global="E*" From="ORL-VBB" />
      <GlobalMapping Global="F*" From="ORL-VBB" />
      <GlobalMapping Global="G*" From="ORL-VBB" />
      <GlobalMapping Global="H*" From="ORL-VBB" />
      <GlobalMapping Global="I*" From="ORL-VCC" />
      <GlobalMapping Global="J*" From="ORL-VCC" />
      <GlobalMapping Global="K*" From="ORL-VCC" />
      <GlobalMapping Global="L*" From="ORL-VCC" />
      <GlobalMapping Global="M*" From="ORL-VDD" />
      <GlobalMapping Global="N*" From="ORL-VDD" />
      <GlobalMapping Global="O*" From="ORL-VEE" />
      <GlobalMapping Global="P*" From="ORL-VFF" />
      <GlobalMapping Global="Q*" From="ORL-VHH" />
      <GlobalMapping Global="R*" From="ORL-VDD" />
      <GlobalMapping Global="S*" From="ORL-VDD" />
      <GlobalMapping Global="T*" From="ORL-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="ORL-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="ORL-VHH" />
      <GlobalMapping Global="W*" From="ORL-VHH" />
      <GlobalMapping Global="X*" From="ORL-VHH" />
      <GlobalMapping Global="Y*" From="ORL-VDD" />
      <GlobalMapping Global="Z*" From="ORL-VDD" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="wpb" Create="yes" Code="wpb-rou" Data="wpb-rou">
    <Configuration>
      <Database Name="wpb-rou" Create="yes" Dir="/cachedb/v88/wpb/rou/"/>
      <Database Name="wpb-vaa" Create="yes" Dir="/cachedb/v88/wpb/vaa/"/>
      <Database Name="wpb-vbb" Create="yes" Dir="/cachedb/v88/wpb/vbb/"/>
      <Database Name="wpb-vcc" Create="yes" Dir="/cachedb/v88/wpb/vcc/"/>
      <Database Name="wpb-vdd" Create="yes" Dir="/cachedb/v88/wpb/vdd/"/>
      <Database Name="wpb-vee" Create="yes" Dir="/cachedb/v88/wpb/vee/"/>
      <Database Name="wpb-vff" Create="yes" Dir="/cachedb/v88/wpb/vff/"/>
      <Database Name="wpb-vgg" Create="yes" Dir="/cachedb/v88/wpb/vgg/"/>
      <Database Name="wpb-vhh" Create="yes" Dir="/cachedb/v88/wpb/vhh/"/>
      <Database Name="wpb-vii" Create="yes" Dir="/cachedb/v88/wpb/vii/"/>
      <Database Name="wpb-vjj" Create="yes" Dir="/cachedb/v88/wpb/vjj/"/>
      <GlobalMapping Global="%Z*" From="WPB-VII" />
      <GlobalMapping Global="A*" From="WPB-VAA" />
      <GlobalMapping Global="B*" From="WPB-VAA" />
      <GlobalMapping Global="C*" From="WPB-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="WPB-VAA" />
      <GlobalMapping Global="E*" From="WPB-VAA" />
      <GlobalMapping Global="F*" From="WPB-VAA" />
      <GlobalMapping Global="G*" From="WPB-VBB" />
      <GlobalMapping Global="H*" From="WPB-VBB" />
      <GlobalMapping Global="I*" From="WPB-VBB" />
      <GlobalMapping Global="J*" From="WPB-VBB" />
      <GlobalMapping Global="K*" From="WPB-VBB" />
      <GlobalMapping Global="L*" From="WPB-VCC" />
      <GlobalMapping Global="M*" From="WPB-VII" />
      <GlobalMapping Global="N*" From="WPB-VCC" />
      <GlobalMapping Global="O*" From="WPB-VFF" />
      <GlobalMapping Global="OR" From="WPB-VGG" />
      <GlobalMapping Global="P*" From="WPB-VDD" />
      <GlobalMapping Global="PS*" From="WPB-VEE" />
      <GlobalMapping Global="PXRMINDX" From="WPB-VJJ" />
      <GlobalMapping Global="Q*" From="WPB-VII" />
      <GlobalMapping Global="R*" From="WPB-VII" />
      <GlobalMapping Global="S*" From="WPB-VCC" />
      <GlobalMapping Global="T*" From="WPB-VHH" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="WPB-VCC" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="WPB-VII" />
      <GlobalMapping Global="W*" From="WPB-VII" />
      <GlobalMapping Global="X*" From="WPB-VII" />
      <GlobalMapping Global="Y*" From="WPB-VII" />
      <GlobalMapping Global="Z*" From="WPB-VII" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

</Manifest>
}

/// This is a method generator whose code is generated by XGL.
ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, 
   pInstaller As %Installer.Installer, 
   pLogger As %Installer.AbstractLogger) 
   As %Status [ CodeMode = objectgenerator, Internal ]
{
    #; Let our XGL document generate code for this method. 
    Quit ##class(%Installer.Manifest).%Generate(%compiledclass, 
    %code, "SimpleManifest")
}


}