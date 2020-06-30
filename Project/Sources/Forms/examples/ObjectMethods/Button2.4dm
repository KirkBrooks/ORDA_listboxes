

timeStart:=Current time:C178

ALL RECORDS:C47([Contacts:1])

ARRAY DATE:C224(aCrewDate;0)
ARRAY TEXT:C222(aCrewName;0)
ARRAY REAL:C219(aCrewHours;0)

SELECTION TO ARRAY:C260([Contacts:1]birthday:8;aCrewDate;[Contacts:1]first_name:2;aCrewName;[Contacts:1]phone:7;aCrewPhone;[Contacts:1]last_name:3;aCrewNameLast)

For ($i;1;Size of array:C274(aCrewName))
	If (aCrewNameLast{$i}#"")
		aCrewName{$i}:=aCrewName{$i}+" "+aCrewNameLast{$i}
	End if 
End for 

timeStop:=Current time:C178