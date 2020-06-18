/*  00_basics_form ()
 Created by: Kirk as Designer, Created: 06/18/20, 07:50:34
 ------------------
Form method 

*/

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		contact_LB ("init")
		$names_c:=New collection:C1472(\
			New object:C1471("name";"Kirk");\
			New object:C1471("name";"Guy");\
			New object:C1471("name";"Brent");\
			New object:C1471("name";"Jim");\
			New object:C1471("name";"Joe");\
			New object:C1471("name";"Binky"))
		
		Form:C1466.contact_LB.data:=$names_c
		
End case 
