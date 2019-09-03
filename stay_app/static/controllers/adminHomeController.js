// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.controller("adminHomeController", function($scope, $http) {

   
    $scope.searchHotelOnChange = function(){

        if($scope.searchHotel){
            $http.post("/admin/hotel/search", {search : $scope.searchHotel})
            .then(function(respsonse){
                console.log(respsonse);
                $scope.searchResult = respsonse.data.result.names;
            })
            .catch(function(err) {
                console.log("err ", err);
            });

        }
    };

    $scope.onHotelSelect = function (item) {
        console.log(item);
        
        
    };

});



