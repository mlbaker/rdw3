Include %occInclude

Class RDW.V10Installer
{

XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>

  <Namespace Name="cin" Create="yes" Code="cin-rou" Data="cin-rou">
    <Configuration>
      <Database Name="cin-rou" Create="yes" Dir="/cachedb/v10/cin/rou/"/>
      <Database Name="cin-sql" Create="yes" Dir="/cachedb/v10/cin/sql/"/>
      <Database Name="cin-vaa" Create="yes" Dir="/cachedb/v10/cin/vaa/"/>
      <Database Name="cin-vbb" Create="yes" Dir="/cachedb/v10/cin/vbb/"/>
      <Database Name="cin-vcc" Create="yes" Dir="/cachedb/v10/cin/vcc/"/>
      <Database Name="cin-vdd" Create="yes" Dir="/cachedb/v10/cin/vdd/"/>
      <Database Name="cin-vee" Create="yes" Dir="/cachedb/v10/cin/vee/"/>
      <Database Name="cin-vff" Create="yes" Dir="/cachedb/v10/cin/vff/"/>
      <Database Name="cin-vgg" Create="yes" Dir="/cachedb/v10/cin/vgg/"/>
      <Database Name="cin-vhh" Create="yes" Dir="/cachedb/v10/cin/vhh/"/>
      <Database Name="cin-vii" Create="yes" Dir="/cachedb/v10/cin/vii/"/>
      <Database Name="cin-vjj" Create="yes" Dir="/cachedb/v10/cin/vjj/"/>
      <GlobalMapping Global="%Z*" From="CIN-VBB" />
      <GlobalMapping Global="A*" From="CIN-VAA" />
      <GlobalMapping Global="B*" From="CIN-VAA" />
      <GlobalMapping Global="C*" From="CIN-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="CIN-VAA" />
      <GlobalMapping Global="E*" From="CIN-VBB" />
      <GlobalMapping Global="F*" From="CIN-VBB" />
      <GlobalMapping Global="G*" From="CIN-VBB" />
      <GlobalMapping Global="H*" From="CIN-VCC" />
      <GlobalMapping Global="I*" From="CIN-VCC" />
      <GlobalMapping Global="J*" From="CIN-VCC" />
      <GlobalMapping Global="K*" From="CIN-VCC" />
      <GlobalMapping Global="L*" From="CIN-VCC" />
      <GlobalMapping Global="M*" From="CIN-VDD" />
      <GlobalMapping Global="N*" From="CIN-VDD" />
      <GlobalMapping Global="O*" From="CIN-VDD" />
      <GlobalMapping Global="OR" From="CIN-VHH" />
      <GlobalMapping Global="P*" From="CIN-VEE" />
      <GlobalMapping Global="PS*" From="CIN-VGG" />
      <GlobalMapping Global="PXRMINDX" From="CIN-VII" />
      <GlobalMapping Global="Q*" From="CIN-VEE" />
      <GlobalMapping Global="R*" From="CIN-VEE" />
      <GlobalMapping Global="S*" From="CIN-VFF" />
      <GlobalMapping Global="T*" From="CIN-VJJ" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="CIN-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="CIN-VGG" />
      <GlobalMapping Global="W*" From="CIN-VGG" />
      <GlobalMapping Global="X*" From="CIN-VBB" />
      <GlobalMapping Global="Y*" From="CIN-VBB" />
      <GlobalMapping Global="Z*" From="CIN-VBB" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="cle" Create="yes" Code="cle-rou" Data="cle-rou">
    <Configuration>
      <Database Name="cle-rou" Create="yes" Dir="/cachedb/v10/cle/rou/"/>
      <Database Name="cle-sql" Create="yes" Dir="/cachedb/v10/cle/sql/"/>
      <Database Name="cle-vaa" Create="yes" Dir="/cachedb/v10/cle/vaa/"/>
      <Database Name="cle-vbb" Create="yes" Dir="/cachedb/v10/cle/vbb/"/>
      <Database Name="cle-vcc" Create="yes" Dir="/cachedb/v10/cle/vcc/"/>
      <Database Name="cle-vdd" Create="yes" Dir="/cachedb/v10/cle/vdd/"/>
      <Database Name="cle-vee" Create="yes" Dir="/cachedb/v10/cle/vee/"/>
      <Database Name="cle-vff" Create="yes" Dir="/cachedb/v10/cle/vff/"/>
      <Database Name="cle-vgg" Create="yes" Dir="/cachedb/v10/cle/vgg/"/>
      <Database Name="cle-vhh" Create="yes" Dir="/cachedb/v10/cle/vhh/"/>
      <Database Name="cle-vii" Create="yes" Dir="/cachedb/v10/cle/vii/"/>
      <GlobalMapping Global="%Z*" From="CLE-VDD" />
      <GlobalMapping Global="A*" From="CLE-VAA" />
      <GlobalMapping Global="B*" From="CLE-VAA" />
      <GlobalMapping Global="C*" From="CLE-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="CLE-VAA" />
      <GlobalMapping Global="E*" From="CLE-VHH" />
      <GlobalMapping Global="F*" From="CLE-VBB" />
      <GlobalMapping Global="G*" From="CLE-VDD" />
      <GlobalMapping Global="H*" From="CLE-VDD" />
      <GlobalMapping Global="I*" From="CLE-VCC" />
      <GlobalMapping Global="J*" From="CLE-VCC" />
      <GlobalMapping Global="K*" From="CLE-VCC" />
      <GlobalMapping Global="L*" From="CLE-VCC" />
      <GlobalMapping Global="M*" From="CLE-VDD" />
      <GlobalMapping Global="N*" From="CLE-VGG" />
      <GlobalMapping Global="O*" From="CLE-VEE" />
      <GlobalMapping Global="OR" From="CLE-VII" />
      <GlobalMapping Global="P*" From="CLE-VFF" />
      <GlobalMapping Global="PS*" From="CLE-VBB" />
      <GlobalMapping Global="PXRMINDX" From="CLE-VHH" />
      <GlobalMapping Global="Q*" From="CLE-VFF" />
      <GlobalMapping Global="R*" From="CLE-VBB" />
      <GlobalMapping Global="S*" From="CLE-VDD" />
      <GlobalMapping Global="T*" From="CLE-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="CLE-VGG" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="CLE-VFF" />
      <GlobalMapping Global="W*" From="CLE-VFF" />
      <GlobalMapping Global="X*" From="CLE-VFF" />
      <GlobalMapping Global="Y*" From="CLE-VFF" />
      <GlobalMapping Global="Z*" From="CLE-VDD" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="cll" Create="yes" Code="cll-rou" Data="cll-rou">
    <Configuration>
      <Database Name="cll-rou" Create="yes" Dir="/cachedb/v10/cll/rou/"/>
      <Database Name="cll-sql" Create="yes" Dir="/cachedb/v10/cll/sql/"/>
      <Database Name="cll-vaa" Create="yes" Dir="/cachedb/v10/cll/vaa/"/>
      <Database Name="cll-vbb" Create="yes" Dir="/cachedb/v10/cll/vbb/"/>
      <Database Name="cll-vcc" Create="yes" Dir="/cachedb/v10/cll/vcc/"/>
      <Database Name="cll-vdd" Create="yes" Dir="/cachedb/v10/cll/vdd/"/>
      <Database Name="cll-vee" Create="yes" Dir="/cachedb/v10/cll/vee/"/>
      <Database Name="cll-vff" Create="yes" Dir="/cachedb/v10/cll/vff/"/>
      <Database Name="cll-vgg" Create="yes" Dir="/cachedb/v10/cll/vgg/"/>
      <Database Name="cll-vhh" Create="yes" Dir="/cachedb/v10/cll/vhh/"/>
      <GlobalMapping Global="%Z*" From="CLL-VFF" />
      <GlobalMapping Global="A*" From="CLL-VAA" />
      <GlobalMapping Global="B*" From="CLL-VAA" />
      <GlobalMapping Global="C*" From="CLL-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="CLL-VAA" />
      <GlobalMapping Global="E*" From="CLL-VAA" />
      <GlobalMapping Global="F*" From="CLL-VAA" />
      <GlobalMapping Global="G*" From="CLL-VAA" />
      <GlobalMapping Global="H*" From="CLL-VBB" />
      <GlobalMapping Global="I*" From="CLL-VBB" />
      <GlobalMapping Global="J*" From="CLL-VBB" />
      <GlobalMapping Global="K*" From="CLL-VBB" />
      <GlobalMapping Global="L*" From="CLL-VBB" />
      <GlobalMapping Global="M*" From="CLL-VBB" />
      <GlobalMapping Global="N*" From="CLL-VBB" />
      <GlobalMapping Global="O*" From="CLL-VCC" />
      <GlobalMapping Global="OR" From="CLL-VDD" />
      <GlobalMapping Global="P*" From="CLL-VEE" />
      <GlobalMapping Global="PS*" From="CLL-VEE" />
      <GlobalMapping Global="PXRMINDX" From="CLL-VHH" />
      <GlobalMapping Global="Q*" From="CLL-VBB" />
      <GlobalMapping Global="R*" From="CLL-VFF" />
      <GlobalMapping Global="S*" From="CLL-VFF" />
      <GlobalMapping Global="T*" From="CLL-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="CLL-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="CLL-VFF" />
      <GlobalMapping Global="W*" From="CLL-VFF" />
      <GlobalMapping Global="X*" From="CLL-VFF" />
      <GlobalMapping Global="Y*" From="CLL-VFF" />
      <GlobalMapping Global="Z*" From="CLL-VFF" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="cos" Create="yes" Code="cos-rou" Data="cos-rou">
    <Configuration>
      <Database Name="cos-rou" Create="yes" Dir="/cachedb/v10/cos/rou/"/>
      <Database Name="cos-sql" Create="yes" Dir="/cachedb/v10/cos/sql/"/>
      <Database Name="cos-vaa" Create="yes" Dir="/cachedb/v10/cos/vaa/"/>
      <Database Name="cos-vbb" Create="yes" Dir="/cachedb/v10/cos/vbb/"/>
      <Database Name="cos-vcc" Create="yes" Dir="/cachedb/v10/cos/vcc/"/>
      <Database Name="cos-vdd" Create="yes" Dir="/cachedb/v10/cos/vdd/"/>
      <Database Name="cos-vee" Create="yes" Dir="/cachedb/v10/cos/vee/"/>
      <Database Name="cos-vff" Create="yes" Dir="/cachedb/v10/cos/vff/"/>
      <Database Name="cos-vgg" Create="yes" Dir="/cachedb/v10/cos/vgg/"/>
      <Database Name="cos-vhh" Create="yes" Dir="/cachedb/v10/cos/vhh/"/>
      <Database Name="cos-vii" Create="yes" Dir="/cachedb/v10/cos/vii/"/>
      <Database Name="cos-vjj" Create="yes" Dir="/cachedb/v10/cos/vjj/"/>
      <Database Name="cos-vkk" Create="yes" Dir="/cachedb/v10/cos/vkk/"/>
      <GlobalMapping Global="%Z*" From="COS-VFF" />
      <GlobalMapping Global="A:E" From="COS-VAA" />
      <GlobalMapping Global="AU*" From="COS-VJJ" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="E:LR" From="COS-VBB" />
      <GlobalMapping Global="IBCN*" From="COS-VFF" />
      <GlobalMapping Global="LEXM" From="COS-VKK" />
      <GlobalMapping Global="LR:PRC" From="COS-VCC" />
      <GlobalMapping Global="OR*" From="COS-VHH" />
      <GlobalMapping Global="PRC:PRCD" From="COS-VGG" />
      <GlobalMapping Global="PRCD:RC" From="COS-VDD" />
      <GlobalMapping Global="PXRMINDX" From="COS-VKK" />
      <GlobalMapping Global="RC:U" From="COS-VEE" />
      <GlobalMapping Global="TIU" From="COS-VII" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U:zzzz" From="COS-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="day" Create="yes" Code="day-rou" Data="day-rou">
    <Configuration>
      <Database Name="day-rou" Create="yes" Dir="/cachedb/v10/day/rou/"/>
      <Database Name="day-sql" Create="yes" Dir="/cachedb/v10/day/sql/"/>
      <Database Name="day-vaa" Create="yes" Dir="/cachedb/v10/day/vaa/"/>
      <Database Name="day-vbb" Create="yes" Dir="/cachedb/v10/day/vbb/"/>
      <Database Name="day-vcc" Create="yes" Dir="/cachedb/v10/day/vcc/"/>
      <Database Name="day-vdd" Create="yes" Dir="/cachedb/v10/day/vdd/"/>
      <Database Name="day-vee" Create="yes" Dir="/cachedb/v10/day/vee/"/>
      <Database Name="day-vff" Create="yes" Dir="/cachedb/v10/day/vff/"/>
      <Database Name="day-vgg" Create="yes" Dir="/cachedb/v10/day/vgg/"/>
      <Database Name="day-vhh" Create="yes" Dir="/cachedb/v10/day/vhh/"/>
      <GlobalMapping Global="%Z*" From="DAY-VFF" />
      <GlobalMapping Global="A*" From="DAY-VAA" />
      <GlobalMapping Global="B*" From="DAY-VAA" />
      <GlobalMapping Global="C*" From="DAY-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="DAY-VAA" />
      <GlobalMapping Global="E*" From="DAY-VAA" />
      <GlobalMapping Global="F*" From="DAY-VAA" />
      <GlobalMapping Global="G*" From="DAY-VAA" />
      <GlobalMapping Global="H*" From="DAY-VBB" />
      <GlobalMapping Global="HL*" From="DAY-VCC" />
      <GlobalMapping Global="I*" From="DAY-VBB" />
      <GlobalMapping Global="J*" From="DAY-VBB" />
      <GlobalMapping Global="K*" From="DAY-VBB" />
      <GlobalMapping Global="L*" From="DAY-VBB" />
      <GlobalMapping Global="M*" From="DAY-VBB" />
      <GlobalMapping Global="N*" From="DAY-VBB" />
      <GlobalMapping Global="O*" From="DAY-VDD" />
      <GlobalMapping Global="P*" From="DAY-VEE" />
      <GlobalMapping Global="PS*" From="DAY-VEE" />
      <GlobalMapping Global="PXRMINDX" From="DAY-VHH" />
      <GlobalMapping Global="Q*" From="DAY-VBB" />
      <GlobalMapping Global="R*" From="DAY-VFF" />
      <GlobalMapping Global="S*" From="DAY-VFF" />
      <GlobalMapping Global="T*" From="DAY-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="DAY-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="DAY-VFF" />
      <GlobalMapping Global="W*" From="DAY-VFF" />
      <GlobalMapping Global="X*" From="DAY-VFF" />
      <GlobalMapping Global="Y*" From="DAY-VFF" />
      <GlobalMapping Global="Z*" From="DAY-VFF" />
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