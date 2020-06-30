//%attributes = {}
/*  Show_FORM_00 ()
 Created by: Kirk as Designer, Created: 06/29/20, 14:10:26
 ------------------
 Purpose: 

*/

C_LONGINT:C283($1)
C_LONGINT:C283($id;$i;$window)
C_TEXT:C284($procName)

$procName:=Current method name:C684

Case of 
	: (Count parameters:C259=0)
		$id:=Process number:C372($procName)
		
		If ($id=0)
			$id:=New process:C317(Current method name:C684;0;$procName;Current process:C322)
		Else 
			BRING TO FRONT:C326($id)
		End if 
		
	: (Count parameters:C259=1)  //     new process
		
		$form_data:=New object:C1471()
		
		DIALOG:C40("00_basics_form";$form_data)
		
		
		
End case 

