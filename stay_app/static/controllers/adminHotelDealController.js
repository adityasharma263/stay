// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.requires.push('toaster');
app.controller("adminHotelDealController", function ($scope, $http, toaster) {

    $scope.partnerType = {
        DIRECT: 1,
        SUPPLIER: 2,
        PARTNER: 3,
    };

    $scope.partners = {};
    $scope.dealsData = {};

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

    console.log("hotelDetails = ", hotelDetails.hotel);

    $scope.hotelDetails = hotelDetails.hotel[0];


    $scope.onHotelSelect = function (item) {
        console.log(item);
        $http.get(API_BASE_URL + "/api/v1/hotel/terminal", { params: { id: item.id } })
            .then(function (response) {
                console.log(response.data.result);
                $scope.hotelDetails = response.data.result.hotel[0];
            })
            .catch(function (err) {
                console.log(err);
            })
            ;
    };

    $scope.listPartnerType = function (partnerType) {
        $scope.dealsData = {};

        var hotel_partner_url = `${partner_api_url}/partners_hotel.php?hotel_id=${$scope.hotelDetails.id}&type=${partnerType}`;

        $http.get(hotel_partner_url)
            .then(function (response) {
                console.log(response.data);
                $scope.partners[partnerType] = response.data;
                if(partnerType == $scope.partnerType.DIRECT){
                    $scope.selectedPartner = response.data[0].id;
                    $scope.loadDealByPartnerID($scope.selectedPartner);
                }

            })
            .catch(function (err) {
                console.log(err);
                console.log("make sure apache server is started");
            });
    };

    $scope.loadDealByPartnerID = function (selectedPartnerID) {
        console.log(selectedPartnerID);

        $http.get("/api/v1/deal", { params: { hotel_id: $scope.hotelDetails.id, partner_id: selectedPartnerID } })
            .then(function (response) {

                var dealsDataResponse = response.data.result.deal;
                console.log(dealsDataResponse);
                console.log("response.data = ",response.data);

                // we may need to create data structure like hotel_id => partner_id => room_id => (deals data)
                // it will help in ng-repeat of rooms to show deals according to partner_id

                for (i = 0; i < dealsDataResponse.length; i++) {
                    if (!$scope.dealsData[$scope.hotelDetails.id])
                        $scope.dealsData[$scope.hotelDetails.id] = {};

                    if (!$scope.dealsData[$scope.hotelDetails.id][selectedPartnerID])
                        $scope.dealsData[$scope.hotelDetails.id][selectedPartnerID] = {};


                    $scope.dealsData[$scope.hotelDetails.id][selectedPartnerID][dealsDataResponse[i].room] = dealsDataResponse[i];
                }

                console.log("$scope.dealsData = ", $scope.dealsData);

            })
            .catch(function (err) {
                console.log(err);
            });



    };


    $scope.updateRoomDeal = function () {

    }

    $scope.updateDeal = function (deal, roomID) {

        console.log("dealID = ", deal);
        var dealdata = JSON.parse(JSON.stringify(deal));
        var dealID = dealdata.id;
        delete dealdata.id;
        delete dealdata.price_calendar;
        delete dealdata.website;
        dealdata.room_id = roomID;
        delete dealdata.room;
        console.log("dealdata = ",dealdata);
        var request;
        var toastMsg;
        if (dealID) {
            request = $http.put("/api/v1/deal/" + dealID, dealdata);
            toastMsg = "Deal Updated!!";
        } else {

            dealdata.partner_id = $scope.selectedPartner;

            request = $http.post("/api/v1/deal", dealdata);
            toastMsg = "Deal Created!!";
        }
        request
            .then(function (response) {
                console.log(response);
                toaster.pop('success', toastMsg);
            })
            .catch(function (err) {
                console.log(err);
            });
    };

});