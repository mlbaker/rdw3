Include %occInclude

Class RDW.V11Installer
{

XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>

  <Namespace Name="ann" Create="yes" Code="ann-rou" Data="ann-rou">
    <Configuration>
      <Database Name="ann-rou" Create="yes" Dir="/cachedb/v11/ann/rou/"/>
      <Database Name="ann-vaa" Create="yes" Dir="/cachedb/v11/ann/vaa/"/>
      <Database Name="ann-vbb" Create="yes" Dir="/cachedb/v11/ann/vbb/"/>
      <Database Name="ann-vcc" Create="yes" Dir="/cachedb/v11/ann/vcc/"/>
      <Database Name="ann-vdd" Create="yes" Dir="/cachedb/v11/ann/vdd/"/>
      <Database Name="ann-vee" Create="yes" Dir="/cachedb/v11/ann/vee/"/>
      <Database Name="ann-vff" Create="yes" Dir="/cachedb/v11/ann/vff/"/>
      <Database Name="ann-vgg" Create="yes" Dir="/cachedb/v11/ann/vgg/"/>
      <Database Name="ann-vhh" Create="yes" Dir="/cachedb/v11/ann/vhh/"/>
      <Database Name="ann-vii" Create="yes" Dir="/cachedb/v11/ann/vii/"/>
      <Database Name="ann-vjj" Create="yes" Dir="/cachedb/v11/ann/vjj/"/>
      <GlobalMapping Global="%Z*" From="ANN-VHH" />
      <GlobalMapping Global="A*" From="ANN-VAA" />
      <GlobalMapping Global="B*" From="ANN-VAA" />
      <GlobalMapping Global="C*" From="ANN-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="ANN-VAA" />
      <GlobalMapping Global="E*" From="ANN-VAA" />
      <GlobalMapping Global="F*" From="ANN-VBB" />
      <GlobalMapping Global="G*" From="ANN-VBB" />
      <GlobalMapping Global="H*" From="ANN-VFF" />
      <GlobalMapping Global="I*" From="ANN-VBB" />
      <GlobalMapping Global="J*" From="ANN-VBB" />
      <GlobalMapping Global="K*" From="ANN-VBB" />
      <GlobalMapping Global="L*" From="ANN-VCC" />
      <GlobalMapping Global="M*" From="ANN-VAA" />
      <GlobalMapping Global="N*" From="ANN-VAA" />
      <GlobalMapping Global="O*" From="ANN-VDD" />
      <GlobalMapping Global="OR" From="ANN-VHH" />
      <GlobalMapping Global="P*" From="ANN-VBB" />
      <GlobalMapping Global="PR*" From="ANN-VGG" />
      <GlobalMapping Global="PXRMINDX" From="ANN-VII" />
      <GlobalMapping Global="Q*" From="ANN-VCC" />
      <GlobalMapping Global="R*" From="ANN-VCC" />
      <GlobalMapping Global="S*" From="ANN-VEE" />
      <GlobalMapping Global="T*" From="ANN-VFF" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="ANN-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="ANN-VFF" />
      <GlobalMapping Global="W*" From="ANN-VFF" />
      <GlobalMapping Global="X*" From="ANN-VEE" />
      <GlobalMapping Global="Y*" From="ANN-VHH" />
      <GlobalMapping Global="Z*" From="ANN-VHH" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="bac" Create="yes" Code="bac-rou" Data="bac-rou">
    <Configuration>
      <Database Name="bac-rou" Create="yes" Dir="/cachedb/v11/bac/rou/"/>
      <Database Name="bac-vaa" Create="yes" Dir="/cachedb/v11/bac/vaa/"/>
      <Database Name="bac-vbb" Create="yes" Dir="/cachedb/v11/bac/vbb/"/>
      <Database Name="bac-vcc" Create="yes" Dir="/cachedb/v11/bac/vcc/"/>
      <Database Name="bac-vdd" Create="yes" Dir="/cachedb/v11/bac/vdd/"/>
      <Database Name="bac-vee" Create="yes" Dir="/cachedb/v11/bac/vee/"/>
      <Database Name="bac-vff" Create="yes" Dir="/cachedb/v11/bac/vff/"/>
      <Database Name="bac-vgg" Create="yes" Dir="/cachedb/v11/bac/vgg/"/>
      <Database Name="bac-vhh" Create="yes" Dir="/cachedb/v11/bac/vhh/"/>
      <Database Name="bac-vii" Create="yes" Dir="/cachedb/v11/bac/vii/"/>
      <Database Name="bac-vjj" Create="yes" Dir="/cachedb/v11/bac/vjj/"/>
      <GlobalMapping Global="%Z*" From="BAC-VII" />
      <GlobalMapping Global="A*" From="BAC-VAA" />
      <GlobalMapping Global="B*" From="BAC-VAA" />
      <GlobalMapping Global="C*" From="BAC-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="BAC-VAA" />
      <GlobalMapping Global="E*" From="BAC-VBB" />
      <GlobalMapping Global="F*" From="BAC-VBB" />
      <GlobalMapping Global="G*" From="BAC-VBB" />
      <GlobalMapping Global="H*" From="BAC-VBB" />
      <GlobalMapping Global="I*" From="BAC-VBB" />
      <GlobalMapping Global="J*" From="BAC-VCC" />
      <GlobalMapping Global="K*" From="BAC-VCC" />
      <GlobalMapping Global="L*" From="BAC-VCC" />
      <GlobalMapping Global="M*" From="BAC-VCC" />
      <GlobalMapping Global="N*" From="BAC-VCC" />
      <GlobalMapping Global="O*" From="BAC-VEE" />
      <GlobalMapping Global="OR" From="BAC-VDD" />
      <GlobalMapping Global="P*" From="BAC-VFF" />
      <GlobalMapping Global="PS*" From="BAC-VFF" />
      <GlobalMapping Global="PXRMINDX" From="BAC-VJJ" />
      <GlobalMapping Global="Q*" From="BAC-VCC" />
      <GlobalMapping Global="R*" From="BAC-VCC" />
      <GlobalMapping Global="S*" From="BAC-VHH" />
      <GlobalMapping Global="T*" From="BAC-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="BAC-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="BAC-VHH" />
      <GlobalMapping Global="W*" From="BAC-VHH" />
      <GlobalMapping Global="X*" From="BAC-VII" />
      <GlobalMapping Global="Y*" From="BAC-VII" />
      <GlobalMapping Global="Z*" From="BAC-VII" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="dan" Create="yes" Code="dan-rou" Data="dan-rou">
    <Configuration>
      <Database Name="dan-rou" Create="yes" Dir="/cachedb/v11/dan/rou/"/>
      <Database Name="dan-vaa" Create="yes" Dir="/cachedb/v11/dan/vaa/"/>
      <Database Name="dan-vbb" Create="yes" Dir="/cachedb/v11/dan/vbb/"/>
      <Database Name="dan-vcc" Create="yes" Dir="/cachedb/v11/dan/vcc/"/>
      <Database Name="dan-vdd" Create="yes" Dir="/cachedb/v11/dan/vdd/"/>
      <Database Name="dan-vee" Create="yes" Dir="/cachedb/v11/dan/vee/"/>
      <Database Name="dan-vff" Create="yes" Dir="/cachedb/v11/dan/vff/"/>
      <Database Name="dan-vgg" Create="yes" Dir="/cachedb/v11/dan/vgg/"/>
      <Database Name="dan-vhh" Create="yes" Dir="/cachedb/v11/dan/vhh/"/>
      <Database Name="dan-vii" Create="yes" Dir="/cachedb/v11/dan/vii/"/>
      <Database Name="dan-vjj" Create="yes" Dir="/cachedb/v11/dan/vjj/"/>
      <GlobalMapping Global="%Z*" From="DAN-VHH" />
      <GlobalMapping Global="A*" From="DAN-VAA" />
      <GlobalMapping Global="B*" From="DAN-VAA" />
      <GlobalMapping Global="C*" From="DAN-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="DAN-VAA" />
      <GlobalMapping Global="E*" From="DAN-VBB" />
      <GlobalMapping Global="F*" From="DAN-VBB" />
      <GlobalMapping Global="G*" From="DAN-VBB" />
      <GlobalMapping Global="H*" From="DAN-VBB" />
      <GlobalMapping Global="I*" From="DAN-VBB" />
      <GlobalMapping Global="J*" From="DAN-VCC" />
      <GlobalMapping Global="K*" From="DAN-VCC" />
      <GlobalMapping Global="L*" From="DAN-VCC" />
      <GlobalMapping Global="M*" From="DAN-VCC" />
      <GlobalMapping Global="N*" From="DAN-VCC" />
      <GlobalMapping Global="O*" From="DAN-VDD" />
      <GlobalMapping Global="OR" From="DAN-VEE" />
      <GlobalMapping Global="P*" From="DAN-VFF" />
      <GlobalMapping Global="PS*" From="DAN-VGG" />
      <GlobalMapping Global="PXRMINDX" From="DAN-VJJ" />
      <GlobalMapping Global="Q*" From="DAN-VCC" />
      <GlobalMapping Global="R*" From="DAN-VCC" />
      <GlobalMapping Global="S*" From="DAN-VCC" />
      <GlobalMapping Global="T*" From="DAN-VII" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="DAN-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="DAN-VHH" />
      <GlobalMapping Global="W*" From="DAN-VHH" />
      <GlobalMapping Global="X*" From="DAN-VHH" />
      <GlobalMapping Global="Y*" From="DAN-VHH" />
      <GlobalMapping Global="Z*" From="DAN-VHH" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="det" Create="yes" Code="det-rou" Data="det-rou">
    <Configuration>
      <Database Name="det-rou" Create="yes" Dir="/cachedb/v11/det/rou/"/>
      <Database Name="det-vaa" Create="yes" Dir="/cachedb/v11/det/vaa/"/>
      <Database Name="det-vbb" Create="yes" Dir="/cachedb/v11/det/vbb/"/>
      <Database Name="det-vcc" Create="yes" Dir="/cachedb/v11/det/vcc/"/>
      <Database Name="det-vdd" Create="yes" Dir="/cachedb/v11/det/vdd/"/>
      <Database Name="det-vee" Create="yes" Dir="/cachedb/v11/det/vee/"/>
      <Database Name="det-vff" Create="yes" Dir="/cachedb/v11/det/vff/"/>
      <Database Name="det-vgg" Create="yes" Dir="/cachedb/v11/det/vgg/"/>
      <Database Name="det-vhh" Create="yes" Dir="/cachedb/v11/det/vhh/"/>
      <Database Name="det-vii" Create="yes" Dir="/cachedb/v11/det/vii/"/>
      <Database Name="det-vjj" Create="yes" Dir="/cachedb/v11/det/vjj/"/>
      <GlobalMapping Global="%Z*" From="DET-VGG" />
      <GlobalMapping Global="A*" From="DET-VAA" />
      <GlobalMapping Global="B*" From="DET-VAA" />
      <GlobalMapping Global="C*" From="DET-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="DET-VBB" />
      <GlobalMapping Global="E*" From="DET-VAA" />
      <GlobalMapping Global="F*" From="DET-VEE" />
      <GlobalMapping Global="G*" From="DET-VFF" />
      <GlobalMapping Global="H*" From="DET-VEE" />
      <GlobalMapping Global="I*" From="DET-VBB" />
      <GlobalMapping Global="J*" From="DET-VBB" />
      <GlobalMapping Global="K*" From="DET-VCC" />
      <GlobalMapping Global="L*" From="DET-VCC" />
      <GlobalMapping Global="M*" From="DET-VCC" />
      <GlobalMapping Global="N*" From="DET-VCC" />
      <GlobalMapping Global="O*" From="DET-VDD" />
      <GlobalMapping Global="OR" From="DET-VDD" />
      <GlobalMapping Global="P*" From="DET-VEE" />
      <GlobalMapping Global="PS*" From="DET-VHH" />
      <GlobalMapping Global="PXRMINDX" From="DET-VJJ" />
      <GlobalMapping Global="Q*" From="DET-VFF" />
      <GlobalMapping Global="R*" From="DET-VFF" />
      <GlobalMapping Global="S*" From="DET-VEE" />
      <GlobalMapping Global="T*" From="DET-VII" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="DET-VFF" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="DET-VFF" />
      <GlobalMapping Global="W*" From="DET-VFF" />
      <GlobalMapping Global="X*" From="DET-VGG" />
      <GlobalMapping Global="Y*" From="DET-VGG" />
      <GlobalMapping Global="Z*" From="DET-VGG" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="ind" Create="yes" Code="ind-rou" Data="ind-rou">
    <Configuration>
      <Database Name="ind-rou" Create="yes" Dir="/cachedb/v11/ind/rou/"/>
      <Database Name="ind-vaa" Create="yes" Dir="/cachedb/v11/ind/vaa/"/>
      <Database Name="ind-vbb" Create="yes" Dir="/cachedb/v11/ind/vbb/"/>
      <Database Name="ind-vcc" Create="yes" Dir="/cachedb/v11/ind/vcc/"/>
      <Database Name="ind-vdd" Create="yes" Dir="/cachedb/v11/ind/vdd/"/>
      <Database Name="ind-vee" Create="yes" Dir="/cachedb/v11/ind/vee/"/>
      <Database Name="ind-vff" Create="yes" Dir="/cachedb/v11/ind/vff/"/>
      <Database Name="ind-vgg" Create="yes" Dir="/cachedb/v11/ind/vgg/"/>
      <Database Name="ind-vhh" Create="yes" Dir="/cachedb/v11/ind/vhh/"/>
      <Database Name="ind-vii" Create="yes" Dir="/cachedb/v11/ind/vii/"/>
      <GlobalMapping Global="%Z*" From="IND-VII" />
      <GlobalMapping Global="A*" From="IND-VBB" />
      <GlobalMapping Global="B*" From="IND-VAA" />
      <GlobalMapping Global="C*" From="IND-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="IND-VBB" />
      <GlobalMapping Global="E*" From="IND-VBB" />
      <GlobalMapping Global="F*" From="IND-VBB" />
      <GlobalMapping Global="G*" From="IND-VBB" />
      <GlobalMapping Global="H*" From="IND-VCC" />
      <GlobalMapping Global="I*" From="IND-VCC" />
      <GlobalMapping Global="J*" From="IND-VCC" />
      <GlobalMapping Global="K*" From="IND-VCC" />
      <GlobalMapping Global="L*" From="IND-VCC" />
      <GlobalMapping Global="M*" From="IND-VBB" />
      <GlobalMapping Global="N*" From="IND-VBB" />
      <GlobalMapping Global="O*" From="IND-VEE" />
      <GlobalMapping Global="OR" From="IND-VGG" />
      <GlobalMapping Global="P*" From="IND-VFF" />
      <GlobalMapping Global="PS*" From="IND-VHH" />
      <GlobalMapping Global="PXRMINDX" From="IND-VDD" />
      <GlobalMapping Global="Q*" From="IND-VFF" />
      <GlobalMapping Global="R*" From="IND-VFF" />
      <GlobalMapping Global="S*" From="IND-VHH" />
      <GlobalMapping Global="T*" From="IND-VII" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="IND-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="IND-VHH" />
      <GlobalMapping Global="W*" From="IND-VHH" />
      <GlobalMapping Global="X*" From="IND-VII" />
      <GlobalMapping Global="Y*" From="IND-VII" />
      <GlobalMapping Global="Z*" From="IND-VII" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="nin" Create="yes" Code="nin-rou" Data="nin-rou">
    <Configuration>
      <Database Name="nin-rou" Create="yes" Dir="/cachedb/v11/nin/rou/"/>
      <Database Name="nin-vaa" Create="yes" Dir="/cachedb/v11/nin/vaa/"/>
      <Database Name="nin-vbb" Create="yes" Dir="/cachedb/v11/nin/vbb/"/>
      <Database Name="nin-vcc" Create="yes" Dir="/cachedb/v11/nin/vcc/"/>
      <Database Name="nin-vdd" Create="yes" Dir="/cachedb/v11/nin/vdd/"/>
      <Database Name="nin-vee" Create="yes" Dir="/cachedb/v11/nin/vee/"/>
      <Database Name="nin-vff" Create="yes" Dir="/cachedb/v11/nin/vff/"/>
      <Database Name="nin-vgg" Create="yes" Dir="/cachedb/v11/nin/vgg/"/>
      <GlobalMapping Global="%Z*" From="NIN-VFF" />
      <GlobalMapping Global="A:E" From="NIN-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="E:J" From="NIN-VBB" />
      <GlobalMapping Global="G*" From="NIN-VDD" />
      <GlobalMapping Global="J:P" From="NIN-VCC" />
      <GlobalMapping Global="P*" From="NIN-VEE" />
      <GlobalMapping Global="PR*" From="NIN-VDD" />
      <GlobalMapping Global="Q:V" From="NIN-VFF" />
      <GlobalMapping Global="R*" From="NIN-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V:zzzzzzzz" From="NIN-VGG" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="sag" Create="yes" Code="sag-rou" Data="sag-rou">
    <Configuration>
      <Database Name="sag-rou" Create="yes" Dir="/cachedb/v11/sag/rou/"/>
      <Database Name="sag-vaa" Create="yes" Dir="/cachedb/v11/sag/vaa/"/>
      <Database Name="sag-vbb" Create="yes" Dir="/cachedb/v11/sag/vbb/"/>
      <Database Name="sag-vcc" Create="yes" Dir="/cachedb/v11/sag/vcc/"/>
      <Database Name="sag-vdd" Create="yes" Dir="/cachedb/v11/sag/vdd/"/>
      <Database Name="sag-vee" Create="yes" Dir="/cachedb/v11/sag/vee/"/>
      <Database Name="sag-vff" Create="yes" Dir="/cachedb/v11/sag/vff/"/>
      <Database Name="sag-vgg" Create="yes" Dir="/cachedb/v11/sag/vgg/"/>
      <Database Name="sag-vhh" Create="yes" Dir="/cachedb/v11/sag/vhh/"/>
      <Database Name="sag-vii" Create="yes" Dir="/cachedb/v11/sag/vii/"/>
      <Database Name="sag-vjj" Create="yes" Dir="/cachedb/v11/sag/vjj/"/>
      <GlobalMapping Global="%Z*" From="SAG-VBB" />
      <GlobalMapping Global="A:E" From="SAG-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="E:G" From="SAG-VII" />
      <GlobalMapping Global="G:L" From="SAG-VEE" />
      <GlobalMapping Global="L:P" From="SAG-VBB" />
      <GlobalMapping Global="OR" From="SAG-VHH" />
      <GlobalMapping Global="P:Q" From="SAG-VCC" />
      <GlobalMapping Global="PXRMINDX" From="SAG-VJJ" />
      <GlobalMapping Global="Q:X" From="SAG-VDD" />
      <GlobalMapping Global="TIU" From="SAG-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="X:ZZZZZZZZ" From="SAG-VFF" />
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