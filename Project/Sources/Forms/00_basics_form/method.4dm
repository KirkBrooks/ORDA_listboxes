/*  00_basics_form ()
 Created by: Kirk as Designer, Created: 06/18/20, 07:50:34
 ------------------
Form method 

*/

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		  //contact_LB ("init")
		  //$names_c:=New collection(\
			New object("name";"Kirk");\
			New object("name";"Guy");\
			New object("name";"Brent");\
			New object("name";"Jim");\
			New object("name";"Joe");\
			New object("name";"Binky"))
		
		  //Form.contact_LB.data:=$names_c
		
End case 
