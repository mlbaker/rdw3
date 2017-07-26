Class Apex.VistaDDBrowser Extends %ZEN.Component.page
{

/// Comma-separated list of User class packages whose HTML class
/// and style definitions are in pre-generated include files.
Parameter USERPACKAGES;

/// Class name of application this page belongs to.
Parameter APPLICATION;

/// Displayed name of this page.
Parameter PAGENAME;

/// Domain used for localization.
Parameter DOMAIN;

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
      /* style for title bar */
      #title {
        background: #C5D6D6;
        color: black;
        font-family: Verdana;
        font-size: 1.5em;
        font-weight: bold;
        padding: 5px;
        border-bottom: 1px solid black;
        text-align: center;
      }
      #ddTree {
      	border: 1px darkblue solid;
      	background: #CBE6EB;
      	background-position: right;
      	background-image: url(images/docindexgradient.png);
      	background-repeat: repeat-y;
      	height: 700px;
      	width: 400px;
      	overflow: auto;
      }
      #hgroup1 {
      	border: 1px darkblue solid;
      	background: #CBE6EB;
      	background-position: right;
      	background-image: url(images/docindexgradient.png);
      	background-repeat: repeat-y;
      	height: 700px;
      	width: 950px;
      	overflow: auto;
      }
      #vgroup2 {
      	border: 1px darkblue solid;
      	height: 600px;
      	width: 400px;
      	overflow: auto;
      }
      #fieldTitle {
        background: #C5D6D6;
        color: black;
        font-family: Verdana;
        font-size: 1.2em;
        font-weight: bold;
        padding: 5px;
        width: 940px;
        border-bottom: 1px solid black;
        text-align: center;
      }
    </style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Vista DD Browser">
      <html id="title">Vista Data Dictionary</html>
      <spacer height="25"/>
      <hgroup width="100%">
      	<dynaTree id="ddTree" OnGetTreeInfo="GetTreeInfo" onclick="zenPage.treeClick(zenThis);" />
      	<spacer width="25"/>
      	<hgroup id="hgroup1">
      		<vgroup >
      			<label id="fieldTitle" value="Selected FileMan Field Attributes" />
      			<spacer height="25"/>
      			<label id="fieldName" />
      			<spacer height="25"/>
      			<label id="fieldNum" />
      			<spacer height="25"/>
      			<label id="fileNum" />
      			<spacer height="25"/>
      			<label id="fieldType" />
      			<spacer height="25"/>
      			<label id="global" />
      		</vgroup>
      	</hgroup>
      </hgroup>
    </page>
}

ClassMethod Initialize()
{
}

ClassMethod GetTreeInfo(pRoot As %String, Output pTree, ByRef pParms) As %Status
{
  if pRoot=""
  {
  	Set tStatement=##class(%SQL.Statement).%New()
  	Set sql="SELECT VistaSite,VistaFileNumber,VistaFileName FROM Dim.VistaFilev001 where VistaSite->Sta3n=516"
  	Set Status=tStatement.%Prepare(sql)
  	Set rSet=tStatement.%Execute()
  	Set i=1
  	While rSet.%Next() {
  	    #; top-most nodes are children of 0
  		Set pTree(0,"ch",i) = ""
  		#; each node supplies: $LB(caption, value, hasChildren, link, expanded, icon)
  		Set pTree(i)= $ListBuild(rSet.VistaFileNumber_" - "_rSet.VistaFileName,rSet.VistaFileNumber,1,"",0)
  		Set i=i+1
  	}  	
  }
  else
  {
  	Set vistaFileNumber=pRoot
  	Set tStatement=##class(%SQL.Statement).%New()
  	Set sql="SELECT VistaFieldNumber,VistaFieldName,SubFileNumber FROM Dim.VistaFieldv001 where VistaSite->Sta3n=516 and VistaFileNumber='"_vistaFileNumber_"'"
  	Set Status=tStatement.%Prepare(sql)
  	Set rSet=tStatement.%Execute()
  	Set i=.1
  	While rSet.%Next() {
  	    #; top-most nodes are children of 0
  		Set pTree(0,"ch",pRoot+i) = ""
  		#; each node supplies: $LB(caption, value, hasChildren, link, expanded, icon)
  		Set pTree(pRoot+i)= $ListBuild(rSet.VistaFieldNumber_" - "_rSet.VistaFieldName,pRoot_"^"_rSet.VistaFieldNumber,0,"",0)
  		If rSet.SubFileNumber]"" {
  			Set pTree(pRoot+i)= $ListBuild(rSet.VistaFieldNumber_" - "_rSet.VistaFieldName_" - "_rSet.SubFileNumber,rSet.SubFileNumber,1,"",0)
  		}
  		Set i=i+.1
  	}
  	
  }
  Do rSet.%Close()
  Do tStatement.%Close()
  Quit $$$OK
}

/// treeClick
ClientMethod treeClick(tree) [ Language = javascript ]
{
	var fldNameLabel = this.getComponentById('fieldName');
	var fldNumLabel = this.getComponentById('fieldNum');
	var fileNumLabel = this.getComponentById('fileNum');
	var fldTypeLabel = this.getComponentById('fieldType');
	var globalLabel = this.getComponentById('global');
    var index=tree.getProperty('selectedIndex');
    var parent=tree.getNodeParent(index);
    var fileNum=tree.getNodeValue(parent);
    if (parent>-1) {
    	var nodeValue=tree.getProperty('value');
        var fieldName=tree.getProperty('text');
    	fldNameLabel.setValue('Field Name : ' + fieldName.split(' -')[1]);
    	fldNumLabel.setValue('Field Number : ' + fieldName.split(' -')[0]);
        fileNumLabel.setValue('File Number : ' + fileNum);
        var fldAtts = zenPage.GetFieldInfo(fileNum,fieldName.split(' - ')[0]);
        var global='$Piece($Get(^|NS|'+fldAtts.split('^')[1]+'),"^",'+fldAtts.split('^')[2]+')'
        fldTypeLabel.setValue('VISTA Field Type: '+fldAtts.split('^')[0]);
        globalLabel.setValue('VISTA Global Location: '+global);
        
	}
}

ClassMethod GetFieldInfo(fileNum As %String, fieldNum As %String) As %String [ ZenMethod ]
{
	Set return=fileNum_"~"_fieldNum
	Set sql="SELECT VistaFieldType, GlobalNode , GlobalPiece FROM Dim.VistaFieldv001 "_
		"WHERE VistaFileNumber='"_fileNum_"' AND VistaFieldNumber='"_fieldNum_"' AND VistaSite=516"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set return=rSet.VistaFieldType_rSet.GlobalNode_"^"_rSet.GlobalPiece
	}
	Quit return
}

}
