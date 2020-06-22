//%attributes = {}
/*  import_contacts ()
 Created by: Kirk as Designer, Created: 06/21/20, 18:00:02
 ------------------
 Purpose: 

*/

$path:=Folder:C1567(fk database folder:K87:14).platformPath+"sample data"+Folder separator:K24:12+"mock_data.json"
$text:=File:C1566($path;fk platform path:K87:2).getText()

$contacts_c:=JSON Parse:C1218($text)


For each ($o;$contacts_c)
	OB REMOVE:C1226($o;"id")
	
	$new_obj:=ds:C1482.Contacts.new()
	$new_obj.fromObject($o)
	$new_obj.save()
	
End for each 

BEEP:C151
