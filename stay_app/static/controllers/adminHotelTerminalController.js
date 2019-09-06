// Note: b2b_selected_deal and room id - 
// NOte: for dropdown orderby room id

// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.requires.push('toaster');
app.controller("adminHotelTerminalController", function ($scope, $http, toaster) {

    $scope.roomPriceStructureB2B = {};

    // room_id=9&b2b_selected_deal=true&order_by=base_price
    // this above filter is use for selected price and sorted deal



    $scope.updateSitePriceValues = {};

    $http.get("/api/v1/hotel/terminal")
        .then(function (response) {

            $scope.hotelDetails = response.data.result.hotel;
            console.log($scope.hotelDetails);

        })
        .catch(function (err) {
            console.log(err);
        });


        $scope.getRoomPriceByID  = function(roomID){

            $http.get("/api/v1/deal",
            { params: { room_id: roomID, b2b_selected_deal: true, "order_by": "base_price"}})
            .then(function(response) {
                $scope.roomPriceStructureB2B[roomID] = response.data.result.deal;
                console.log($scope.roomPriceStructureB2B);
            }).catch(function(err) {
                console.log(err);
            });
            console.log("roomID = ",roomID);
        };
    


    $scope.searchHotelOnChange = function () {
        if ($scope.searchHotel) {
            console.log($scope.searchHotel);
            $http.post("/admin/hotel/search", { search: $scope.searchHotel })
                .then(function (respsonse) {
                    console.log(respsonse);
                    $scope.searchResult = respsonse.data.result.names;
                })
                .catch(function (err) {
                    console.log("err ", err);
                });
        }
    };


    $scope.onHotelSelect = function (item) {
        console.log(item);
        $http.get(API_BASE_URL + "/api/v1/hotel", { params: { id: item.id } })
            .then(function (response) {
                console.log(response.data.result);
                $scope.hotelDetails = response.data.result.hotel[0];
            })
            .catch(function (err) {
                console.log(err);
            })
            ;
    };

    $scope.loadRoomPrice = function (roomID, loadRoomPriceFor) {

        console.log("hotelId = ", roomID);

        $scope.selectedRoom = roomID; 

        $scope.selectedDealType = loadRoomPriceFor;

        // $http.get("/api/v1/deal",
        //     { params: { room_id: roomID, order_by : loadRoomPriceFor} })
        //     .then(function(response) {
        //         console.log("loadRoomPriceFor = ",response.data);
        //     }).catch(function(err) {
        //         console.log(err);
        //     });



    };

    $scope.changeSitePrice = function (e) {
        console.log(e.keyCode);

        if (e.keyCode == 13) {

            $("#confirmModal").modal('show');

        }
    };

    // setTimeout(function(){
    //     console.log("Toast");
    //     toaster.pop('success', "Deal Updated", "Deal for this hotel is updated!");    
    // }, 1000);
    

    $scope.addPrice = function() {

        console.log("$scope.updateSitePriceValues = ",$scope.updateSitePriceValues);

        if(typeof $scope.updateSitePriceValues.selectedPartnerPrice != "object")
            $scope.updateSitePriceValues.selectedPartnerPrice = JSON.parse($scope.updateSitePriceValues.selectedPartnerPrice);
        
        
        var dealID = $scope.updateSitePriceValues.selectedPartnerPrice.id;
        var room_id = $scope.updateSitePriceValues.selectedPartnerPrice.room;

        $http.put(`/api/v1/deal/${dealID}`,
        {
            "b2b_final_price": $scope.updateSitePriceValues.final_price,
            "b2b_selected_deal" : true,
            "room_id": room_id
        })
        .then(function(response) {
            console.log("response : ",response);
            
        })
        .catch(function(err) {
            console.log(err);

        })
        ;


    };


});