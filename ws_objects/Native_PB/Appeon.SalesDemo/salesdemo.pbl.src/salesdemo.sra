$PBExportHeader$salesdemo.sra
$PBExportComments$Generated Application Object
forward
global type salesdemo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

//Service Type
Constant Int WEBAPI_DATASTORE = 1
Constant Int WEBAPI_MODELSTORE = 2
Constant Int WEBAPI_SQLMODELMAPPER = 3
Boolean gb_expand = True

String gs_msg_title = "Sales CRM Demo"

STRING	gs_echartstheme


end variables

global type salesdemo from application
string appname = "salesdemo"
string displayname = "SalesDemo"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 3
long richtexteditx64type = 3
long richtexteditversion = 2
string richtexteditkey = ""
string appicon = ".\image\CRM.ico"
string appruntimeversion = "19.2.0.2670"
end type
global salesdemo salesdemo

on salesdemo.create
appname="salesdemo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on salesdemo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;String  ls_theme
ls_theme = ProfileString("apisetup.ini", "Setup", "Theme", "Flat Design Blue")
IF ls_theme <> "Do Not Use Themes" THEN
	applytheme(GetCurrentDirectory( ) + "\Theme\" + ls_theme)
END IF

// Profile PB Demo DB V2019R3
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2019R3;UID=dba;PWD=sql'"


Connect Using SQLCA;

//SQLCA.Autocommit = True

Choose Case GetTheme()
	Case "Flat Design Silver"
		gs_EChartsTheme = 'default'
	Case "Flat Design Blue"
		gs_EChartsTheme = 'light'
	Case "Flat Design Dark"
		gs_EChartsTheme = 'dark'
	Case "Flat Design Grey"
		gs_EChartsTheme = 'default'
	Case Else
End Choose

open(w_main)
end event

