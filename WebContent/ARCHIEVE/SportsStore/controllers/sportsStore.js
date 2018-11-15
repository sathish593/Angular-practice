angular.module("sportsStore")
    .constant("dataUrl", "https://api.parse.com/1/classes/Products")
    .constant("orderUrl", "https://api.parse.com/1/classes/Orders")
    .run(function ($http) {
        $http.defaults.headers.common["X-Parse-Application-Id"]
            = "DDhn4YXQ3sezLYA8bN8hWBNY1Dx4xJ8R7IFmcVAw";
        $http.defaults.headers.common["X-Parse-REST-API-Key"]
            = "0tgFI2G7U28OtGu6RFvPdFJpK5WIsFnkbD3Og93o";
    })
    .controller("sportsStoreCtrl", function ($scope, $http, $location,
        dataUrl, orderUrl, cart) {

        $scope.data = {
        };

        $http.get(dataUrl)
            .success(function (data) {
                $scope.data.products = data.results;
            })
            .error(function (response) {
                $scope.data.error = response.error || response;
            });

        $scope.sendOrder = function (shippingDetails) {
            var order = angular.copy(shippingDetails);
            order.products = cart.getProducts();
            $http.post(orderUrl, order)
                .success(function (data) {
                    $scope.data.orderId = data.objectId;
                    cart.getProducts().length = 0;
                }).error(function (error) {
                    $scope.data.orderError = error;
                }).finally(function () {
                    $location.path("/complete");
                });
        };
    });
