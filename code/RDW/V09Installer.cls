Include %occInclude

Class RDW.V09Installer
{

XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>

  <Namespace Name="hun" Create="yes" Code="hun-rou" Data="hun-rou">
    <Configuration>
      <Database Name="hun-rou" Create="yes" Dir="/cachedb/v09/hun/rou/"/>
      <Database Name="hun-vaa" Create="yes" Dir="/cachedb/v09/hun/vaa/"/>
      <Database Name="hun-vbb" Create="yes" Dir="/cachedb/v09/hun/vbb/"/>
      <Database Name="hun-vcc" Create="yes" Dir="/cachedb/v09/hun/vcc/"/>
      <Database Name="hun-vdd" Create="yes" Dir="/cachedb/v09/hun/vdd/"/>
      <Database Name="hun-vee" Create="yes" Dir="/cachedb/v09/hun/vee/"/>
      <Database Name="hun-vff" Create="yes" Dir="/cachedb/v09/hun/vff/"/>
      <Database Name="hun-vgg" Create="yes" Dir="/cachedb/v09/hun/vgg/"/>
      <Database Name="hun-vhh" Create="yes" Dir="/cachedb/v09/hun/vhh/"/>
      <GlobalMapping Global="%Z*" From="HUN-VGG" />
      <GlobalMapping Global="A*" From="HUN-VAA" />
      <GlobalMapping Global="B*" From="HUN-VAA" />
      <GlobalMapping Global="C*" From="HUN-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="HUN-VAA" />
      <GlobalMapping Global="E*" From="HUN-VAA" />
      <GlobalMapping Global="F*" From="HUN-VAA" />
      <GlobalMapping Global="G*" From="HUN-VAA" />
      <GlobalMapping Global="H*" From="HUN-VBB" />
      <GlobalMapping Global="I*" From="HUN-VBB" />
      <GlobalMapping Global="J*" From="HUN-VBB" />
      <GlobalMapping Global="K*" From="HUN-VBB" />
      <GlobalMapping Global="L*" From="HUN-VBB" />
      <GlobalMapping Global="M*" From="HUN-VCC" />
      <GlobalMapping Global="N*" From="HUN-VCC" />
      <GlobalMapping Global="O*" From="HUN-VDD" />
      <GlobalMapping Global="OR" From="HUN-VFF" />
      <GlobalMapping Global="P*" From="HUN-VCC" />
      <GlobalMapping Global="PR*" From="HUN-VGG" />
      <GlobalMapping Global="PXRMINDX" From="HUN-VHH" />
      <GlobalMapping Global="Q*" From="HUN-VCC" />
      <GlobalMapping Global="R*" From="HUN-VFF" />
      <GlobalMapping Global="S*" From="HUN-VCC" />
      <GlobalMapping Global="T*" From="HUN-VEE" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="HUN-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="HUN-VBB" />
      <GlobalMapping Global="W*" From="HUN-VFF" />
      <GlobalMapping Global="X*" From="HUN-VGG" />
      <GlobalMapping Global="Y*" From="HUN-VGG" />
      <GlobalMapping Global="Z*" From="HUN-VGG" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="lex" Create="yes" Code="lex-rou" Data="lex-rou">
    <Configuration>
      <Database Name="lex-rou" Create="yes" Dir="/cachedb/v09/lex/rou/"/>
      <Database Name="lex-vaa" Create="yes" Dir="/cachedb/v09/lex/vaa/"/>
      <Database Name="lex-vbb" Create="yes" Dir="/cachedb/v09/lex/vbb/"/>
      <Database Name="lex-vcc" Create="yes" Dir="/cachedb/v09/lex/vcc/"/>
      <Database Name="lex-vdd" Create="yes" Dir="/cachedb/v09/lex/vdd/"/>
      <Database Name="lex-vee" Create="yes" Dir="/cachedb/v09/lex/vee/"/>
      <Database Name="lex-vff" Create="yes" Dir="/cachedb/v09/lex/vff/"/>
      <Database Name="lex-vgg" Create="yes" Dir="/cachedb/v09/lex/vgg/"/>
      <Database Name="lex-vhh" Create="yes" Dir="/cachedb/v09/lex/vhh/"/>
      <Database Name="lex-vii" Create="yes" Dir="/cachedb/v09/lex/vii/"/>
      <Database Name="lex-vjj" Create="yes" Dir="/cachedb/v09/lex/vjj/"/>
      <GlobalMapping Global="%Z*" From="LEX-VDD" />
      <GlobalMapping Global="A*" From="LEX-VAA" />
      <GlobalMapping Global="B*" From="LEX-VAA" />
      <GlobalMapping Global="C*" From="LEX-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="LEX-VAA" />
      <GlobalMapping Global="E*" From="LEX-VBB" />
      <GlobalMapping Global="F*" From="LEX-VBB" />
      <GlobalMapping Global="G*" From="LEX-VCC" />
      <GlobalMapping Global="H*" From="LEX-VBB" />
      <GlobalMapping Global="I*" From="LEX-VBB" />
      <GlobalMapping Global="J*" From="LEX-VBB" />
      <GlobalMapping Global="K*" From="LEX-VBB" />
      <GlobalMapping Global="L*" From="LEX-VCC" />
      <GlobalMapping Global="M*" From="LEX-VCC" />
      <GlobalMapping Global="N*" From="LEX-VCC" />
      <GlobalMapping Global="O*" From="LEX-VHH" />
      <GlobalMapping Global="OR" From="LEX-VII" />
      <GlobalMapping Global="P*" From="LEX-VEE" />
      <GlobalMapping Global="PS*" From="LEX-VEE" />
      <GlobalMapping Global="PXRMINDX" From="LEX-VJJ" />
      <GlobalMapping Global="Q*" From="LEX-VDD" />
      <GlobalMapping Global="R*" From="LEX-VBB" />
      <GlobalMapping Global="S*" From="LEX-VDD" />
      <GlobalMapping Global="T*" From="LEX-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="LEX-VDD" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="LEX-VCC" />
      <GlobalMapping Global="W*" From="LEX-VCC" />
      <GlobalMapping Global="X*" From="LEX-VFF" />
      <GlobalMapping Global="Y*" From="LEX-VCC" />
      <GlobalMapping Global="Z*" From="LEX-VCC" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="lou" Create="yes" Code="lou-rou" Data="lou-rou">
    <Configuration>
      <Database Name="lou-rou" Create="yes" Dir="/cachedb/v09/lou/rou/"/>
      <Database Name="lou-vaa" Create="yes" Dir="/cachedb/v09/lou/vaa/"/>
      <Database Name="lou-vbb" Create="yes" Dir="/cachedb/v09/lou/vbb/"/>
      <Database Name="lou-vcc" Create="yes" Dir="/cachedb/v09/lou/vcc/"/>
      <Database Name="lou-vdd" Create="yes" Dir="/cachedb/v09/lou/vdd/"/>
      <Database Name="lou-vee" Create="yes" Dir="/cachedb/v09/lou/vee/"/>
      <Database Name="lou-vff" Create="yes" Dir="/cachedb/v09/lou/vff/"/>
      <Database Name="lou-vgg" Create="yes" Dir="/cachedb/v09/lou/vgg/"/>
      <Database Name="lou-vhh" Create="yes" Dir="/cachedb/v09/lou/vhh/"/>
      <GlobalMapping Global="%Z*" From="LOU-VBB" />
      <GlobalMapping Global="A*" From="LOU-VAA" />
      <GlobalMapping Global="B*" From="LOU-VAA" />
      <GlobalMapping Global="C*" From="LOU-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="LOU-VAA" />
      <GlobalMapping Global="E*" From="LOU-VBB" />
      <GlobalMapping Global="F*" From="LOU-VBB" />
      <GlobalMapping Global="G*" From="LOU-VBB" />
      <GlobalMapping Global="H*" From="LOU-VCC" />
      <GlobalMapping Global="I*" From="LOU-VCC" />
      <GlobalMapping Global="J*" From="LOU-VCC" />
      <GlobalMapping Global="K*" From="LOU-VCC" />
      <GlobalMapping Global="L*" From="LOU-VBB" />
      <GlobalMapping Global="M*" From="LOU-VHH" />
      <GlobalMapping Global="N*" From="LOU-VAA" />
      <GlobalMapping Global="O*" From="LOU-VEE" />
      <GlobalMapping Global="OR" From="LOU-VGG" />
      <GlobalMapping Global="P*" From="LOU-VEE" />
      <GlobalMapping Global="PS*" From="LOU-VGG" />
      <GlobalMapping Global="PXRMINDX" From="LOU-VDD" />
      <GlobalMapping Global="Q*" From="LOU-VFF" />
      <GlobalMapping Global="R*" From="LOU-VFF" />
      <GlobalMapping Global="S*" From="LOU-VCC" />
      <GlobalMapping Global="T*" From="LOU-VFF" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="LOU-VAA" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="LOU-VAA" />
      <GlobalMapping Global="W*" From="LOU-VAA" />
      <GlobalMapping Global="X*" From="LOU-VCC" />
      <GlobalMapping Global="Y*" From="LOU-VBB" />
      <GlobalMapping Global="Z*" From="LOU-VBB" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="mem" Create="yes" Code="mem-rou" Data="mem-rou">
    <Configuration>
      <Database Name="mem-rou" Create="yes" Dir="/cachedb/v09/mem/rou/"/>
      <Database Name="mem-vaa" Create="yes" Dir="/cachedb/v09/mem/vaa/"/>
      <Database Name="mem-vbb" Create="yes" Dir="/cachedb/v09/mem/vbb/"/>
      <Database Name="mem-vcc" Create="yes" Dir="/cachedb/v09/mem/vcc/"/>
      <Database Name="mem-vdd" Create="yes" Dir="/cachedb/v09/mem/vdd/"/>
      <Database Name="mem-vee" Create="yes" Dir="/cachedb/v09/mem/vee/"/>
      <Database Name="mem-vff" Create="yes" Dir="/cachedb/v09/mem/vff/"/>
      <Database Name="mem-vgg" Create="yes" Dir="/cachedb/v09/mem/vgg/"/>
      <Database Name="mem-vhh" Create="yes" Dir="/cachedb/v09/mem/vhh/"/>
      <Database Name="mem-vii" Create="yes" Dir="/cachedb/v09/mem/vii/"/>
      <Database Name="mem-vjj" Create="yes" Dir="/cachedb/v09/mem/vjj/"/>
      <Database Name="mem-vkk" Create="yes" Dir="/cachedb/v09/mem/vkk/"/>
      <Database Name="mem-vll" Create="yes" Dir="/cachedb/v09/mem/vll/"/>
      <GlobalMapping Global="%Z*" From="MEM-VDD" />
      <GlobalMapping Global="A*" From="MEM-VHH" />
      <GlobalMapping Global="B*" From="MEM-VAA" />
      <GlobalMapping Global="C*" From="MEM-VBB" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="MEM-VJJ" />
      <GlobalMapping Global="E*" From="MEM-VEE" />
      <GlobalMapping Global="F*" From="MEM-VJJ" />
      <GlobalMapping Global="G*" From="MEM-VDD" />
      <GlobalMapping Global="H*" From="MEM-VFF" />
      <GlobalMapping Global="I*" From="MEM-VGG" />
      <GlobalMapping Global="J*" From="MEM-VII" />
      <GlobalMapping Global="K*" From="MEM-VJJ" />
      <GlobalMapping Global="L*" From="MEM-VLL" />
      <GlobalMapping Global="M*" From="MEM-VII" />
      <GlobalMapping Global="N*" From="MEM-VJJ" />
      <GlobalMapping Global="O*" From="MEM-VDD" />
      <GlobalMapping Global="OR" From="MEM-VCC" />
      <GlobalMapping Global="P*" From="MEM-VII" />
      <GlobalMapping Global="PS*" From="MEM-VBB" />
      <GlobalMapping Global="PXRMINDX" From="MEM-VKK" />
      <GlobalMapping Global="Q*" From="MEM-VII" />
      <GlobalMapping Global="R*" From="MEM-VJJ" />
      <GlobalMapping Global="S*" From="MEM-VGG" />
      <GlobalMapping Global="T*" From="MEM-VAA" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="MEM-VII" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="MEM-VCC" />
      <GlobalMapping Global="W*" From="MEM-VII" />
      <GlobalMapping Global="X*" From="MEM-VEE" />
      <GlobalMapping Global="Y*" From="MEM-VJJ" />
      <GlobalMapping Global="Z*" From="MEM-VJJ" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="mou" Create="yes" Code="mou-rou" Data="mou-rou">
    <Configuration>
      <Database Name="mou-rou" Create="yes" Dir="/cachedb/v09/mou/rou/"/>
      <Database Name="mou-vaa" Create="yes" Dir="/cachedb/v09/mou/vaa/"/>
      <Database Name="mou-vbb" Create="yes" Dir="/cachedb/v09/mou/vbb/"/>
      <Database Name="mou-vcc" Create="yes" Dir="/cachedb/v09/mou/vcc/"/>
      <Database Name="mou-vdd" Create="yes" Dir="/cachedb/v09/mou/vdd/"/>
      <Database Name="mou-vee" Create="yes" Dir="/cachedb/v09/mou/vee/"/>
      <Database Name="mou-vff" Create="yes" Dir="/cachedb/v09/mou/vff/"/>
      <Database Name="mou-vgg" Create="yes" Dir="/cachedb/v09/mou/vgg/"/>
      <Database Name="mou-vhh" Create="yes" Dir="/cachedb/v09/mou/vhh/"/>
      <GlobalMapping Global="%Z*" From="MOU-VFF" />
      <GlobalMapping Global="A*" From="MOU-VAA" />
      <GlobalMapping Global="B*" From="MOU-VAA" />
      <GlobalMapping Global="C*" From="MOU-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="MOU-VAA" />
      <GlobalMapping Global="E*" From="MOU-VBB" />
      <GlobalMapping Global="F*" From="MOU-VAA" />
      <GlobalMapping Global="G*" From="MOU-VGG" />
      <GlobalMapping Global="H*" From="MOU-VCC" />
      <GlobalMapping Global="I*" From="MOU-VCC" />
      <GlobalMapping Global="J*" From="MOU-VCC" />
      <GlobalMapping Global="K*" From="MOU-VCC" />
      <GlobalMapping Global="L*" From="MOU-VCC" />
      <GlobalMapping Global="M*" From="MOU-VEE" />
      <GlobalMapping Global="N*" From="MOU-VEE" />
      <GlobalMapping Global="O*" From="MOU-VEE" />
      <GlobalMapping Global="OR" From="MOU-VFF" />
      <GlobalMapping Global="P*" From="MOU-VAA" />
      <GlobalMapping Global="PS*" From="MOU-VHH" />
      <GlobalMapping Global="PXRMINDX" From="MOU-VDD" />
      <GlobalMapping Global="Q*" From="MOU-VFF" />
      <GlobalMapping Global="R*" From="MOU-VFF" />
      <GlobalMapping Global="S*" From="MOU-VHH" />
      <GlobalMapping Global="T*" From="MOU-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="MOU-VEE" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="MOU-VBB" />
      <GlobalMapping Global="W*" From="MOU-VBB" />
      <GlobalMapping Global="X*" From="MOU-VFF" />
      <GlobalMapping Global="Y*" From="MOU-VFF" />
      <GlobalMapping Global="Z*" From="MOU-VFF" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="tvh" Create="yes" Code="tvh-rou" Data="tvh-rou">
    <Configuration>
      <Database Name="tvh-rou" Create="yes" Dir="/cachedb/v09/tvh/rou/"/>
      <Database Name="tvh-vaa" Create="yes" Dir="/cachedb/v09/tvh/vaa/"/>
      <Database Name="tvh-vbb" Create="yes" Dir="/cachedb/v09/tvh/vbb/"/>
      <Database Name="tvh-vcc" Create="yes" Dir="/cachedb/v09/tvh/vcc/"/>
      <Database Name="tvh-vdd" Create="yes" Dir="/cachedb/v09/tvh/vdd/"/>
      <Database Name="tvh-vee" Create="yes" Dir="/cachedb/v09/tvh/vee/"/>
      <Database Name="tvh-vff" Create="yes" Dir="/cachedb/v09/tvh/vff/"/>
      <Database Name="tvh-vgg" Create="yes" Dir="/cachedb/v09/tvh/vgg/"/>
      <Database Name="tvh-vhh" Create="yes" Dir="/cachedb/v09/tvh/vhh/"/>
      <Database Name="tvh-vii" Create="yes" Dir="/cachedb/v09/tvh/vii/"/>
      <GlobalMapping Global="%Z*" From="TVH-VDD" />
      <GlobalMapping Global="A*" From="TVH-VAA" />
      <GlobalMapping Global="B*" From="TVH-VAA" />
      <GlobalMapping Global="C*" From="TVH-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="TVH-VAA" />
      <GlobalMapping Global="E*" From="TVH-VBB" />
      <GlobalMapping Global="F*" From="TVH-VHH" />
      <GlobalMapping Global="G*" From="TVH-VHH" />
      <GlobalMapping Global="H*" From="TVH-VCC" />
      <GlobalMapping Global="I*" From="TVH-VHH" />
      <GlobalMapping Global="J*" From="TVH-VCC" />
      <GlobalMapping Global="K*" From="TVH-VCC" />
      <GlobalMapping Global="L*" From="TVH-VCC" />
      <GlobalMapping Global="M*" From="TVH-VDD" />
      <GlobalMapping Global="N*" From="TVH-VDD" />
      <GlobalMapping Global="O*" From="TVH-VEE" />
      <GlobalMapping Global="OR" From="TVH-VBB" />
      <GlobalMapping Global="P*" From="TVH-VFF" />
      <GlobalMapping Global="PXRMINDX" From="TVH-VII" />
      <GlobalMapping Global="Q*" From="TVH-VHH" />
      <GlobalMapping Global="R*" From="TVH-VCC" />
      <GlobalMapping Global="S*" From="TVH-VDD" />
      <GlobalMapping Global="T*" From="TVH-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="TVH-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="TVH-VHH" />
      <GlobalMapping Global="W*" From="TVH-VHH" />
      <GlobalMapping Global="X*" From="TVH-VHH" />
      <GlobalMapping Global="Y*" From="TVH-VDD" />
      <GlobalMapping Global="Z*" From="TVH-VDD" />
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