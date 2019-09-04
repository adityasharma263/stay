// Note: b2b_selected_deal and room id - 
// NOte: for dropdown orderby room id

// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.controller("adminHotelTerminalController", function ($scope, $http) {

    $scope.roomPriceStructureB2B = {};


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
            { params: { room_id: roomID, b2b_selected_deal: true}})
            .then(function(response) {
                $scope.roomPriceStructureB2B[roomID] = response.data;
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


});