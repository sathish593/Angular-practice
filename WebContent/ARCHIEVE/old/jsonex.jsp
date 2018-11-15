<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>json</title>
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript">
var arr=['h','i','j'];
var json1={name:"sathish",rollno:4,ph:9700}
var jsonarr=[{name:"sathish1",rollno:41,ph:9701},
             {name:"sathish2",rollno:42,ph:9702},
             {name:"sathish3",rollno:43,ph:9703}];
/* $(document).ready(function(){
	$.each(arr,function(id,obj){
		alert(id+"::"+obj);
	});
}); */
$(document).ready(function(){
	//alert(json1.name+"::"+json1.rollno+"::"+json1.ph);
	$.each(jsonarr,function(id,obj){
		alert(obj.name+"::"+obj.rollno+"::"+obj.ph);
	});
});
</script>
</head>
<body>
WELCOME
</body>
</html>