Include %occInclude

Class RDW.V08Installer
{

XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>

  <Namespace Name="bay" Create="yes" Code="bay-rou" Data="bay-rou">
    <Configuration>
      <Database Name="bay-rou" Create="yes" Dir="/cachedb/v08/bay/rou/"/>
      <Database Name="bay-sql" Create="yes" Dir="/cachedb/v08/bay/sql/"/>
      <Database Name="bay-vaa" Create="yes" Dir="/cachedb/v08/bay/vaa/"/>
      <Database Name="bay-vbb" Create="yes" Dir="/cachedb/v08/bay/vbb/"/>
      <Database Name="bay-vcc" Create="yes" Dir="/cachedb/v08/bay/vcc/"/>
      <Database Name="bay-vdd" Create="yes" Dir="/cachedb/v08/bay/vdd/"/>
      <Database Name="bay-vee" Create="yes" Dir="/cachedb/v08/bay/vee/"/>
      <Database Name="bay-vff" Create="yes" Dir="/cachedb/v08/bay/vff/"/>
      <Database Name="bay-vgg" Create="yes" Dir="/cachedb/v08/bay/vgg/"/>
      <Database Name="bay-vhh" Create="yes" Dir="/cachedb/v08/bay/vhh/"/>
      <Database Name="bay-vii" Create="yes" Dir="/cachedb/v08/bay/vii/"/>
      <Database Name="bay-vjj" Create="yes" Dir="/cachedb/v08/bay/vjj/"/>
      <GlobalMapping Global="%Z*" From="BAY-VII" />
      <GlobalMapping Global="A*" From="BAY-VAA" />
      <GlobalMapping Global="B*" From="BAY-VAA" />
      <GlobalMapping Global="C*" From="BAY-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="BAY-VAA" />
      <GlobalMapping Global="E*" From="BAY-VAA" />
      <GlobalMapping Global="F*" From="BAY-VBB" />
      <GlobalMapping Global="G*" From="BAY-VBB" />
      <GlobalMapping Global="H*" From="BAY-VBB" />
      <GlobalMapping Global="I*" From="BAY-VCC" />
      <GlobalMapping Global="J*" From="BAY-VCC" />
      <GlobalMapping Global="K*" From="BAY-VCC" />
      <GlobalMapping Global="L*" From="BAY-VCC" />
      <GlobalMapping Global="M*" From="BAY-VCC" />
      <GlobalMapping Global="N*" From="BAY-VGG" />
      <GlobalMapping Global="O*" From="BAY-VEE" />
      <GlobalMapping Global="OR" From="BAY-VFF" />
      <GlobalMapping Global="P*" From="BAY-VDD" />
      <GlobalMapping Global="PS*" From="BAY-VDD" />
      <GlobalMapping Global="PXRMINDX" From="BAY-VJJ" />
      <GlobalMapping Global="Q*" From="BAY-VII" />
      <GlobalMapping Global="R*" From="BAY-VII" />
      <GlobalMapping Global="S*" From="BAY-VGG" />
      <GlobalMapping Global="T*" From="BAY-VHH" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="BAY-VGG" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="BAY-VGG" />
      <GlobalMapping Global="W*" From="BAY-VGG" />
      <GlobalMapping Global="X*" From="BAY-VII" />
      <GlobalMapping Global="Y*" From="BAY-VII" />
      <GlobalMapping Global="Z*" From="BAY-VII" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="saj" Create="yes" Code="saj-rou" Data="saj-rou">
    <Configuration>
      <Database Name="saj-rou" Create="yes" Dir="/cachedb/v08/saj/rou/"/>
      <Database Name="saj-vaa" Create="yes" Dir="/cachedb/v08/saj/vaa/"/>
      <Database Name="saj-vbb" Create="yes" Dir="/cachedb/v08/saj/vbb/"/>
      <Database Name="saj-vcc" Create="yes" Dir="/cachedb/v08/saj/vcc/"/>
      <Database Name="saj-vdd" Create="yes" Dir="/cachedb/v08/saj/vdd/"/>
      <Database Name="saj-vee" Create="yes" Dir="/cachedb/v08/saj/vee/"/>
      <Database Name="saj-vff" Create="yes" Dir="/cachedb/v08/saj/vff/"/>
      <Database Name="saj-vgg" Create="yes" Dir="/cachedb/v08/saj/vgg/"/>
      <Database Name="saj-vhh" Create="yes" Dir="/cachedb/v08/saj/vhh/"/>
      <Database Name="saj-vii" Create="yes" Dir="/cachedb/v08/saj/vii/"/>
      <Database Name="saj-vjj" Create="yes" Dir="/cachedb/v08/saj/vjj/"/>
      <GlobalMapping Global="%Z*" From="SAJ-VHH" />
      <GlobalMapping Global="A*" From="SAJ-VAA" />
      <GlobalMapping Global="B*" From="SAJ-VAA" />
      <GlobalMapping Global="C*" From="SAJ-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="SAJ-VAA" />
      <GlobalMapping Global="E*" From="SAJ-VBB" />
      <GlobalMapping Global="F*" From="SAJ-VBB" />
      <GlobalMapping Global="G*" From="SAJ-VBB" />
      <GlobalMapping Global="H*" From="SAJ-VCC" />
      <GlobalMapping Global="I*" From="SAJ-VCC" />
      <GlobalMapping Global="J*" From="SAJ-VCC" />
      <GlobalMapping Global="K*" From="SAJ-VCC" />
      <GlobalMapping Global="L*" From="SAJ-VHH" />
      <GlobalMapping Global="M*" From="SAJ-VDD" />
      <GlobalMapping Global="N*" From="SAJ-VDD" />
      <GlobalMapping Global="O*" From="SAJ-VEE" />
      <GlobalMapping Global="OR" From="SAJ-VGG" />
      <GlobalMapping Global="P*" From="SAJ-VDD" />
      <GlobalMapping Global="PS*" From="SAJ-VDD" />
      <GlobalMapping Global="PXRMINDX" From="SAJ-VJJ" />
      <GlobalMapping Global="Q*" From="SAJ-VDD" />
      <GlobalMapping Global="R*" From="SAJ-VDD" />
      <GlobalMapping Global="S*" From="SAJ-VBB" />
      <GlobalMapping Global="T*" From="SAJ-VFF" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="SAJ-VBB" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="SAJ-VGG" />
      <GlobalMapping Global="W*" From="SAJ-VGG" />
      <GlobalMapping Global="X*" From="SAJ-VCC" />
      <GlobalMapping Global="Y*" From="SAJ-VHH" />
      <GlobalMapping Global="Z*" From="SAJ-VHH" />
      <GlobalMapping Global="mtemp*" From="CACHETEMP" />
    </Configuration>
  </Namespace>

  <Namespace Name="tam" Create="yes" Code="tam-rou" Data="tam-rou">
    <Configuration>
      <Database Name="tam-rou" Create="yes" Dir="/cachedb/v08/tam/rou/"/>
      <Database Name="tam-vaa" Create="yes" Dir="/cachedb/v08/tam/vaa/"/>
      <Database Name="tam-vbb" Create="yes" Dir="/cachedb/v08/tam/vbb/"/>
      <Database Name="tam-vcc" Create="yes" Dir="/cachedb/v08/tam/vcc/"/>
      <Database Name="tam-vdd" Create="yes" Dir="/cachedb/v08/tam/vdd/"/>
      <Database Name="tam-vee" Create="yes" Dir="/cachedb/v08/tam/vee/"/>
      <Database Name="tam-vff" Create="yes" Dir="/cachedb/v08/tam/vff/"/>
      <Database Name="tam-vgg" Create="yes" Dir="/cachedb/v08/tam/vgg/"/>
      <Database Name="tam-vhh" Create="yes" Dir="/cachedb/v08/tam/vhh/"/>
      <Database Name="tam-vii" Create="yes" Dir="/cachedb/v08/tam/vii/"/>
      <GlobalMapping Global="%Z*" From="TAM-VGG" />
      <GlobalMapping Global="A*" From="TAM-VAA" />
      <GlobalMapping Global="B*" From="TAM-VAA" />
      <GlobalMapping Global="C*" From="TAM-VAA" />
      <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
      <GlobalMapping Global="D*" From="TAM-VAA" />
      <GlobalMapping Global="E*" From="TAM-VBB" />
      <GlobalMapping Global="F*" From="TAM-VBB" />
      <GlobalMapping Global="G*" From="TAM-VBB" />
      <GlobalMapping Global="H*" From="TAM-VFF" />
      <GlobalMapping Global="I*" From="TAM-VCC" />
      <GlobalMapping Global="J*" From="TAM-VCC" />
      <GlobalMapping Global="K*" From="TAM-VCC" />
      <GlobalMapping Global="L*" From="TAM-VCC" />
      <GlobalMapping Global="M*" From="TAM-VBB" />
      <GlobalMapping Global="N*" From="TAM-VGG" />
      <GlobalMapping Global="O*" From="TAM-VEE" />
      <GlobalMapping Global="OR" From="TAM-VHH" />
      <GlobalMapping Global="P*" From="TAM-VGG" />
      <GlobalMapping Global="PS*" From="TAM-VGG" />
      <GlobalMapping Global="PXRMINDX" From="TAM-VII" />
      <GlobalMapping Global="Q*" From="TAM-VBB" />
      <GlobalMapping Global="R*" From="TAM-VBB" />
      <GlobalMapping Global="S*" From="TAM-VBB" />
      <GlobalMapping Global="T*" From="TAM-VFF" />
      <GlobalMapping Global="TMP" From="CACHETEMP" />
      <GlobalMapping Global="U*" From="TAM-VBB" />
      <GlobalMapping Global="UTILITY" From="CACHETEMP" />
      <GlobalMapping Global="V*" From="TAM-VBB" />
      <GlobalMapping Global="W*" From="TAM-VBB" />
      <GlobalMapping Global="X*" From="TAM-VDD" />
      <GlobalMapping Global="Y*" From="TAM-VGG" />
      <GlobalMapping Global="Z*" From="TAM-VGG" />
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