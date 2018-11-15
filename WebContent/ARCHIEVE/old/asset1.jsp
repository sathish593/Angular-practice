
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>home</title>
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#nameid").keypress(function(){
		//alert("asd");
		 $.ajax({
			url:"checkRecord.action?name="+$('#nameid').val(),
			success:function(res){
				if(res.name==null||res.name=="")
					{
					//alert(res.name);
					$("#msg").text("not exist you can procede");
					$("#typeid").val("");
					$("#costid").val("");
					$("#venid").val("");
					}
			
				else{
					$("#msg").text("data already exist");
					$("#nameid").val(res.name);
					$("#typeid").val(res.type);
					$("#costid").val(res.cost);
					$("#venid").val(res.vender);
				}
			},
			error:function(){
				alert("error");
			}
		});
		/* $.ajax({
			url:"checkRecord1.action?name="+$('#nameid').val(),
			success:function(res){
				//alert(res);
				res=JSON.parse(res);
				//alert(res.msg);
				$("#msg").text(res.msg);
			},
			error:function(){
				alert("error");
			}
		}); */
	});
});
</script>
<script type="text/javascript">
function insert() 
{
	
	 document.forms[0].action = "insertRec.action";
     document.forms[0].submit();
	
}
function getAll()
{
	document.forms[0].action = "getallRec.action";
    document.forms[0].submit();

}
function deletRec()
{
	document.forms[0].action = "deleteRec.action";
    document.forms[0].submit();

}
function updateRec()
{
	document.forms[0].action = "updateRec.action";
    document.forms[0].submit();

}


</script>
</head>
<body>


<form:form action="" commandName="pojo" enctype="multipart/form-data">
<table>
<tr><td><spring:message code="asset.id" />	</td><td>		:<form:input type="text" path= "id"     /></td></tr>
<tr><td><spring:message code="asset.name" />	 	</td><td>       :<form:input type="text" path= "name" id="nameid"   /></td><td><div id="msg"></div></td></tr>

<tr><td><spring:message code="asset.type" />	 	</td><td>		:<form:input type="text" path= "type"  id="typeid" /></td></tr>
<tr><td><spring:message code="asset.cost" />	 	</td><td>		:<form:input type="text" path= "cost"  id="costid" /></td></tr>
<tr><td><spring:message code="asset.vender" />	 	</td><td>		:<form:input type="text" path= "vender"id="venid" /></td></tr>
<tr><td>select file 	</td><td>		:<form:input type="file"  path= "file" /></td></tr>
	</table>	
<br>
<table>

<tr><td><input type="button" value="insert" name="in"  onClick="insert()"/></td>
<td><input type="button" value="delete" name="del" onClick="deletRec()"/></td>
<td><input type="button" value="update" name="up" onClick="updateRec()"/></td>
<td><input type="button" value="getallrecords" name="get" onClick="getAll()"/></td></tr>
</table>
<b>Download Files</b><br></br>
<a href="showfiles.action">Show files</a>
<table>
<s:forEach items="${fl}" var="obj">
	<tr><td><a href='download.action?file=${obj}'><s:out value="${obj}"/></a></td></tr>
	
</s:forEach>
</table>
</form:form>
</body>
</html>
