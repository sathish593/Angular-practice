<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>jquery_json</title>
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert("sdgs");
	$("#but").click(function(){
		//alert("aasd");
		$.ajax({
			url:"text.html",
			success:function(res){
				$("#div1").text(res);
			},
			error:function(error){
				$("#div1").text(error);
			}
		});
	});
});

</script>
</head>
<body>
<b>WELCOME</b>
<input type="button" id="but" value="fetch" />
<div id="div1"></div>

</body>
</html>