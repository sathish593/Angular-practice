

/*function mycontroller1($scope) { 
    
 
 
   $scope.toggle = function() { 
     $scope.visible = !$scope.visible; 
   }; 
 } */
/*function MyController1($scope) {
	$scope.visible = true;
	}*/
	app = angular.module('myapp', []);
	/*app.config(['$controllerProvider', function($controllerProvider) {
	     $controllerProvider.allowGlobals();
	}]);*/
	app.controller('MyController1', ['$scope', function ($scope) {
		$scope.visible = true;
		 $scope.toggle = function() { 
		     $scope.visible = !$scope.visible; };
	}]);