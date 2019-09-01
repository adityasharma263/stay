// add dependency module DYNAMICALLY
app.requires.push('checklist-model');
app.controller('bookingController', ["$scope", "$http", function ($scope, $http) {

    $scope.customerDetails = [{
        contact_no: "",
        email: "",
        guest_fist_name: "",
        guest_last_name: "",
        deal: []
    }];

    $scope.customerDetailsArrayIndex;

    // here we are creating a array of arraies of objects, 
    // yes bit complicated 
    // but it is usefull when user remove and customer from the customer array, 
    // especially when user remove from in between from the array
    $scope.customersSelectedRooms = [[]];


    $scope.cartDetails =
        [{
            "cart_deals": [
                {
                    "cart": 1,
                    "ci_date": "2019-08-30T10:50:49.783203+00:00",
                    "co_date": "2019-08-30T10:50:49.783203+00:00",
                    "current_deal_amount": 300,
                    "id": 1,
                    "no_of_deals": 2,
                    "deal": {
                        "id": 1,
                        "partner_id": 1,
                        "price": 150,
                        "room": {
                            "hotel": {
                                "city": "delhi",
                                "id": 1,
                                "name": "leela"
                            },
                            "id": 1,
                            "image_url": "https://seoimgak.mmtcdn.com/blog/sites/default/files/images/hotels-in-mahabaleshwar-saj%20resort.jpg",
                            "max_no_of_guest": null,
                            "meal_plan": "Continental Plan",
                            "room_type": null
                        },
                        "sold_out": false,
                    },

                },
                {
                    "cart": 1,
                    "ci_date": "2019-08-30T10:51:20.309919+00:00",
                    "co_date": "2019-08-30T10:51:20.309919+00:00",
                    "current_deal_amount": 200,
                    "id": 2,
                    "no_of_deals": 1,
                    "deal": {

                        "id": 2,
                        "partner_id": 1,
                        "price": 200,
                        "room": {
                            "hotel": {
                                "city": "delhi",
                                "id": 1,
                                "name": "leela"
                            },
                            "id": 1,
                            "image_url": "https://seoimgak.mmtcdn.com/blog/sites/default/files/images/hotels-in-mahabaleshwar-saj%20resort.jpg",
                            "max_no_of_guest": null,
                            "meal_plan": "Continental Plan",
                            "room_type": null
                        },
                        "sold_out": false
                    },

                }
            ],
            "id": 1,
            "partner_id": 1,
            "total_booking_amount": 500,
            "total_no_of_deals": 2
        }];



    $scope.addMoreCustomer = function () {
        $scope.customerDetails.push({
            contact_no: "",
            email: "",
            guest_fist_name: "",
            guest_last_name: "",
            deal: []
        });

        if ($scope.customersSelectedRooms[customerDetailsArrayIndex] == undefined) {
            $scope.customersSelectedRooms[customerDetailsArrayIndex] = [];

        } else {
            $scope.customersSelectedRooms.push([]);
        }
        console.log("$scope.customersSelectedRooms = ", $scope.customersSelectedRooms);
    };

    $scope.rooomsAdded = function () {

        console.log("$scope.customersSelectedRooms = ", $scope.customersSelectedRooms);

    };

    $scope.addRoomForCustomers = function (customersIndex) {

        console.log("$scope.customersSelectedRooms = ", $scope.customersSelectedRooms);

        $scope.customerDetailsArrayIndex = customersIndex;

        console.log("customersIndex = ", customersIndex);






    };


    $scope.removeCustomer = function (customerIndex) {
        $scope.customerDetails.splice(customerIndex, 1);
        $scope.customersSelectedRooms.splice(customerIndex, 1);
        console.log("$scope.customersSelectedRooms = ", $scope.customersSelectedRooms);
    };






}]);