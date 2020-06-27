//%attributes = {}
/*  contact_01_LB (text)
$1: action to perform
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
		$o:=New object:C1471("name";$lb_name)
		
		$o.data:=Null:C1517  //  collection or entity selection
		$o.curItem:=Null:C1517  //   currently selected item
		$o.pos:=Null:C1517  //       position (not index) of current item
		$o.selected:=Null:C1517
		
		$o.search:=""
		
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
		
/* I could limit the user's access to the list of Contacts
  but for the demo I'm just going to use them all
Let's call the list the user has access to 'source'
*/
		$o.source:=ds:C1482.Contacts.all().orderBy("last_name asc")
		
		$o.data:=$o.source  //  populate .data with .source to start
		
		Form:C1466[$lb_name]:=$o
		
	: ($1="doSearch")
		$o:=Form:C1466[$lb_name]
		
		$o.search:=Get edited text:C655
		
		$o.data:=$o.source.query("last_name = :1";$o.search+"@").orderBy("last_name asc")
		
End case 
