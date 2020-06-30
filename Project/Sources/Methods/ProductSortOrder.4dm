//%attributes = {}

  // Method name: Product_SortWebCartItems
  // Created: Guy Algot, 06/27/20, 14:45:04
  // Description
  // 
  //
  // Parameters --
  //
  // Returns --
  //   none
  //
  // History --
  //
  // Comments --
  //
  // ----------------------------------------------------
  // # Start method

  //$employees:=ds.Employee.all()

C_OBJECT:C1216($es)

C_COLLECTION:C1488($productColl)

$productColl:=ds:C1482.Contacts.query("gender = :1";"female").toCollection("first_name, last_name, address, id")


$count:=1
For each ($element;$productColl)
	OB SET:C1220($element;"DisplayOrder";$count)
	$count:=$count+1
End for each 

  //C_COLLECTION($c)
  //$productColl:=$productColl.orderBy("DisplayOrder asc")  // desc  // (ck ascending)

  // setup the form & open the dialog
$form_o:=New object:C1471

$form_o.window:=New object:C1471(\
"index";-1)

$form_o.lb:=New object:C1471(\
"data";$productColl;\
"curItem";Null:C1517;\
"pos";-1;\
"selected";Null:C1517)

$wndRef:=Open form window:C675("Product_SortWebItems")
SET WINDOW TITLE:C213("Contact List")
DIALOG:C40("Product_SortWebItems";$form_o)


  // # End method
