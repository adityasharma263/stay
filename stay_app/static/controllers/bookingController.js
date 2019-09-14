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

    //  what is the use of this variable
    $scope.customerDetailsArrayIndex;

    // here we are creating a array of arraies of objects, 
    // yes bit complicated 
    // but it is usefull when user remove customer from the customer array, 
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
                        "price": 7000,
                        "room": {
                            "hotel": {
                                "city": "delhi",
                                "id": 1,
                                "name": "leela"
                            },
                            "id": 1,
                            "image_url": "https://www.theleela.com/new-delhi-hotel-images/rooms-and-suites/premiere-room.jpg",
                            "max_no_of_guest": null,
                            "meal_plan": "Continental Plan",
                            "room_type": null
                        },
                        "sold_out": false,
                    },

                },
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
                        "price": 7000,
                        "room": {
                            "hotel": {
                                "city": "delhi",
                                "id": 1,
                                "name": "lalee"
                            },
                            "id": 1,
                            "image_url": "https://seoimgak.mmtcdn.com/blog/sites/default/files/images/hotels-in-mahabaleshwar-saj%20resort.jpg",
                            "max_no_of_guest": null,
                            "meal_plan": "Continental Plan",
                            "room_type": null
                        },
                        "sold_out": false,
                    },

                }
            ],
            "id": 1,
            "partner_id": 1,
            "total_booking_amount": 500,
            "total_no_of_deals": 2
        }];


        $http.get("")


    $scope.addMoreCustomer = function () {
        $scope.customerDetails.push({
            contact_no: "",
            email: "",
            guest_fist_name: "",
            guest_last_name: "",
            deal: []
        });

        if ($scope.customersSelectedRooms[$scope.customerDetailsArrayIndex] == undefined) {
            $scope.customersSelectedRooms[$scope.customerDetailsArrayIndex] = [];

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


    $scope.bookingData = {

        "business_contact_no": null,
        "gst_no": null,
        "office_address": null,
        "business_email": null,
        "company_name": null,
        "contact_no": null,
        "deals": [
            {
                "base_booking_price": null,
                "base_price": null,
                "ci_date": null,
                "co_date": null,
                "commission_in_percentage": null,
                "contact_no": null,
                "current_deal_amount": null,
                "email": null,
                "final_price": null,
                "guest_fist_name": null,
                "guest_last_name": null,
                "margin_price": null,
                "partner_id": 2, //jis partner se kri h 
                "room_id": 1,
                "ts_exclusive": null
            }
        ],
        "partner_id": 1, //jis partner ne kri h jo login h partner
        "total_booking_amount": null
    };


    $scope.finalAmount;


    $scope.qunatityChange = function () {
        $scope.finalAmount = $scope.finalQunatity * $scope.cartDetails[0].cart_deals[0].deal.price;
    }




    $scope.processBook = function () {

        var finalBookingData = {};
        // var partner_id = $scope.cartDetails[0].partner_id;

        finalBookingData.partner_id = partner_id;
        finalBookingData.deals = [];
        finalBookingData.total_booking_amount = 0;


        console.log("$scope.customer = ", $scope.customerDetails);
        console.log("$scope.customersSelectedRooms = ", $scope.customersSelectedRooms);

        for (let i = 0; i < $scope.customerDetails.length; i++) {
            const customer = $scope.customerDetails[i];

            console.log(`customer ${i} = `, customer);

            if ($scope.customersSelectedRooms[i])
                for (let j = 0; j < $scope.customersSelectedRooms[i].length; j++) {
                    const bookingDeal = $scope.customersSelectedRooms[i][j];


                    console.log(`bookingDeal ${j} = `, bookingDeal);

                    finalBookingData.deals.push({
                        ci_date: Math.ceil(new Date(bookingDeal.ci_date).getTime()/1000),
                        co_date: Math.ceil(new Date(bookingDeal.co_date).getTime()/1000),
                        contact_no: customer.contact_no,
                        current_deal_amount: bookingDeal.deal.price,
                        deal_id: bookingDeal.deal.id,
                        email: customer.email,
                        guest_fist_name: customer.guest_fist_name,
                        guest_last_name: customer.guest_last_name
                    });

                    finalBookingData.total_booking_amount += (bookingDeal.customersSelectedRoomsQuantity * bookingDeal.deal.price);



                }
        }


        console.log(finalBookingData);
        $http.post("/hotel/booking", finalBookingData)
            .then(function (response) {
                console.log(response.data);

                $("#repsonse").html(response.data);


            })
            .catch(function (err) {
                console.log("err = ", err);
            });
    };


    $scope.log = function (logStatement) {

        console.log("logStatement = ", logStatement);

    };

    //  not using this fn delete it
    $scope.getTotalAmoutForCustomer = function (dealWithQuantity) {


        dealWithQuantity.reduce((total, nextValue) => {

        });

    };

    // TO DO:
    // Get Customer details from $scope.customer
    // get customer rooms details from $scope.customersSelectedRooms
    // get the value of customer and rooms from same index 


}]);