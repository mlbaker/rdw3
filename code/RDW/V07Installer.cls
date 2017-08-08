Include %occInclude

Class RDW.V07Installer
{


XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>

  <Namespace Name="atg" Create="yes" Code="atg-rou" Data="atg-rou">
    <Configuration>
      <Database Name="atg-rou" Create="yes" Dir="/cachedb/v07/atg/rou/"/>
      <Database Name="atg-sql" Create="yes" Dir="/cachedb/v07/atg/sql/"/>
      <Database Name="atg-vaa" Create="yes" Dir="/cachedb/v07/atg/vaa/"/>
      <Database Name="atg-vbb" Create="yes" Dir="/cachedb/v07/atg/vbb/"/>
      <Database Name="atg-vcc" Create="yes" Dir="/cachedb/v07/atg/vcc/"/>
      <Database Name="atg-vdd" Create="yes" Dir="/cachedb/v07/atg/vdd/"/>
      <Database Name="atg-vee" Create="yes" Dir="/cachedb/v07/atg/vee/"/>
      <Database Name="atg-vff" Create="yes" Dir="/cachedb/v07/atg/vff/"/>
      <Database Name="atg-vgg" Create="yes" Dir="/cachedb/v07/atg/vgg/"/>
      <Database Name="atg-vhh" Create="yes" Dir="/cachedb/v07/atg/vhh/"/>
      <GlobalMapping Global="%Z*" From="ATG-VBB" />
      <GlobalMapping Global="A*" From="ATG-VFF" />
      <GlobalMapping Global="B*" From="ATG-VAA" />
      <GlobalMapping Global="C*" From="ATG-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="ATG-VAA" />
      <GlobalMapping Global="E*" From="ATG-VCC" />
      <GlobalMapping Global="F*" From="ATG-VBB" />
      <GlobalMapping Global="G*" From="ATG-VBB" />
      <GlobalMapping Global="H*" From="ATG-VDD" />
      <GlobalMapping Global="I*" From="ATG-VCC" />
      <GlobalMapping Global="J*" From="ATG-VCC" />
      <GlobalMapping Global="K*" From="ATG-VCC" />
      <GlobalMapping Global="L*" From="ATG-VCC" />
      <GlobalMapping Global="M*" From="ATG-VDD" />
      <GlobalMapping Global="N*" From="ATG-VDD" />
      <GlobalMapping Global="O*" From="ATG-VEE" />
      <GlobalMapping Global="OR" From="ATG-VHH" />
      <GlobalMapping Global="P*" From="ATG-VFF" />
      <GlobalMapping Global="PS*" From="ATG-VBB" />
      <GlobalMapping Global="PXRMINDX" From="ATG-VDD" />
      <GlobalMapping Global="Q*" From="ATG-VFF" />
      <GlobalMapping Global="R*" From="ATG-VAA" />
      <GlobalMapping Global="S*" From="ATG-VFF" />
      <GlobalMapping Global="T*" From="ATG-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="ATG-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="ATG-VEE" />
      <GlobalMapping Global="W*" From="ATG-VHH" />
      <GlobalMapping Global="X*" From="ATG-VBB" />
      <GlobalMapping Global="Y*" From="ATG-VBB" />
      <GlobalMapping Global="Z*" From="ATG-VBB" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="aug" Create="yes" Code="aug-rou" Data="aug-rou">
    <Configuration>
      <Database Name="aug-rou" Create="yes" Dir="/cachedb/v07/aug/rou/"/>
      <Database Name="aug-vaa" Create="yes" Dir="/cachedb/v07/aug/vaa/"/>
      <Database Name="aug-vbb" Create="yes" Dir="/cachedb/v07/aug/vbb/"/>
      <Database Name="aug-vcc" Create="yes" Dir="/cachedb/v07/aug/vcc/"/>
      <Database Name="aug-vdd" Create="yes" Dir="/cachedb/v07/aug/vdd/"/>
      <Database Name="aug-vee" Create="yes" Dir="/cachedb/v07/aug/vee/"/>
      <Database Name="aug-vff" Create="yes" Dir="/cachedb/v07/aug/vff/"/>
      <Database Name="aug-vgg" Create="yes" Dir="/cachedb/v07/aug/vgg/"/>
      <Database Name="aug-vhh" Create="yes" Dir="/cachedb/v07/aug/vhh/"/>
      <Database Name="aug-vii" Create="yes" Dir="/cachedb/v07/aug/vii/"/>
      <GlobalMapping Global="%Z*" From="AUG-VBB" />
      <GlobalMapping Global="A*" From="AUG-VHH" />
      <GlobalMapping Global="B*" From="AUG-VDD" />
      <GlobalMapping Global="C*" From="AUG-VHH" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="AUG-VHH" />
      <GlobalMapping Global="E*" From="AUG-VEE" />
      <GlobalMapping Global="F*" From="AUG-VBB" />
      <GlobalMapping Global="G*" From="AUG-VII" />
      <GlobalMapping Global="H*" From="AUG-VGG" />
      <GlobalMapping Global="I*" From="AUG-VHH" />
      <GlobalMapping Global="J*" From="AUG-VBB" />
      <GlobalMapping Global="K*" From="AUG-VGG" />
      <GlobalMapping Global="L*" From="AUG-VGG" />
      <GlobalMapping Global="M*" From="AUG-VHH" />
      <GlobalMapping Global="N*" From="AUG-VGG" />
      <GlobalMapping Global="O*" From="AUG-VDD" />
      <GlobalMapping Global="OR" From="AUG-VCC" />
      <GlobalMapping Global="P*" From="AUG-VHH" />
      <GlobalMapping Global="PS*" From="AUG-VEE" />
      <GlobalMapping Global="PXRMINDX" From="AUG-VFF" />
      <GlobalMapping Global="Q*" From="AUG-VGG" />
      <GlobalMapping Global="R*" From="AUG-VGG" />
      <GlobalMapping Global="S*" From="AUG-VII" />
      <GlobalMapping Global="T*" From="AUG-VAA" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="AUG-VII" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="AUG-VGG" />
      <GlobalMapping Global="W*" From="AUG-VII" />
      <GlobalMapping Global="X*" From="AUG-VBB" />
      <GlobalMapping Global="Y*" From="AUG-VII" />
      <GlobalMapping Global="Z*" From="AUG-VII" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="bir" Create="yes" Code="bir-rou" Data="bir-rou">
    <Configuration>
      <Database Name="bir-rou" Create="yes" Dir="/cachedb/v07/bir/rou/"/>
      <Database Name="bir-sql" Create="yes" Dir="/cachedb/v07/bir/sql/"/>
      <Database Name="bir-vaa" Create="yes" Dir="/cachedb/v07/bir/vaa/"/>
      <Database Name="bir-vbb" Create="yes" Dir="/cachedb/v07/bir/vbb/"/>
      <Database Name="bir-vcc" Create="yes" Dir="/cachedb/v07/bir/vcc/"/>
      <Database Name="bir-vdd" Create="yes" Dir="/cachedb/v07/bir/vdd/"/>
      <Database Name="bir-vee" Create="yes" Dir="/cachedb/v07/bir/vee/"/>
      <Database Name="bir-vff" Create="yes" Dir="/cachedb/v07/bir/vff/"/>
      <Database Name="bir-vgg" Create="yes" Dir="/cachedb/v07/bir/vgg/"/>
      <Database Name="bir-vhh" Create="yes" Dir="/cachedb/v07/bir/vhh/"/>
      <Database Name="bir-vii" Create="yes" Dir="/cachedb/v07/bir/vii/"/>
      <GlobalMapping Global="%Z*" From="BIR-VFF" />
      <GlobalMapping Global="A*" From="BIR-VAA" />
      <GlobalMapping Global="B*" From="BIR-VAA" />
      <GlobalMapping Global="C*" From="BIR-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="BIR-VAA" />
      <GlobalMapping Global="E*" From="BIR-VBB" />
      <GlobalMapping Global="F*" From="BIR-VBB" />
      <GlobalMapping Global="G*" From="BIR-VBB" />
      <GlobalMapping Global="H*" From="BIR-VCC" />
      <GlobalMapping Global="I*" From="BIR-VCC" />
      <GlobalMapping Global="J*" From="BIR-VCC" />
      <GlobalMapping Global="K*" From="BIR-VCC" />
      <GlobalMapping Global="L*" From="BIR-VCC" />
      <GlobalMapping Global="M*" From="BIR-VBB" />
      <GlobalMapping Global="N*" From="BIR-VBB" />
      <GlobalMapping Global="O*" From="BIR-VEE" />
      <GlobalMapping Global="OR" From="BIR-VII" />
      <GlobalMapping Global="P*" From="BIR-VFF" />
      <GlobalMapping Global="PS*" From="BIR-VHH" />
      <GlobalMapping Global="PXRMINDX" From="BIR-VDD" />
      <GlobalMapping Global="Q*" From="BIR-VFF" />
      <GlobalMapping Global="R*" From="BIR-VFF" />
      <GlobalMapping Global="S*" From="BIR-VGG" />
      <GlobalMapping Global="T*" From="BIR-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="BIR-VGG" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="BIR-VHH" />
      <GlobalMapping Global="W*" From="BIR-VHH" />
      <GlobalMapping Global="X*" From="BIR-VFF" />
      <GlobalMapping Global="Y*" From="BIR-VFF" />
      <GlobalMapping Global="Z*" From="BIR-VFF" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="cav" Create="yes" Code="cav-rou" Data="cav-rou">
    <Configuration>
      <Database Name="cav-rou" Create="yes" Dir="/cachedb/v07/cav/rou/"/>
      <Database Name="cav-vaa" Create="yes" Dir="/cachedb/v07/cav/vaa/"/>
      <Database Name="cav-vbb" Create="yes" Dir="/cachedb/v07/cav/vbb/"/>
      <Database Name="cav-vcc" Create="yes" Dir="/cachedb/v07/cav/vcc/"/>
      <Database Name="cav-vdd" Create="yes" Dir="/cachedb/v07/cav/vdd/"/>
      <Database Name="cav-vee" Create="yes" Dir="/cachedb/v07/cav/vee/"/>
      <Database Name="cav-vff" Create="yes" Dir="/cachedb/v07/cav/vff/"/>
      <Database Name="cav-vgg" Create="yes" Dir="/cachedb/v07/cav/vgg/"/>
      <Database Name="cav-vhh" Create="yes" Dir="/cachedb/v07/cav/vhh/"/>
      <GlobalMapping Global="%Z*" From="CAV-VEE" />
      <GlobalMapping Global="A:H" From="CAV-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="H:O" From="CAV-VBB" />
      <GlobalMapping Global="O*" From="CAV-VFF" />
      <GlobalMapping Global="ORA" From="CAV-VHH" />
      <GlobalMapping Global="ORRT" From="CAV-VHH" />
      <GlobalMapping Global="P:S" From="CAV-VCC" />
      <GlobalMapping Global="PXRMINDX*" From="CAV-VGG" />
      <GlobalMapping Global="S:W" From="CAV-VDD" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="W:ZZZZzzzz" From="CAV-VEE" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="cha" Create="yes" Code="cha-rou" Data="cha-rou">
    <Configuration>
      <Database Name="cha-rou" Create="yes" Dir="/cachedb/v07/cha/rou/"/>
      <Database Name="cha-vaa" Create="yes" Dir="/cachedb/v07/cha/vaa/"/>
      <Database Name="cha-vbb" Create="yes" Dir="/cachedb/v07/cha/vbb/"/>
      <Database Name="cha-vcc" Create="yes" Dir="/cachedb/v07/cha/vcc/"/>
      <Database Name="cha-vdd" Create="yes" Dir="/cachedb/v07/cha/vdd/"/>
      <Database Name="cha-vee" Create="yes" Dir="/cachedb/v07/cha/vee/"/>
      <Database Name="cha-vff" Create="yes" Dir="/cachedb/v07/cha/vff/"/>
      <Database Name="cha-vgg" Create="yes" Dir="/cachedb/v07/cha/vgg/"/>
      <Database Name="cha-vhh" Create="yes" Dir="/cachedb/v07/cha/vhh/"/>
      <Database Name="cha-vii" Create="yes" Dir="/cachedb/v07/cha/vii/"/>
      <GlobalMapping Global="%Z*" From="CHA-VII" />
      <GlobalMapping Global="A*" From="CHA-VII" />
      <GlobalMapping Global="B*" From="CHA-VDD" />
      <GlobalMapping Global="C*" From="CHA-VII" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="CHA-VEE" />
      <GlobalMapping Global="E*" From="CHA-VHH" />
      <GlobalMapping Global="F*" From="CHA-VDD" />
      <GlobalMapping Global="G*" From="CHA-VDD" />
      <GlobalMapping Global="H*" From="CHA-VEE" />
      <GlobalMapping Global="I*" From="CHA-VGG" />
      <GlobalMapping Global="J*" From="CHA-VII" />
      <GlobalMapping Global="K*" From="CHA-VGG" />
      <GlobalMapping Global="L*" From="CHA-VHH" />
      <GlobalMapping Global="M*" From="CHA-VEE" />
      <GlobalMapping Global="N*" From="CHA-VII" />
      <GlobalMapping Global="O*" From="CHA-VDD" />
      <GlobalMapping Global="OR" From="CHA-VCC" />
      <GlobalMapping Global="P*" From="CHA-VII" />
      <GlobalMapping Global="PS*" From="CHA-VBB" />
      <GlobalMapping Global="PXRMINDX" From="CHA-VGG" />
      <GlobalMapping Global="Q*" From="CHA-VHH" />
      <GlobalMapping Global="R*" From="CHA-VEE" />
      <GlobalMapping Global="S*" From="CHA-VDD" />
      <GlobalMapping Global="T*" From="CHA-VAA" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="CHA-VHH" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="CHA-VFF" />
      <GlobalMapping Global="W*" From="CHA-VHH" />
      <GlobalMapping Global="X*" From="CHA-VFF" />
      <GlobalMapping Global="Y*" From="CHA-VGG" />
      <GlobalMapping Global="Z*" From="CHA-VDD" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="cms" Create="yes" Code="cms-rou" Data="cms-rou">
    <Configuration>
      <Database Name="cms-rou" Create="yes" Dir="/cachedb/v07/cms/rou/"/>
      <Database Name="cms-vaa" Create="yes" Dir="/cachedb/v07/cms/vaa/"/>
      <Database Name="cms-vbb" Create="yes" Dir="/cachedb/v07/cms/vbb/"/>
      <Database Name="cms-vcc" Create="yes" Dir="/cachedb/v07/cms/vcc/"/>
      <Database Name="cms-vdd" Create="yes" Dir="/cachedb/v07/cms/vdd/"/>
      <Database Name="cms-vee" Create="yes" Dir="/cachedb/v07/cms/vee/"/>
      <Database Name="cms-vff" Create="yes" Dir="/cachedb/v07/cms/vff/"/>
      <Database Name="cms-vgg" Create="yes" Dir="/cachedb/v07/cms/vgg/"/>
      <Database Name="cms-vhh" Create="yes" Dir="/cachedb/v07/cms/vhh/"/>
      <Database Name="cms-vii" Create="yes" Dir="/cachedb/v07/cms/vii/"/>
      <GlobalMapping Global="%Z*" From="CMS-VHH" />
      <GlobalMapping Global="A*" From="CMS-VAA" />
      <GlobalMapping Global="B*" From="CMS-VAA" />
      <GlobalMapping Global="C*" From="CMS-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="CMS-VAA" />
      <GlobalMapping Global="E*" From="CMS-VBB" />
      <GlobalMapping Global="F*" From="CMS-VBB" />
      <GlobalMapping Global="G*" From="CMS-VDD" />
      <GlobalMapping Global="H*" From="CMS-VCC" />
      <GlobalMapping Global="I*" From="CMS-VCC" />
      <GlobalMapping Global="J*" From="CMS-VCC" />
      <GlobalMapping Global="K*" From="CMS-VCC" />
      <GlobalMapping Global="L*" From="CMS-VCC" />
      <GlobalMapping Global="M*" From="CMS-VDD" />
      <GlobalMapping Global="N*" From="CMS-VDD" />
      <GlobalMapping Global="O*" From="CMS-VEE" />
      <GlobalMapping Global="OR" From="CMS-VBB" />
      <GlobalMapping Global="P*" From="CMS-VFF" />
      <GlobalMapping Global="PS*" From="CMS-VDD" />
      <GlobalMapping Global="PXRMINDX" From="CMS-VII" />
      <GlobalMapping Global="Q*" From="CMS-VFF" />
      <GlobalMapping Global="R*" From="CMS-VFF" />
      <GlobalMapping Global="S*" From="CMS-VDD" />
      <GlobalMapping Global="T*" From="CMS-VGG" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="CMS-VDD" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="CMS-VHH" />
      <GlobalMapping Global="W*" From="CMS-VHH" />
      <GlobalMapping Global="X*" From="CMS-VHH" />
      <GlobalMapping Global="Y*" From="CMS-VHH" />
      <GlobalMapping Global="Z*" From="CMS-VHH" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="dub" Create="yes" Code="dub-rou" Data="dub-rou">
    <Configuration>
      <Database Name="dub-rou" Create="yes" Dir="/cachedb/v07/dub/rou/"/>
      <Database Name="dub-vaa" Create="yes" Dir="/cachedb/v07/dub/vaa/"/>
      <Database Name="dub-vbb" Create="yes" Dir="/cachedb/v07/dub/vbb/"/>
      <Database Name="dub-vcc" Create="yes" Dir="/cachedb/v07/dub/vcc/"/>
      <Database Name="dub-vdd" Create="yes" Dir="/cachedb/v07/dub/vdd/"/>
      <Database Name="dub-vee" Create="yes" Dir="/cachedb/v07/dub/vee/"/>
      <GlobalMapping Global="%Z*" From="DUB-VDD" />
      <GlobalMapping Global="A:I" From="DUB-VAA" />
      <GlobalMapping Global="CE*" From="DUB-VCC" />
      <GlobalMapping Global="CHP" From="DUB-VCC" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="I:P" From="DUB-VBB" />
      <GlobalMapping Global="MAG*" From="DUB-VCC" />
      <GlobalMapping Global="MDD" From="DUB-VEE" />
      <GlobalMapping Global="MDS" From="DUB-VEE" />
      <GlobalMapping Global="P*" From="DUB-VBB" />
      <GlobalMapping Global="PRS*" From="DUB-VCC" />
      <GlobalMapping Global="PS*" From="DUB-VCC" />
      <GlobalMapping Global="PXRMINDX" From="DUB-VEE" />
      <GlobalMapping Global="Q:S" From="DUB-VCC" />
      <GlobalMapping Global="S:zzzzzzzz" From="DUB-VDD" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="tua" Create="yes" Code="tua-rou" Data="tua-rou">
    <Configuration>
      <Database Name="tua-rou" Create="yes" Dir="/cachedb/v07/tua/rou/"/>
      <Database Name="tua-vaa" Create="yes" Dir="/cachedb/v07/tua/vaa/"/>
      <Database Name="tua-vbb" Create="yes" Dir="/cachedb/v07/tua/vbb/"/>
      <Database Name="tua-vcc" Create="yes" Dir="/cachedb/v07/tua/vcc/"/>
      <Database Name="tua-vdd" Create="yes" Dir="/cachedb/v07/tua/vdd/"/>
      <Database Name="tua-vee" Create="yes" Dir="/cachedb/v07/tua/vee/"/>
      <Database Name="tua-vff" Create="yes" Dir="/cachedb/v07/tua/vff/"/>
      <Database Name="tua-vgg" Create="yes" Dir="/cachedb/v07/tua/vgg/"/>
      <Database Name="tua-vhh" Create="yes" Dir="/cachedb/v07/tua/vhh/"/>
      <Database Name="tua-vii" Create="yes" Dir="/cachedb/v07/tua/vii/"/>
      <Database Name="tua-vjj" Create="yes" Dir="/cachedb/v07/tua/vjj/"/>
      <Database Name="tua-vkk" Create="yes" Dir="/cachedb/v07/tua/vkk/"/>
      <GlobalMapping Global="A:E" From="TUA-VAA" />
      <GlobalMapping Global="AGGP*" From="TUA-VFF" />
      <GlobalMapping Global="DMSQ" From="TUA-VFF" />
      <GlobalMapping Global="E:K" From="TUA-VBB" />
      <GlobalMapping Global="ECX" From="TUA-VKK" />
      <GlobalMapping Global="K:O" From="TUA-VCC" />
      <GlobalMapping Global="O:P" From="TUA-VDD" />
      <GlobalMapping Global="P*" From="TUA-VGG" />
      <GlobalMapping Global="PFAS" From="TUA-VEE" />
      <GlobalMapping Global="PR*" From="TUA-VFF" />
      <GlobalMapping Global="PRC*" From="TUA-VEE" />
      <GlobalMapping Global="PSCST" From="TUA-VEE" />
      <GlobalMapping Global="PSD" From="TUA-VEE" />
      <GlobalMapping Global="PSPPI" From="TUA-VEE" />
      <GlobalMapping Global="PXRMINDX" From="TUA-VHH" />
      <GlobalMapping Global="Q:U" From="TUA-VHH" />
      <GlobalMapping Global="RA*" From="TUA-VFF" />
      <GlobalMapping Global="RT*" From="TUA-VFF" />
      <GlobalMapping Global="SC*" From="TUA-VFF" />
      <GlobalMapping Global="SD*" From="TUA-VFF" />
      <GlobalMapping Global="TIU" From="TUA-VJJ" />
      <GlobalMapping Global="U:ZZZ" From="TUA-VII" />
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