// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.requires.push('toaster');
app.controller("adminHotelDealController", function ($scope, $http, toaster) {

    $scope.partnerType = {
        DIRECT: 1,
        SUPPLIER: 2,
        PARTNER: 3,
    };

    $scope.mealPlanEnum = {
        "CP": "Continental Plan",
        "MAP": "Modified American Plan",
        "EP": "European Plan",
        "AP": "American Plan"
    };

    mealPlanREverseEnum = {
        "Continental Plan": "CP",
        "Modified American Plan": "MAP",
        "European Plan": "EP",
        "American Plan": "AP"
    };

    $scope.bedTypeEnum = {

        Single: "Single",
        Double: "Double",
        Queen: "Queen",
        King: "King",

    };

    $scope.facilities = {
        "ac": null,
        "bathroom_cosmetics": null,
        "bathroom_nightie": null,
        "bathroom_towels": null,
        "bathroom_with_shower": false,
        "bed_type": null,
        "desk": null,
        "electric_kettle": null,
        "fan": null,
        "food_serve_at_room": null,
        "free_evening_snacks": null,
        "free_toiletries": null,
        "hairdryer": null,
        "heater": null,
        "ironing_facility": null,
        "jacuzzi": null,
        "morning_newspaper": null,
        "no_of_bed": null,
        "phone": null,
        "room_safe": null,
        "room_seating_area": null,
        "room_slipper": true,
        "tv": null,
        "view": null,
        "wardrobes_closet": null,
        "weighing_machine": null,
        "wifi": null
    };

    $scope.partners = {};
    $scope.dealsData = {};

    $scope.hotelDetail = true;

    $scope.searchHotelOnChange = function () {
        if ($scope.searchHotel) {
            console.log($scope.searchHotel);
            $http.post("/admin/hotel/search", { search: $scope.searchHotel })
                .then(function (respsonse) {
                    console.log("$scope.searchResult = ", respsonse);
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
        $http.get(API_BASE_URL + "/api/v1/hotel", { params: { slug: item.slug } })
            .then(function (response) {
                console.log(response.data.result);
                $scope.hotelDetails = response.data.result.hotel;
            })
            .catch(function (err) {
                console.log(err);
            });
    };

    $scope.listPartnerType = function (partnerType) {
        $scope.dealsData = {};

        var hotel_partner_url = `${partner_api_url}/partners_hotel.php?hotel_id=${$scope.hotelDetails.id}&type=${partnerType}`;

        $http.get(hotel_partner_url)
            .then(function (response) {
                console.log(response.data);
                $scope.partners[partnerType] = response.data;
                if (partnerType == $scope.partnerType.DIRECT) {
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
                console.log("response.data = ", response.data);

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
        console.log("dealdata = ", dealdata);
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


    $scope.updateRoom = function (hotelData) {

        console.log("roomDeatils = ", roomDeatils);

        var roomUpdatedData = JSON.parse(JSON.stringify(roomDeatils));

        delete roomUpdatedData.deals;
        delete roomUpdatedData.facilities;
        delete roomUpdatedData.hotel;
        delete roomUpdatedData.id;

        roomUpdatedData.meal_plan = mealPlanREverseEnum[roomUpdatedData.meal_plan];




        $http.put("/api/v1/room/" + roomDeatils.id, roomUpdatedData)
            .then(function (response) {
                console.log(response.data);
            }).catch(function (err) {
                console.log(err);
            })


    };


    $scope.updateHotel = function (hotelDetail) {

        console.log("hotelDetails= ", hotelDetail);


        var hotelData = JSON.parse(JSON.stringify(hotelDetail));

        delete hotelData.rooms;
        delete hotelData.amenities;
        delete hotelData.images;
        delete hotelData.rooms;
        delete hotelData.id;
        delete hotelData.hotel_collection;

        console.log("hotelData = ", hotelData);

        $http.put("/api/v1/hotel/" + hotelDetail.id, hotelData)
            .then(function (response) {
                console.log(response.data);
            }).catch(function (err) {
                console.log(err);
            });
    };


    $scope.updateAmenity = function (amenityData) {

        console.log("amenityData = ", amenityData);

        var amenitiesData = JSON.parse(JSON.stringify(amenityData));

        delete amenitiesData.id;


        $http.put("/api/v1/amenity/" + amenityData.id, amenitiesData)
            .then(function (response) {
                console.log(response.data);
            }).catch(function (err) {
                console.log(err);
            });


    };




    $scope.updateFacility = function (facilityData) {

        console.log("facilityData = ", facilityData);

        var facilitiesData = JSON.parse(JSON.stringify(facilityData));

        delete facilitiesData.id;


        $http.put("/api/v1/facility/" + facilityData.id, facilitiesData)
            .then(function (response) {
                console.log(response.data);
            }).catch(function (err) {
                console.log(err);
            });
    };


    $scope.updateImage = function (imageData) {

        console.log("facilityData = ", imageData);

        var imageObj = JSON.parse(JSON.stringify(imageData));

        delete imageObj.id;


        $http.put("/api/v1/image/" + imageData.id, imageObj)
            .then(function (response) {
                console.log(response.data);
            }).catch(function (err) {
                console.log(err);
            });
    };

    $scope.log = function(message) {
        console.log(message);
    };


    $scope.specificDateDealPicker = function(dateValue) {
      

        var dateRangeArray = dateValue.split(" - ");

        var startDate = dateRangeArray[0];
        var endDate = dateRangeArray[0];


        var startDateEpoch = Math.ceil(new Date().getTime(startDate)/1000);
        var endDateEpoch = Math.ceil(new Date().getTime(endDate)/1000);


        console.log({startDateEpoch,endDateEpoch});




        
        
    };


    $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
        $scope.directDealDateRange = "";
        console.log("called!!");
    });



});