// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.controller("adminHotelDealController", function ($scope, $http) {

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

    console.log("hotelDetails = ", hotelDetails.hotel[0]);

    $scope.hotelDetails = hotelDetails.hotel[0];


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

    $scope.listPartnerType = function (partnerType) {
        var partner_api_url = "http://localhost:8001/api/v1";
        var hotel_partner_url = `${partner_api_url}/partners_hotel.php?hotel_id=${$scope.hotelDetails.id}&type=${partnerType}`;

        $http.get(hotel_partner_url)
            .then(function (response) {
                console.log(response.data);
                $scope.partners[partnerType] = response.data;

            })
            .catch(function (err) {
                console.log(err);
                console.log("make sure all the ");
            });
    };

    $scope.loadDealByPartnerID = function (selectedPartnerID) {
        console.log(selectedPartnerID);

        $http.get("/api/v1/deal", { params: { hotel_id: $scope.hotelDetails.id, partner_id: selectedPartnerID } })
            .then(function (response) {
                console.log(response.data);

                $scope.dealsData[$scope.hotelDetails.id][selectedPartnerID] = response.data;

                // we may need to create data structure like hotel_id => partner_id => room_id => (deals data)
                // it will help in ng-repeat of rooms to show deals according to partner_id

                


            })
            .catch(function (err) {
                console.log(err);
            });



    }
});