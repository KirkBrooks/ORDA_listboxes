//%attributes = {}
/*  contact_LB (text)
$1: action to perform
 Created by: Kirk as Designer, Created: 06/18/20, 08:05:09
 ------------------
 Purpose: controller method contact listbox

*/

C_TEXT:C284($1;$lb_name)
C_OBJECT:C1216($0;$o)

$lb_name:=Current method name:C684

Case of 
	: (Form:C1466=Null:C1517)
		  // this method only works in the context of a form
	: (Count parameters:C259=0)  //  
		$o:=Form:C1466[$lb_name]  // get our listbox object from Form
		
		If ($o.meta#Null:C1517)  // check it's defined
			
			Case of 
				: (This:C1470.name="Kirk")
					$0:=$o.meta[1]
				: (This:C1470.name="J@")
					$0:=$o.meta[2]
				Else   // return our default format
					$0:=$o.meta[0]
			End case 
		End if 
		
	: ($1="init")
		$o:=New object:C1471("name";"contact_LB")
		$o.data:=Null:C1517  //  collection or entity selection
		$o.curItem:=Null:C1517  //   currently selected item
		$o.pos:=Null:C1517  //       position (not index) of current item
		$o.selected:=Null:C1517
		$o.meta:=New collection:C1472  // meta expression object 
		$o.meta.push(New object:C1471(\
			"stroke";"automatic";\
			"fill";"automatic";\
			"fontStyle";"normal";\
			"fontWeight";"bold";\
			"textDecoration";"normal"))
		
		  //  [1] will underline the text
		$o.meta.push(New object:C1471(\
			"stroke";"dodgerblue";\
			"fill";"automatic";\
			"fontStyle";"normal";\
			"fontWeight";"normal";\
			"textDecoration";"underline"))
		
		  //[2] will make the text red and italic
		$o.meta.push(New object:C1471(\
			"stroke";"#ff0000";\
			"fill";"automatic";\
			"fontStyle";"italic";\
			"fontWeight";"normal";\
			"textDecoration";"normal"))
		
		Form:C1466[$lb_name]:=$o
End case 
