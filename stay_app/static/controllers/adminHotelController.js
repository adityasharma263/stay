app.requires.push('toaster');
app.controller('adminHotelController', function ($scope, $http, toaster) {
    $scope.hotel = {}; // main hotel model
    $scope.hotelImg = []; //for all images array
    $scope.images = {}; //object of image
    $scope.product = {};// object of product
    $scope.collectionProdcut = [];//array of products
    $scope.hotelsProduct = {};
    $scope.deals = {}; //for deals
    $scope.hotelDeals = []; // for all deals array
    $scope.room = {}; //for one room
    $scope.hotelRooms = []; // for all room array
    $scope.showHotelDetail = false;
    $scope.showRoomDetail = false;
    $scope.roomDetail = true;
    $scope.hotelDetail = true;
    $scope.updateRoomDetail = false;
    $scope.addRoomDetail = false;
    $scope.UpdateImages = {}; //image data for update
    $scope.hotelData = {}; // hotel data for update 
    $scope.amenitiesData = {}; // hotel amenities for update


    // show initial loading on the loading of the page
    $scope.showLoader = true;

    $scope.mealPlanEnum = {
        CP : "Continental Plan",
        MAP : "Modified American Plan",
        EP : "European Plan",
        AP : "American Plan"
    };

    $scope.bedTypeEnum = {

        Single : "Single",
        Double : "Double",
        Queen : "Queen",
        King : "King",

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

      $scope.roomDetailsArray =[
        {
            room_type : "",
            image_url : "",
            max_no_of_guest: "",
            meal_plan : "",
            facilities : {},
            

          }
      ];

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

    $scope.addHotelAndRoomsData = function(){

        $scope.hotel.rooms = $scope.roomDetailsArray;
        $scope.hotel.images = $scope.hotelImg;



        console.log("scope.hotel = ",$scope.hotel);
  
        $http.post("/api/v1/hotel", $scope.hotel)
        .then(function(response){

            toaster.pop('success', "Hotel Added Successfull!!");

        })
        .catch(function(err){
            console.log(err);
            toaster.pop('danger', "Failed to add hotel!");
        });
    };


    $scope.AddNumbers = function addNum1(add1) {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    };
    $scope.AddNumber1 = function(add2) {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    };
    $scope.AddNumber2 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }   
    $scope.AddNumber3 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber4 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    };
    $scope.AddNumber5 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber6 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber7 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber8 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber9 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber10 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber11 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber12 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber13 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber14 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    $scope.AddNumber15 = function() {
        Number($scope.base_price || 0);
        Number($scope.margin_price || 0);
        Number($scope.commission_in_percentage || 0);
        $scope.price = $scope.base_price + $scope.margin_price + $scope.commission_in_percentage;
    }
    
    // $scope.price = function(){
    //     return (($scope.base_price - 0) + ($scope.margin_price - 0) + ($scope.commission_in_percentage - 0));
    // };

    $scope.showCreate = function () {
        $scope.hotelDetail = true;
        $scope.showHotelDetail = false;
    }
    $scope.showUpdate = function () {
        $scope.showHotelDetail = true;
        $scope.hotelDetail = false;
        $scope.showRoomDetail = false;
    }

    $scope.editRoomsData = function (data) {
        $scope.rooms = data;
        $scope.facilities = data.facilities;
        $scope.member = data.member;
        $scope.roomDeals = data.deals;
        $scope.updateRoomDetail = true;
        $scope.showRoomDetail = false;

    }
    $scope.gotoHotelDetail = function () {
        $scope.updateRoomDetail = false;
        $scope.showRoomDetail = true;
        $scope.addRoomDetail = false;
    }
    $scope.editDealData = function (data) {
        $scope.deal = data;
    }
    $scope.editProductData = function (data) {
        $scope.product = data;
    }
    $scope.editHotel = function (data) {
        $scope.hotels = data;
        $scope.hotelAmenities = data.amenities;
        $scope.hotelCollection = data.collection;
        $scope.hotelImages = data.images;
        $scope.hotelRooms = data.rooms;
        // $scope.hotelProducts=data.collection.products;
        $scope.showRoomDetail = true;
        $scope.showHotelDetail = false;
        // $scope.Rooms=data;


    }

    $scope.editImg = function (data, index) {
        $scope.imageData = data;
        // $scope.imagedata=data.id;
        $scope.imgIndex = index;

    }
    $scope.updateImage = function () {

        $scope.hotelImages[$scope.imgIndex].image_url = $scope.imageData.image_url;
        $scope.imageData.hotel_id = $scope.hotels.id;
        sendPutCall('/api/v1/image/' + $scope.imageData.id, $scope.imageData);
        createToast("Image Updated!!!", "green");
    };

    $scope.updateHotel = function () {
        $scope.hotelData = $scope.hotels;

        delete $scope.hotelData.images;
        delete $scope.hotelData.rooms;
        delete $scope.hotelData.amenities;
        delete $scope.hotelData.collection.product;
        sendPutCall('/api/v1/hotel/' + $scope.hotelData.id, $scope.hotelData);
        createToast("Hotel Detail Updated!!!", "green");
    };

    $scope.updateAmenities = function () {
        $scope.hotelAmenities.hotel_id = $scope.hotels.id;
        sendPutCall('/api/v1/amenity/' + $scope.hotelAmenities.id, $scope.hotelAmenities);
        createToast("Hotel Amenities Updated!!!", "green");

    };

    $scope.updateCollection = function () {
        $scope.hotelCollection.hotel_id = $scope.hotels.id;
        delete $scope.hotelCollection.products;
        sendPutCall('/api/v1/hotel/collection/' + $scope.hotelCollection.id, $scope.hotelCollection);
        createToast("Hotel Collection Updated!!!", "green");

    };

    $scope.updateProduct = function () {

        $scope.product.hotel_collection_id = $scope.product.hotel_collection;
        delete $scope.product.hotel_collection;
        sendPutCall('/api/v1/hotel/collection/product/' + $scope.product.id, $scope.product);
        createToast("Product Updated!!!", "green");

    };

    $scope.updateRoom = function () {
        $scope.rooms.hotel_id = $scope.hotels.id;
        delete $scope.rooms.member;
        delete $scope.rooms.check_in;
        delete $scope.rooms.check_out;
        delete $scope.rooms.facilities;
        delete $scope.rooms.deals;
        delete $scope.rooms.hotel;
        sendPutCall('/api/v1/room/' + $scope.rooms.id, $scope.rooms);
        createToast("Room Updated!!!", "green");
    };

    $scope.updateFacilities = function () {
        $scope.facilities.room_id = $scope.rooms.id;
        delete $scope.facilities.room;
        sendPutCall('/api/v1/facility/' + $scope.facilities.id, $scope.facilities);
        createToast("Facilities Updated!!!", "green");
    };

    $scope.updateMembers = function () {
        $scope.member.room_id = $scope.rooms.id;
        delete $scope.member.room;
        sendPutCall('/api/v1/member/' + $scope.member.id, $scope.member);
        createToast("Members Updated!!!", "green");
    };

    $scope.updateDeal = function () {

        $scope.deal.room_id = $scope.rooms.id;
        delete $scope.deal.room;
        delete $scope.deal.website;

        console.log('$scope.deal', $scope.deal);
        sendPutCall('/api/v1/deal/' + $scope.deal.id, $scope.deal);
        createToast("Deal Updated!!!", "green");

    }

    $scope.deleteHotel = function (data) {
        sendDeleteCall('/api/v1/hotel/' + data.id);
        createToast("Hotel Deleted!!!", "green");
    }
    $scope.deleteImage = function (data) {
        if (data.id) {
            sendDeleteCall('/api/v1/image/' + data.id);
            createToast("Image Deleted!!!", "green");
        }
        else {
            createToast("'Try Again'!!!", "blue");
            setTimeout(function () { location.reload(); }, 1000);


        }
    }
    $scope.deleteProduct = function (data) {
        sendDeleteCall('/api/v1/hotel/collection/product/' + data.id);
        createToast("Product Deleted!!!", "green");
    }
    $scope.deleteRoom = function (data) {
        sendDeleteCall('/api/v1/room/' + data.id);
        createToast("Room Deleted!!!", "green");
    }
    $scope.deleteDeals = function (data) {
        sendDeleteCall('/api/v1/deal/' + data.id);
        createToast("Deal Deleted!!!", "green");
    }
    $scope.addRoom = function () {

        $scope.room.hotel_id = $scope.hotels.id;

        $scope.hotelDeals.push($scope.deals);
        $scope.room.deals = $scope.hotelDeals;
        // $scope.hotelRooms.push($scope.room);
        console.log("rooms array", $scope.room);
        sendPostCall('/api/v1/room', $scope.room)

        createToast("'Room Added!!'", "green");
        // $scope.deals.hotel_url="";
        $scope.hotelDeals = [];

    }
    $scope.addHotelImages = function () {
        $scope.hotelsImg.hotel_id = $scope.hotels.id;
        $scope.hotelImages.push($scope.hotelsImg); //to show added image
        sendPostCall('/api/v1/image', $scope.hotelsImg)
        $scope.hotelsImg = {};
        createToast("'Image Added!!'", "green");

    }
    $scope.addHotelDeal = function () {
        $scope.hotelsDeal.room_id = $scope.rooms.id;

        sendPostCall('/api/v1/deal', $scope.hotelsDeal)

        createToast("'Deal Added!!'", "green");

    }

    $scope.addHotelProduct = function () {
        $scope.hotelsProduct.hotel_collection_id = $scope.hotels.collection.id;
        sendPostCall('/api/v1/hotel/collection/product', $scope.hotelsProduct)
        createToast("'Product Added!!'", "green");

    }
    $scope.showAddRoom = function () {
        $scope.showRoomDetail = false;
        $scope.addRoomDetail = true;
    }


    $http({
        method: 'GET',
        url: '/api/v1/hotel'
    }).then(function successCallback(response) {
        // hotelData = response.data.result;
        $scope.hotelsData = response.data.result.hotel;
        // this callback will be called asynchronously
        // when the response is available
    }, function errorCallback(response) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
    })
    $http({
        method: 'GET',
        url: '/api/v1/website'
    }).then(function successCallback(response) {
        // hotelData = response.data.result;
        $scope.websites = response.data.result.website;
        // this callback will be called asynchronously
        // when the response is available
    }, function errorCallback(response) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
    })
    $http({
        method: 'GET',
        url: '/api/v1/hotel/collection'
    }).then(function successCallback(response) {
        // hotelData = response.data.result;
        $scope.collections = response.data.result.collection;
        // this callback will be called asynchronously
        // when the response is available
    }, function errorCallback(response) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
    });

    var sendPostHotel = function (url, data) {

        $scope.hotel.city = $scope.hotel.city.toLowerCase();
        $scope.hotel.name = $scope.hotel.name.toLowerCase();
        console.log(data);

        $http({
            method: 'POST',
            url: url,
            data: data
        }).then(function (res) {
            console.log(res);
            $scope.j = res.data.result.hotel.id;
            console.log("j", $scope.j);


            createToast("'hotel successfully created!!!'", "green");

        },
            // failed callback
            function (req) {
                createToast("'Something went wrong!!!'", "red");

                // setTimeout(function(){ location.reload(); }, 1000);

            });

    };
    var sendDeleteCall = function (url) {

        $http({
            method: 'DELETE',
            url: url,
        }).then(function (res) {
            setTimeout(function () { location.reload(); }, 1000);
            // createToast("'hotel successfully created!!!'","green");

        },
            // failed callback
            function (req) {
                createToast("'Something went wrong!!!'", "red");
            })

    }
    var sendPostCall = function (url, data) {
        console.log(data);

        $http({
            method: 'POST',
            url: url,
            data: data
        }).then(function (res) {
            console.log(res);

            // createToast("'hotel successfully created!!!'","green");

        },
            // failed callback
            function (req) {
                createToast("'Something went wrong!!!'", "red");
            })

    }
    var sendPutCall = function (url, data) {
        console.log(data);

        $http({
            method: 'PUT',
            url: url,
            data: data
        }).then(function (res) {
            console.log(res);

            // createToast("'hotel successfully created!!!'","green");

        },
            // failed callback
            function (req) {
                createToast("'Something went wrong!!!'", "red");
            })

    }

    $scope.removeInput = function (index) {
        $scope.hotel.images.splice(index, 1);
    }

    $scope.openRoom = function () {

        $(".js-pop-room").css("top", "50%");

    };
    onload = function () {
        window.scrollBy(0, -900);

    }
    $scope.createRoom = function () {

        $scope.room.hotel_id = $scope.j;

        $scope.hotelDeals.push($scope.deals);
        $scope.room.deals = $scope.hotelDeals;
        // $scope.hotelRooms.push($scope.room);
        console.log("rooms array", $scope.room);
        // sendPostCall('/api/v1/room', $scope.room)

        console.log("");
        createToast("'Room Added!!'", "green");
        // $scope.deals.hotel_url="";
        $scope.hotelDeals = [];

    }


    $scope.addImg = function () {
        $scope.hotelImg.push($scope.images);
        $scope.images = {};
        createToast("'Image Added!!'", "green");

    };
    $scope.addProduct = function () {
        $scope.collectionProdcut.push($scope.product);
        createToast("'product Added!!'", "green");

    }
    $scope.addPrice = function () {
        $scope.hotelDeals.push($scope.deals);
        $scope.deals = {};
        createToast("'price Added!!'", "green");

    };
    var createToast = function (msg, color) {
        var x = document.getElementById("snackbar");
        x.innerHTML = msg;
        x.style.backgroundColor = color;
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
    };
    $scope.createHotel = function () {
        // e.preventDefault()
        $scope.hotelDetail = false;
        $scope.roomDetail = true;

        // $scope.collectionProdcut.push($scope.product);

        $scope.hotelImg.push($scope.images);
        // $scope.hotel.collection.products=$scope.collectionProdcut;
        $scope.hotel.images = $scope.hotelImg;
        console.log("$scope.hotel", $scope.hotel);

        // sendPostHotel('/api/v1/hotel', $scope.hotel);

    };
    
    $scope.showLoader = false;
});