// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.controller("adminHotelTerminalController", function($scope, $http) {


    $http.get("/api/v1/hotel")
    .then(function(response) {
        
        $scope.hotelDetails = response.data.result.hotel;
        console.log($scope.hotelDetails);
    })
    .catch(function(err) {
        console.log(err);
    });


    $scope.searchHotelOnChange = function(){
        if($scope.searchHotel){
            console.log($scope.searchHotel);
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
    
    // $scope.hotelDetails = hotelDetails.hotel[0];

    
    $scope.onHotelSelect = function (item) {
        console.log(item);
        $http.get(API_BASE_URL+"/api/v1/hotel", {params : {id : item.id}})
        .then(function(response) {
            console.log(response.data.result);
            $scope.hotelDetails = response.data.result.hotel[0];
        })
        .catch(function(err) {
            console.log(err);
        })
        ;
    };

    $scope.loadRoomPartners = function(hotelId) {
        console.log("hotelId = ", hotelId);


    };

    $scope.changeSitePrice = function(e) {
        console.log(e.keyCode);

        if(e.keyCode == 13){

            $("#confirmModal").modal('show');

        }
    };
});