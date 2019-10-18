public class TestEventController { 

public String getTimeOnly() { 
String timeObj =''; 
try 
{ 
DateTime dt = DateTime.Parse(currentDT); 
timeObj = dt.format('hh:mm aaa'); 
} 
catch(Exception e) 
{ 
timeObj =''; 
} 
return timeObj ; 
} 


public String getDateOnly() { 
String dateObj =''; 
try 
{ 
DateTime dt = DateTime.Parse(currentDT); 
dateObj = dt.format('MM/dd/yyyy'); 
} 
catch(Exception e) 
{ 
dateObj = ''; 
} 
return dateObj ; 
} 


public string getstartDT() 
{ 
String LongDate = ' '; 
Datetime cDT = System.now(); 
LongDate = cDT.format('MM/dd/yyyy HH:mm aaa'); 
return LongDate; 
} 

public String currentDT {get;set;} 
}