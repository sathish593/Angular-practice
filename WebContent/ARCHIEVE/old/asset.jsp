<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>home</title>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/ngrou"></script>
<script type="text/javascript">


</script>
<style type="text/css">
body {
    background-color: #444;
    margin: 0;
}    
#wrapper {
     width: 92%;
     margin: 0 auto;
}
.div1, .div2 {
	padding-top:1%;
    border: 1px solid white;
    float: left;
    min-height: 450px;
    color: white;
}
.div1 {
     width: 22%;
     
     background-color: #00FFFF;
     color: #404040;

}
.div2 {
     width:50%;
     background-color:  #f7f7f7;
     zoom: 1;
     padding: 20px 25px 30px;
	 margin: 0 auto 25px;

		-moz-border-radius: 2px;
		-webkit-border-radius: 2px;
		border-radius: 2px;
		-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		color: #404040;
     }
     

</style>
</head>
<body ng-app>

<div id="wrapper">
<div class="div1">
<form>
<table>
<tr><td><pre><font color="red">INSERT RECORDS</font></pre></td></tr>
<tr><td>ID</td> <td><input type="text" name="id" />	</td></tr>
<tr><td>name</td><td><input type="text" name="name" />	 	</td></tr>       
<tr><td>type</td><td><input type="text" name="type" />	 	</td></tr>	
<tr><td>cost</td><td><input type="text" name="cost" />	 	</td></tr>
<tr><td>vendor</td><td><input type="text" name="vender" />	 	</td></tr>
<tr><td><a href="#list" >list</a></td></tr>

	</table>	
<br>
<table>

<tr><td><input type="button" value="insert" name="in"  onClick="insert()"/></td>
<td><input type="button" value="delete" name="del" onClick="deletRec()"/></td>
<td><input type="button" value="update" name="up" onClick="updateRec()"/></td>
<td><input type="button" value="getallrecords" name="get" onClick="getAll()"/></td></tr>
</table>
</form>
</div>
<div class="div2" ng-view></div>
</div>
</body>
<script type="text/javascript">
var asset=angular.module("asset",['ngRoute']);
asset.config(["$routeProvider",function($routeProvider){
	$routeProvider.when("/list",
			{
		 	templateUrl:"template/list.html",
		 	controller:"listcontroller"
			
			})
			.when("/details/:id",
			{
				 templateUrl:"template/details.html",
				 controller:"detailscontroller"
			})
			.otherwise(
					{
						redirectTo:"/list"});
}]);
asset.controller("listcontroller",function($scope,$http){
	$http.get("getallRec.action").
		success(function(data,status,header,config){
				
				$scope.list=data;
			})
		.error(function(data,status,header,config){
			alert(error);
		});
	
});
asset.controller("detailscontroller",function($scope,$routeParams,$http){
	$http.get("gerRec.action?id="+$routeParams.id).
	success(function(data,status,header,config){
			//alert(data.id);
			$scope.item=data;
		})
	.error(function(data,status,header,config){
		alert(error);
	});
	
});



</script>
</html>
