// Note: b2b_selected_deal and room id - 
// NOte: for dropdown orderby room id

// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap'); // dependency for dropdown suggestion
app.requires.push('toaster');
app.controller("adminHotelTerminalController", function ($scope, $http, toaster) {

    $scope.roomPriceStructureB2B = {};

    // room_id=9&b2b_selected_deal=true&order_by=base_price
    // this above filter is use for selected price and sorted deal



    $scope.updateSitePriceValues = {};


    var page = 1;
    $scope.hasMoreResults = true;
    var HotelFilter = {};


    $http.get("/api/v1/hotel/terminal")
        .then(function (response) {

            $scope.hotelDetails = response.data.result.hotel;
            console.log($scope.hotelDetails);

        })
        .catch(function (err) {
            console.log(err);
        });


    $scope.getRoomPriceByID = function (roomID) {

        $http.get("/api/v1/deal",
            { params: { room_id: roomID, "order_by": "base_price" } })
            .then(function (response) {
                $scope.roomPriceStructureB2B[roomID] = response.data.result.deal;
                console.log($scope.roomPriceStructureB2B);
            }).catch(function (err) {
                console.log(err);
            });
        console.log("roomID = ", roomID);
    };



    $scope.searchHotelOnChange = function () {
        if ($scope.searchHotel) {
            console.log($scope.searchHotel);
            $http.post("/admin/hotel/search", { search: $scope.searchHotel })
                .then(function (respsonse) {
                    console.log(respsonse);

                    $scope.searchResult = respsonse.data.result.names;
                    var cityArrayObj = [];
                    respsonse.data.result.cities.forEach(city => {
                        $scope.searchResult.push({ name: city, is_city: true });
                    });
                })
                .catch(function (err) {
                    console.log("err ", err);
                });
        }
    };


    $scope.onHotelSelect = function (item) {
        console.log(item);
        HotelFilter = {};
        if (item.is_city) {
            HotelFilter.city = item.name;
            $scope.hasMoreResults = true;
        }
        else {
            HotelFilter.id = item.id;
            $scope.hasMoreResults = false;
        }
        $http.get("/api/v1/hotel/terminal", { params: HotelFilter })
            .then(function (response) {
                $scope.hotelDetails = response.data.result.hotel;
                setTimeout(() => {
                console.log("onHotelSelect = ",$scope.hotelDetails);
                    
                }, 500);
            })
            .catch(function (err) {
                console.log(err);
            });
    };

    $scope.loadRoomPrice = function (roomID, loadRoomPriceFor) {

        console.log("hotelId = ", roomID);

        $scope.selectedRoom = roomID;

        //  1 = b2b, 0 = b2c
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
    //     
    // }, 1000);


    $scope.addPrice = function (selectedDealType) {

        console.log("$scope.updateSitePriceValues = ", $scope.updateSitePriceValues);


        if (selectedDealType == 1) {

            if (typeof $scope.updateSitePriceValues.selectedPartnerPrice != "object")
                $scope.updateSitePriceValues.selectedPartnerPrice = JSON.parse($scope.updateSitePriceValues.selectedPartnerPrice);


            var dealID = $scope.updateSitePriceValues.selectedPartnerPrice.id;
            var room_id = $scope.updateSitePriceValues.selectedPartnerPrice.room;

            $http.put(`/api/v1/deal/${dealID}`,
                {
                    "b2b_final_price": $scope.updateSitePriceValues.final_price,
                    "b2b_selected_deal": true,
                    "room_id": room_id
                })
                .then(function (response) {
                    console.log("response : ", response);
                    toaster.pop('success', "Deal Updated");


                })
                .catch(function (err) {
                    console.log(err);

                });
        } else {

            console.log("in the selectedDealType == 0");
            if (typeof $scope.updateSitePriceValues.selectedPartnerPrice != "object")
                $scope.updateSitePriceValues.selectedPartnerPrice = JSON.parse($scope.updateSitePriceValues.selectedPartnerPrice);


            var dealID = $scope.updateSitePriceValues.selectedPartnerPrice.id;
            var room_id = $scope.updateSitePriceValues.selectedPartnerPrice.room;

            $http.put(`/api/v1/deal/${dealID}`,
                {
                    "b2c_final_price": $scope.updateSitePriceValues.final_price,
                    "b2b_selected_deal": true,
                    "room_id": room_id
                })
                .then(function (response) {
                    console.log("response : ", response);
                    toaster.pop('success', "Deal Updated.");
                })
                .catch(function (err) {
                    console.log(err);
                    toaster.pop('danger', "Deal Update Failed.");

                });


        }


    };

    // filterFor is used for dynamic code, value either 'b2b' or 'b2c'
    $scope.getSelectedDeal = function (dealsArray, filterFor) {
        // console.log("dealsArray= ", dealsArray);
        if(!dealsArray)
        return;
        var selectedDeal = dealsArray.filter(function (deal) {
            return deal[filterFor+"_selected_deal"];
        });


        return selectedDeal[0] ? {
            
            "final_price": selectedDeal[0][filterFor+"_final_price"],
            "base_price": selectedDeal[0].base_price
        } : undefined;
    };


    $scope.loadMore = function () {

        HotelFilter.page = ++page;

        // page++;

        $http.get("/api/v1/hotel/terminal", { params: HotelFilter })
            .then(function (response) {

                var result = response.data.result.hotel;
                $scope.hotelDetails = $scope.hotelDetails.concat(result);
                console.log($scope.hotelDetails);
                if (!result.length) {
                    $scope.hasMoreResults = false;
                    toaster.pop("error", "No more results");
                }
            })
            .catch(function (err) {
                console.log(err);
            });

    }





});