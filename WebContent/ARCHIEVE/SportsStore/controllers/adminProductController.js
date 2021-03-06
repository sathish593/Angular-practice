﻿angular.module("sportsStoreAdmin")
.constant("productUrl", "https://api.parse.com/1/classes/Products/")
.run(function ($http) {
	$http.defaults.headers.common["X-Parse-Application-Id"]
    = "DDhn4YXQ3sezLYA8bN8hWBNY1Dx4xJ8R7IFmcVAw";
$http.defaults.headers.common["X-Parse-REST-API-Key"]
    = "0tgFI2G7U28OtGu6RFvPdFJpK5WIsFnkbD3Og93o";
})
.controller("productCtrl", function ($scope, $http, $resource, productUrl) {

    $scope.$on("sessionToken", function (sessionToken) {
        $http.defaults.headers.common["X-Parse-Session-Token"] = sessionToken;
    });

    function getData(data, headers) {
        return JSON.parse(data).results;
    }
   
    $scope.productsResource = $resource(productUrl + ":id", { id: "@objectId" }, {
        query: { method: "GET", isArray: true, transformResponse: getData },
        update: { method: "PUT"}
    });

    $scope.listProducts = function () {  
        $scope.products = $scope.productsResource.query();
    }

    $scope.deleteProduct = function (product) {
        product.$delete().then(function () {
            $scope.products.splice($scope.products.indexOf(product), 1);
        });
    }

    $scope.createProduct = function (product) {
        new $scope.productsResource(product).$save().then(function (response) {
            response.$get().then(function (newProduct) {
                $scope.products.push(newProduct);
                $scope.editedProduct = null;
            }) 
        });
    }

    $scope.updateProduct = function (product) {
        var pCopy = {};
        angular.copy(product, pCopy)
        pCopy.$update().then(function () {
            $scope.editedProduct = null;
        })
    }

    $scope.startEdit = function (product) {
        $scope.editedProduct = product;
    }

    $scope.cancelEdit = function () {
        $scope.editedProduct = null;
    }

    $scope.listProducts();
});
