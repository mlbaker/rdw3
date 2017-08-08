Include %occInclude

Class RDW.V06Installer
{

XData SimpleManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>
    <Namespace Name="bec" Create="yes" Code="bec-rou" Data="bec-rou">
      <Configuration>
        <Database Name="bec-rou" Create="yes" Dir="/cachedb/v06/bec/rou/"/>
        <Database Name="bec-vaa" Create="yes" Dir="/cachedb/v06/bec/vaa/" />
        <Database Name="bec-vbb" Create="yes" Dir="/cachedb/v06/bec/vbb/" />
        <Database Name="bec-vcc" Create="yes" Dir="/cachedb/v06/bec/vcc/" />
        <Database Name="bec-vdd" Create="yes" Dir="/cachedb/v06/bec/vdd/" />
        <Database Name="bec-vee" Create="yes" Dir="/cachedb/v06/bec/vee/" />
        <Database Name="bec-vff" Create="yes" Dir="/cachedb/v06/bec/vff/" />
        <GlobalMapping Global="A:E" From="BEC-VAA" />
        <GlobalMapping Global="E:G" From="BEC-VDD" />
        <GlobalMapping Global="G*" From="BEC-VAA" />
        <GlobalMapping Global="H*" From="BEC-VDD" />
        <GlobalMapping Global="I:N" From="BEC-VBB" />
        <GlobalMapping Global="N:P" From="BEC-VDD" />
        <GlobalMapping Global="P*" From="BEC-VCC" />
        <GlobalMapping Global="Q:X" From="BEC-VEE" />
        <GlobalMapping Global="X:zzzzzzzzz" From="BEC-VFF" />
      </Configuration>
    </Namespace>
	
    <Namespace Name="dur" Create="yes" Code="dur-rou" Data="dur-rou">
      <Configuration>    
        <Database Name="dur-rou" Create="yes" Dir="/cachedb/v06/dur/rou/" />
        <Database Name="dur-vaa" Create="yes" Dir="/cachedb/v06/dur/vaa/" />
        <Database Name="dur-vbb" Create="yes" Dir="/cachedb/v06/dur/vbb/" />
        <Database Name="dur-vcc" Create="yes" Dir="/cachedb/v06/dur/vcc/" />
        <Database Name="dur-vdd" Create="yes" Dir="/cachedb/v06/dur/vdd/" />
        <Database Name="dur-vee" Create="yes" Dir="/cachedb/v06/dur/vee/" />
        <Database Name="dur-vff" Create="yes" Dir="/cachedb/v06/dur/vff/" />
        <Database Name="dur-vgg" Create="yes" Dir="/cachedb/v06/dur/vgg/" />
        <Database Name="dur-vhh" Create="yes" Dir="/cachedb/v06/dur/vhh/" />
        <GlobalMapping Global="%Z*" From="DUR-VCC" />
        <GlobalMapping Global="A*" From="DUR-VAA" />
        <GlobalMapping Global="B*" From="DUR-VAA" />
        <GlobalMapping Global="C*" From="DUR-VAA" />
        <GlobalMapping Global="CacheTemp" From="CACHETEMP" />
        <GlobalMapping Global="D*" From="DUR-VBB" />
        <GlobalMapping Global="E*" From="DUR-VBB" />
        <GlobalMapping Global="F*" From="DUR-VAA" />
        <GlobalMapping Global="G*" From="DUR-VBB" />
        <GlobalMapping Global="H*" From="DUR-VBB" />
        <GlobalMapping Global="I*" From="DUR-VBB" />
        <GlobalMapping Global="J*" From="DUR-VCC" />
        <GlobalMapping Global="K*" From="DUR-VCC" />
        <GlobalMapping Global="L*" From="DUR-VAA" />
        <GlobalMapping Global="M*" From="DUR-VAA" />
        <GlobalMapping Global="N*" From="DUR-VAA" />
        <GlobalMapping Global="O*" From="DUR-VDD" />
        <GlobalMapping Global="OR" From="DUR-VGG" />
        <GlobalMapping Global="P*" From="DUR-VCC" />
        <GlobalMapping Global="PS*" From="DUR-VFF" />
        <GlobalMapping Global="PXRMINDX" From="DUR-VHH" />
        <GlobalMapping Global="Q*" From="DUR-VAA" />
        <GlobalMapping Global="R*" From="DUR-VCC" />
        <GlobalMapping Global="S*" From="DUR-VDD" />
        <GlobalMapping Global="T*" From="DUR-VEE" />
        <GlobalMapping Global="TMP" From="CACHETEMP" />
        <GlobalMapping Global="U*" From="DUR-VCC" />
        <GlobalMapping Global="UTILITY" From="CACHETEMP" />
        <GlobalMapping Global="V*" From="DUR-VDD" />
        <GlobalMapping Global="W*" From="DUR-VDD" />
        <GlobalMapping Global="X*" From="DUR-VCC" />
        <GlobalMapping Global="Y*" From="DUR-VDD" />
        <GlobalMapping Global="Z*" From="DUR-VBB" />
        <GlobalMapping Global="mtemp*" From="CACHETEMP" />
      </Configuration>
    </Namespace>        
        
    <Namespace Name="fnc" Create="yes" Code="fnc-rou" Data="fnc-rou">
      <Configuration>
        <Database Name="fnc-rou" Create="yes" Dir="/cachedb/v06/fnc/rou/" />
        <Database Name="fnc-vaa" Create="yes" Dir="/cachedb/v06/fnc/vaa/" />
        <Database Name="fnc-vbb" Create="yes" Dir="/cachedb/v06/fnc/vbb/" />
        <Database Name="fnc-vcc" Create="yes" Dir="/cachedb/v06/fnc/vcc/" />
        <Database Name="fnc-vdd" Create="yes" Dir="/cachedb/v06/fnc/vdd/" />
        <Database Name="fnc-vee" Create="yes" Dir="/cachedb/v06/fnc/vee/" />
        <Database Name="fnc-vff" Create="yes" Dir="/cachedb/v06/fnc/vff/" />
        <Database Name="fnc-vgg" Create="yes" Dir="/cachedb/v06/fnc/vgg/" />
        <Database Name="fnc-vmm" Create="yes" Dir="/cachedb/v06/fnc/vmm/" />
        <GlobalMapping Global="A:H" From="FNC-VAA" />
        <GlobalMapping Global="H:M" From="FNC-VBB" />
        <GlobalMapping Global="LR" From="FNC-VFF" />
        <GlobalMapping Global="M:P" From="FNC-VDD" />
        <GlobalMapping Global="P*" From="FNC-VEE" />
        <GlobalMapping Global="PR*" From="FNC-VCC" />
        <GlobalMapping Global="PS*" From="FNC-VGG" />
        <GlobalMapping Global="PXRMINDX" From="FNC-VMM" />
        <GlobalMapping Global="Q:W" From="FNC-VEE" />
        <GlobalMapping Global="W:ZZZ" From="FNC-VFF" />	
      </Configuration>
    </Namespace>        
        
        
    <Namespace Name="ham" Create="yes" Code="ham-rou" Data="ham-rou">
      <Configuration>
        <Database Name="ham-rou" Create="yes" Dir="/cachedb/v06/ham/rou/" />
        <Database Name="ham-vaa" Create="yes" Dir="/cachedb/v06/ham/vaa/" />
        <Database Name="ham-vbb" Create="yes" Dir="/cachedb/v06/ham/vbb/" />
        <Database Name="ham-vcc" Create="yes" Dir="/cachedb/v06/ham/vcc/" />
        <Database Name="ham-vdd" Create="yes" Dir="/cachedb/v06/ham/vdd/" />
        <Database Name="ham-vee" Create="yes" Dir="/cachedb/v06/ham/vee/" />
        <Database Name="ham-vff" Create="yes" Dir="/cachedb/v06/ham/vff/" />
        <Database Name="ham-vgg" Create="yes" Dir="/cachedb/v06/ham/vgg/" />
        <Database Name="ham-vhh" Create="yes" Dir="/cachedb/v06/ham/vhh/" />
        <Database Name="ham-vii" Create="yes" Dir="/cachedb/v06/ham/vii/" />
        <GlobalMapping Global="%Z*" From="HAM-VDD" />
        <GlobalMapping Global="A*" From="HAM-VAA" />
        <GlobalMapping Global="B*" From="HAM-VAA" />
        <GlobalMapping Global="C*" From="HAM-VAA" />
		<GlobalMapping Global="CacheTemp" From="CACHETEMP" />
		<GlobalMapping Global="D*" From="HAM-VAA" />
		<GlobalMapping Global="E*" From="HAM-VBB" />
		<GlobalMapping Global="F*" From="HAM-VBB" />
		<GlobalMapping Global="G*" From="HAM-VBB" />
		<GlobalMapping Global="H*" From="HAM-VBB" />
		<GlobalMapping Global="I*" From="HAM-VBB" />
		<GlobalMapping Global="J*" From="HAM-VCC" />
		<GlobalMapping Global="K*" From="HAM-VCC" />
		<GlobalMapping Global="L*" From="HAM-VCC" />
		<GlobalMapping Global="M*" From="HAM-VCC" />
		<GlobalMapping Global="N*" From="HAM-VCC" />
		<GlobalMapping Global="O*" From="HAM-VEE" />
		<GlobalMapping Global="OR" From="HAM-VDD" />
		<GlobalMapping Global="P*" From="HAM-VFF" />
		<GlobalMapping Global="PS*" From="HAM-VHH" />
		<GlobalMapping Global="PXRMINDX" From="HAM-VGG" />
		<GlobalMapping Global="Q*" From="HAM-VFF" />
		<GlobalMapping Global="R*" From="HAM-VFF" />
		<GlobalMapping Global="S*" From="HAM-VFF" />
		<GlobalMapping Global="T*" From="HAM-VII" />
		<GlobalMapping Global="TMP" From="CACHETEMP" />
		<GlobalMapping Global="U*" From="HAM-VFF" />
		<GlobalMapping Global="UTILITY" From="CACHETEMP" />
		<GlobalMapping Global="V*" From="HAM-VAA" />
		<GlobalMapping Global="W*" From="HAM-VHH" />
		<GlobalMapping Global="X*" From="HAM-VDD" />
		<GlobalMapping Global="Y*" From="HAM-VDD" />
		<GlobalMapping Global="Z*" From="HAM-VDD" />
		<GlobalMapping Global="mtemp*" From="CACHETEMP" />
      </Configuration>
    </Namespace>        
        
        
    <Namespace Name="ash" Create="yes" Code="ash-rou" Data="ash-rou">
      <Configuration>
        <Database Name="ash-rou" Create="yes" Dir="/cachedb/v06/ash/rou/" />
        <Database Name="ash-vaa" Create="yes" Dir="/cachedb/v06/ash/vaa/" />
        <Database Name="ash-vbb" Create="yes" Dir="/cachedb/v06/ash/vbb/" />
        <Database Name="ash-vcc" Create="yes" Dir="/cachedb/v06/ash/vcc/" />
        <Database Name="ash-vdd" Create="yes" Dir="/cachedb/v06/ash/vdd/" />
        <Database Name="ash-vee" Create="yes" Dir="/cachedb/v06/ash/vee/" />
        <Database Name="ash-vff" Create="yes" Dir="/cachedb/v06/ash/vff/" />
        <Database Name="ash-vgg" Create="yes" Dir="/cachedb/v06/ash/vgg/" />
        <Database Name="ash-vhh" Create="yes" Dir="/cachedb/v06/ash/vhh/" />
        <Database Name="ash-vii" Create="yes" Dir="/cachedb/v06/ash/vii/" />
        <GlobalMapping Global="%Z*" From="ASH-VII" />
		<GlobalMapping Global="A*" From="ASH-VAA" />
		<GlobalMapping Global="B*" From="ASH-VAA" />
		<GlobalMapping Global="C*" From="ASH-VAA" />
		<GlobalMapping Global="CacheTemp" From="CACHETEMP" />
		<GlobalMapping Global="D*" From="ASH-VAA" />
		<GlobalMapping Global="E*" From="ASH-VAA" />
		<GlobalMapping Global="F*" From="ASH-VAA" />
		<GlobalMapping Global="G*" From="ASH-VAA" />
		<GlobalMapping Global="H*" From="ASH-VCC" />
		<GlobalMapping Global="I*" From="ASH-VCC" />
		<GlobalMapping Global="J*" From="ASH-VCC" />
		<GlobalMapping Global="K*" From="ASH-VCC" />
		<GlobalMapping Global="L*" From="ASH-VCC" />
		<GlobalMapping Global="M*" From="ASH-VCC" />
		<GlobalMapping Global="N*" From="ASH-VCC" />
		<GlobalMapping Global="O*" From="ASH-VEE" />
		<GlobalMapping Global="OR" From="ASH-VBB" />
		<GlobalMapping Global="P*" From="ASH-VHH" />
		<GlobalMapping Global="PS*" From="ASH-VFF" />
		<GlobalMapping Global="PXRMINDX" From="ASH-VDD" />
		<GlobalMapping Global="Q*" From="ASH-VHH" />
		<GlobalMapping Global="R*" From="ASH-VHH" />
		<GlobalMapping Global="S*" From="ASH-VHH" />
		<GlobalMapping Global="T*" From="ASH-VGG" />
		<GlobalMapping Global="TMP" From="CACHETEMP" />
		<GlobalMapping Global="U*" From="ASH-VII" />
		<GlobalMapping Global="UTILITY" From="CACHETEMP" />
		<GlobalMapping Global="V*" From="ASH-VII" />
		<GlobalMapping Global="W*" From="ASH-VII" />
		<GlobalMapping Global="X*" From="ASH-VII" />
		<GlobalMapping Global="Y*" From="ASH-VII" />
		<GlobalMapping Global="Z*" From="ASH-VII" />
		<GlobalMapping Global="mtemp*" From="CACHETEMP" />
      </Configuration>
    </Namespace>


    <Namespace Name="ric" Create="yes" Code="ric-rou" Data="ric-rou">
      <Configuration>
        <Database Name="ric-rou" Create="yes" Dir="/cachedb/v06/ric/rou/" />
        <Database Name="ric-vaa" Create="yes" Dir="/cachedb/v06/ric/vaa/" />
        <Database Name="ric-vbb" Create="yes" Dir="/cachedb/v06/ric/vbb/" />
        <Database Name="ric-vcc" Create="yes" Dir="/cachedb/v06/ric/vcc/" />
        <Database Name="ric-vdd" Create="yes" Dir="/cachedb/v06/ric/vdd/" />
        <Database Name="ric-vee" Create="yes" Dir="/cachedb/v06/ric/vee/" />
        <Database Name="ric-vff" Create="yes" Dir="/cachedb/v06/ric/vff/" />
        <Database Name="ric-vgg" Create="yes" Dir="/cachedb/v06/ric/vgg/" />
        <Database Name="ric-vhh" Create="yes" Dir="/cachedb/v06/ric/vhh/" />
        <GlobalMapping Global="A*" From="RIC-VEE" />
		<GlobalMapping Global="B*" From="RIC-VBB" />
		<GlobalMapping Global="C*" From="RIC-VBB" />
		<GlobalMapping Global="D*" From="RIC-VGG" />
		<GlobalMapping Global="E*" From="RIC-VGG" />
		<GlobalMapping Global="F*" From="RIC-VEE" />
		<GlobalMapping Global="G*" From="RIC-VEE" />
		<GlobalMapping Global="H*" From="RIC-VEE" />
		<GlobalMapping Global="I*" From="RIC-VHH" />
		<GlobalMapping Global="J*" From="RIC-VBB" />
		<GlobalMapping Global="K*" From="RIC-VHH" />
		<GlobalMapping Global="L*" From="RIC-VGG" />
		<GlobalMapping Global="M*" From="RIC-VBB" />
		<GlobalMapping Global="N*" From="RIC-VHH" />
		<GlobalMapping Global="O*" From="RIC-VEE" />
		<GlobalMapping Global="OR" From="RIC-VDD" />
		<GlobalMapping Global="P*" From="RIC-VHH" />
		<GlobalMapping Global="PS*" From="RIC-VCC" />
		<GlobalMapping Global="PXRMINDX" From="RIC-VFF" />
		<GlobalMapping Global="Q*" From="RIC-VGG" />
		<GlobalMapping Global="R*" From="RIC-VGG" />
		<GlobalMapping Global="S*" From="RIC-VHH" />
		<GlobalMapping Global="T*" From="RIC-VAA" />
		<GlobalMapping Global="U*" From="RIC-VHH" />
		<GlobalMapping Global="V*" From="RIC-VHH" />
		<GlobalMapping Global="W*" From="RIC-VHH" />
		<GlobalMapping Global="X*" From="RIC-VBB" />
		<GlobalMapping Global="Y*" From="RIC-VGG" />
		<GlobalMapping Global="Z*" From="RIC-VGG" />	
      </Configuration>
    </Namespace>


    <Namespace Name="sam" Create="yes" Code="sam-rou" Data="sam-rou">
      <Configuration>
        <Database Name="sam-rou" Create="yes" Dir="/cachedb/v06/sam/rou/" />
        <Database Name="sam-vaa" Create="yes" Dir="/cachedb/v06/sam/vaa/" />
        <Database Name="sam-vbb" Create="yes" Dir="/cachedb/v06/sam/vbb/" />
        <Database Name="sam-vcc" Create="yes" Dir="/cachedb/v06/sam/vcc/" />
        <Database Name="sam-vdd" Create="yes" Dir="/cachedb/v06/sam/vdd/" />
        <Database Name="sam-vee" Create="yes" Dir="/cachedb/v06/sam/vee/" />
        <Database Name="sam-vff" Create="yes" Dir="/cachedb/v06/sam/vff/" />
        <Database Name="sam-vgg" Create="yes" Dir="/cachedb/v06/sam/vgg/" />
        <Database Name="sam-vhh" Create="yes" Dir="/cachedb/v06/sam/vhh/" />
        <Database Name="sam-vii" Create="yes" Dir="/cachedb/v06/sam/vii/" />
		<GlobalMapping Global="%Z*" From="SAM-VGG" />
		<GlobalMapping Global="A*" From="SAM-VAA" />
		<GlobalMapping Global="B*" From="SAM-VAA" />
		<GlobalMapping Global="C*" From="SAM-VAA" />
		<GlobalMapping Global="CacheTemp" From="CACHETEMP" />
		<GlobalMapping Global="D*" From="SAM-VAA" />
		<GlobalMapping Global="E*" From="SAM-VBB" />
		<GlobalMapping Global="F*" From="SAM-VBB" />
		<GlobalMapping Global="G*" From="SAM-VBB" />
		<GlobalMapping Global="H*" From="SAM-VCC" />
		<GlobalMapping Global="I*" From="SAM-VCC" />
		<GlobalMapping Global="J*" From="SAM-VCC" />
		<GlobalMapping Global="K*" From="SAM-VCC" />
		<GlobalMapping Global="L*" From="SAM-VCC" />
		<GlobalMapping Global="M*" From="SAM-VBB" />
		<GlobalMapping Global="N*" From="SAM-VBB" />
		<GlobalMapping Global="O*" From="SAM-VEE" />
		<GlobalMapping Global="OR" From="SAM-VII" />
		<GlobalMapping Global="P*" From="SAM-VFF" />
		<GlobalMapping Global="PS*" From="SAM-VHH" />
		<GlobalMapping Global="PXRMINDX" From="SAM-VDD" />
		<GlobalMapping Global="Q*" From="SAM-VFF" />
		<GlobalMapping Global="R*" From="SAM-VFF" />
		<GlobalMapping Global="S*" From="SAM-VGG" />
		<GlobalMapping Global="T*" From="SAM-VGG" />
		<GlobalMapping Global="TMP" From="CACHETEMP" />
		<GlobalMapping Global="U*" From="SAM-VGG" />
		<GlobalMapping Global="UTILITY" From="CACHETEMP" />
		<GlobalMapping Global="V*" From="SAM-VHH" />
		<GlobalMapping Global="W*" From="SAM-VHH" />
		<GlobalMapping Global="X*" From="SAM-VGG" />
		<GlobalMapping Global="Y*" From="SAM-VGG" />
		<GlobalMapping Global="Z*" From="SAM-VGG" />
		<GlobalMapping Global="mtemp*" From="CACHETEMP" />
      </Configuration>
    </Namespace>                
        
    <Namespace Name="sby" Create="yes" Code="sby-rou" Data="sby-rou">
      <Configuration>
        <Database Name="sby-rou" Create="yes" Dir="/cachedb/v06/sby/rou/" />
        <Database Name="sby-vaa" Create="yes" Dir="/cachedb/v06/sby/vaa/" />
        <Database Name="sby-vbb" Create="yes" Dir="/cachedb/v06/sby/vbb/" />
        <Database Name="sby-vcc" Create="yes" Dir="/cachedb/v06/sby/vcc/" />
        <Database Name="sby-vdd" Create="yes" Dir="/cachedb/v06/sby/vdd/" />
        <Database Name="sby-vee" Create="yes" Dir="/cachedb/v06/sby/vee/" />
        <Database Name="sby-vff" Create="yes" Dir="/cachedb/v06/sby/vff/" />
        <Database Name="sby-vgg" Create="yes" Dir="/cachedb/v06/sby/vgg/" />
        <Database Name="sby-vhh" Create="yes" Dir="/cachedb/v06/sby/vhh/" />
        <Database Name="sby-vii" Create="yes" Dir="/cachedb/v06/sby/vii/" />
        <Database Name="sby-vjj" Create="yes" Dir="/cachedb/v06/sby/vjj/" />
        <GlobalMapping Global="%Z*" From="SBY-VII" />
		<GlobalMapping Global="A*" From="SBY-VAA" />
		<GlobalMapping Global="B*" From="SBY-VAA" />
		<GlobalMapping Global="C*" From="SBY-VAA" />
		<GlobalMapping Global="CacheTemp" From="CACHETEMP" />
		<GlobalMapping Global="D*" From="SBY-VAA" />
		<GlobalMapping Global="E*" From="SBY-VBB" />
		<GlobalMapping Global="F*" From="SBY-VBB" />
		<GlobalMapping Global="G*" From="SBY-VBB" />
		<GlobalMapping Global="H*" From="SBY-VCC" />
		<GlobalMapping Global="I*" From="SBY-VCC" />
		<GlobalMapping Global="J*" From="SBY-VCC" />
		<GlobalMapping Global="K*" From="SBY-VCC" />
		<GlobalMapping Global="L*" From="SBY-VCC" />
		<GlobalMapping Global="M*" From="SBY-VDD" />
		<GlobalMapping Global="N*" From="SBY-VDD" />
		<GlobalMapping Global="O*" From="SBY-VEE" />
		<GlobalMapping Global="OR" From="SBY-VJJ" />
		<GlobalMapping Global="P*" From="SBY-VDD" />
		<GlobalMapping Global="PS*" From="SBY-VHH" />
		<GlobalMapping Global="PXRMINDX" From="SBY-VFF" />
		<GlobalMapping Global="Q*" From="SBY-VDD" />
		<GlobalMapping Global="R*" From="SBY-VDD" />
		<GlobalMapping Global="S*" From="SBY-VGG" />
		<GlobalMapping Global="T*" From="SBY-VGG" />
		<GlobalMapping Global="TMP" From="CACHETEMP" />
		<GlobalMapping Global="U*" From="SBY-VGG" />
		<GlobalMapping Global="UTILITY" From="CACHETEMP" />
		<GlobalMapping Global="V*" From="SBY-VHH" />
		<GlobalMapping Global="W*" From="SBY-VHH" />
		<GlobalMapping Global="X*" From="SBY-VII" />
		<GlobalMapping Global="Y*" From="SBY-VII" />
		<GlobalMapping Global="Z*" From="SBY-VII" />
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