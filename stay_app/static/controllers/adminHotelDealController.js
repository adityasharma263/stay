// add dependency module DYNAMICALLY
app.requires.push('ui.bootstrap');
app.requires.push('toaster');
app.controller("adminHotelDealController", function ($scope, $http, toaster, $q) {

    $scope.showLoader = true;

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

    $scope.roomDetailsArray =[
        {
            room_type : "",
            image_url : "",
            max_no_of_guest: "",
            meal_plan : "",
            facilities : {}

          }
      ];

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

    // $scope.hotelDetails = hotelDetails.hotel[0];


    $scope.onHotelSelect = function (item) {
        $scope.showLoader = true;
        console.log(item);
        $http.get(API_BASE_URL + "/api/v1/hotel", { params: { slug: item.slug } })
            .then(function (response) {
                console.log(response.data.result);
                $scope.hotelDetails = response.data.result.hotel;
                $scope.showLoader = false;
            })
            .catch(function (err) {
                console.log(err);
                toaster.pop('danger', "Failed to fetch hotel!");
                $scope.showLoader = false;
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

                toaster.pop('danger', "Failed to Update!");
            });
    };


    $scope.updateRoom = function (roomDeatils) {

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
                toaster.pop("success", "Room Updated!!");
            }).catch(function (err) {
                toaster.pop("error", "Room Failed to Update!!");

                console.log(err);
            });


    };


    $scope.deleteRoom = function(roomDetails) {

        $scope.showLoader = true;
      
        $http.delete("/api/v1/room/" + roomDetails.id)
        .then(function(response) {
            console.log(response.data);
            toaster.pop('success', "Room Deleted!!");
            $scope.showLoader = false;
        })
        .catch(function(err) {
            console.log(err);
            toaster.pop('danger', "Failed to delete room!!");
            $scope.showLoader = false;
        })
        ;
        
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

                toaster.pop("success", "Hotel Updated!");

            }).catch(function (err) {
                console.log(err);
                toaster.pop("success", "Failed to Update!");
            });
    };


    $scope.deleteHotel = function(hotelDetails) {

      if(hotelDetails && hotelDetails.id)
        $http.delete("/api/v1/hotel/"+hotelDetails.id)
        .then(function(response) {

            console.log(response.data);
            toaster.pop("success", "Hotel Deleted!");

            $scope.hotelDetails = null;


        })
        .catch(function(err) {
            console.log(err);
        })
        ;
        else{
            console.log(hotelDetails);
            toaster.pop("error", "Hotel not find!");
        }
            
        
    };


    $scope.updateAmenity = function (amenityData) {

        console.log("amenityData = ", amenityData);

        var amenitiesData = JSON.parse(JSON.stringify(amenityData));

        var request;

        if(amenitiesData.id){
            delete amenitiesData.id;

            request = $http.put("/api/v1/amenity/" + amenityData.id, amenitiesData);

        }else{

            amenitiesData.hotel_id = $scope.hotelDetails.id;
            request = $http.post("/api/v1/amenity", amenitiesData);
        }
        request.then(function (response) {
                console.log(response.data);
                toaster.pop("success", "Amenity Updated!");
            }).catch(function (err) {
                toaster.pop("error", "Failed to Update!");

                console.log(err);
            });


    };




    $scope.updateFacility = function (facilityData, roomDeatils) {

        console.log("facilityData = ", facilityData);

        var facilitiesData = JSON.parse(JSON.stringify(facilityData));

        var request;

        if(facilitiesData.id){
            delete facilitiesData.id;
            request = $http.put("/api/v1/facility/" + facilityData.id, facilitiesData);
            
        }else{

            facilitiesData.room_id = roomDeatils.id;
            request = $http.post("/api/v1/facility", facilitiesData);

        }



        


        request
            .then(function (response) {
                console.log(response.data);

                toaster.pop("success", "Facility updated!");

            }).catch(function (err) {
                toaster.pop("error", "Facility failed to update!");

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
                toaster.pop("success", "Image Updated");
            }).catch(function (err) {
                console.log(err);
                toaster.pop("error", "Failed to Update!");
            });
    };


    $scope.deleteImage = function(imageData, index) {

        $http.delete("/api/v1/image/" + imageData.id)
            .then(function (response) {
                console.log(response.data);
                toaster.pop("success", "Image Deleted");
                $scope.hotelDetails.images.splice(index, 1);
            }).catch(function (err) {
                console.log(err);
                toaster.pop("error", "Failed to Delete!");
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

    $scope.addMoreRoom = function(){
        $scope.roomDetailsArray.push(
            {
                room_type : "",
                image_url : "",
                max_no_of_guest: "",
                meal_plan : "",
                facilities : {},
              }
        );
    };



    $scope.addNewRoomsToHotel = function() {
    

        var roomDetails = JSON.parse(JSON.stringify($scope.roomDetailsArray));

        var roomRequestList = [];


        for (let i = 0; i < roomDetails.length; i++) {
            const singleRoomData = roomDetails[i];

            singleRoomData.hotel_id = $scope.hotelDetails.id;
            singleRoomData.deals = [];

            roomRequestList.push($http.post("/api/v1/room", singleRoomData));
            
        }

        $q.all(roomRequestList)
        .then(function(response) {

            console.log(response);
            toaster.pop('success', "Room(s) Added!!");
        })
        .catch(function(err) {
            console.log(err);
            toaster.pop('danger', "Failed To Add!!");
        })

        ;





    };


    $scope.addImg = function() {


        var imgData = {

            image_url : $scope.hotelNewImage,
            hotel_id  : $scope.hotelDetails.id

        };

        $http.post("/api/v1/image", imgData)
        .then(function(response) {
            
            toaster.pop("success", "Image Added");
            console.log(response.data);

            $scope.hotelDetails.images.push(response.data.result.image);

        })
        .catch(function(err) {
            console.log(err);

            toaster.pop("error", "Failed to add Image!");
        });

        
    };



    $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
        $scope.directDealDateRange = "";
        console.log("called!!");
    });


    $scope.showLoader = false;
});