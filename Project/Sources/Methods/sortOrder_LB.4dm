//%attributes = {}


C_OBJECT:C1216($es)
  //$es:=ds.Products.query("ProductID = :1";150)

C_COLLECTION:C1488($productColl)
  //$productColl:=ds.Products.query("WebReportShow = :1";True).toCollection("WebReportShow, Name, DateCreated, DateAvailable")

$productColl:=ds:C1482.Products.query("WebReportShow = :1";True:C214).orderBy("DateAvailable asc").toCollection("WebReportShow, Name, DateAvailable, ProductID")
  //$productColl:=$es.toCollection("WebReportShow, Name, DateCreated")

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

$form_o.lb_es:=New object:C1471(\
"data";$productColl;\
"curItem";Null:C1517;\
"pos";-1;\
"selected";Null:C1517)

$wndRef:=Open form window:C675("Product_SortWebItems")
SET WINDOW TITLE:C213("Sort Product List")
DIALOG:C40("Product_SortWebItems";$form_o)

If (OK=1)
	
	$count:=1
	For each ($element;$form_o.lb_es.data)
		
		  // update records - option 1
		  //$pid:=$element.ProductID
		  //QUERY([Products];[Products]ProductID=$pid)
		  //[Products]DateAvailable:=Add to date(!00-00-00!;2020;Month of(CurrentDate);$count)
		  //SAVE RECORD([Products])
		  //$count:=$count+1
		
		  // update records - option 2?
		  //$element["DateAvailable"]:=Add to date(!00-00-00!;2020;Month of(CurrentDate );$count)
		  //$element.save()
		
	End for each 
	
End if 