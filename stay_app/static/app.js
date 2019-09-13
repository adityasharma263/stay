var app = angular.module('stay', ['angular.filter'])
    .config(['$interpolateProvider',"$locationProvider", function ($interpolateProvider, $locationProvider) {
        $interpolateProvider.startSymbol('[[');
        $interpolateProvider.endSymbol(']]');
        $locationProvider.html5Mode({
          enabled: true,
          requireBase: false
        });
    }])

    .controller('stayController', ["$scope", "$http", "$filter", "$location", function ($scope, $http, $filter, $location) {
        $scope.hotel = {};
        $scope.showSearchResult = false;
        $scope.resp = false;
        var searchKey = 'city';
        $scope.hotel.ci = new Date();
        $scope.hotel.co = new Date();
        $scope.hotel.co.setDate($scope.hotel.co.getDate() + 1);


        

        $scope.result = function (data, status) {
            $scope.hotel.search = data;
            searchKey = status;
            $scope.getHotel();

        }

        $scope.show = function () {
            if ($scope.showSearchResult == false) {
                $scope.showSearchResult = true;
            }
            else {
                $scope.showSearchResult = false;
            }
        }


        var jsonToQueryString = function (json) {
            return '?' +
                Object.keys(json).map(function (key) {
                    if (json[key]) {
                        return encodeURIComponent(key) + '=' +
                            encodeURIComponent(json[key]);
                    } else {
                        return '';
                    }
                }).join('&');
        }


        $scope.getHotel = function () {
            // console.log("$location.path",$location.path);
            $scope.location = document.location.href;
            $scope.hotel.ci = Date.parse($scope.hotel.ci) / 1000;
            $scope.hotel.co = Date.parse($scope.hotel.co) / 1000;
            if (searchKey == 0) {
                $scope.message = 'enter valid location ';
            }

            window.open($scope.location + "/list?" + searchKey + "=" + $scope.hotel.search + '&' + 'ci' + '=' + $scope.hotel.ci + '&' + 'co' + '=' + $scope.hotel.co, '_self');
        }

        $scope.search = function () {
            $scope.hotel.search = $scope.hotel.search.toLowerCase();
            $http({
                method: 'POST',
                url: api_url + '/api/v1/hotel/search',
                data: $scope.hotel

            }).then(function successCallback(response) {
                $scope.cities = response.data.result.cities;
                $scope.names = response.data.result.names;
                if ($scope.cities.length == 0 && $scope.names.length != 0) {
                    searchKey = 'name';
                }
                if ($scope.cities.length != 0 && $scope.names.length == 0) {
                    searchKey = 'city';
                }
                if ($scope.cities.length != 0 && $scope.names.length != 0) {
                    searchKey = 'city';
                }
            })

        }

        $http({
            method: 'GET',
            url: api_url + '/api/v1/hotel/b2b'
        }).then(function successCallback(response) {
            $scope.hotels = response.data.result.hotel;
            for (var j = 0; j < $scope.hotels.length; j++) {
                $scope.hotelid[$scope.hotels[j].id] = $scope.hotels[j];
            }
            // this callback will be called asynchronously
            // when the response is available
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        })


        //  }
    }])

    .controller('stayListController', ["$scope", "$window", "$http","$location", function ($scope, $window, $http, $location) {
        
        $scope.hotelid = {};
        $scope.room = {};
        $scope.id = [];
        $scope.hotel = {
            rating: null,
            star: null,
            price_start: null,
            price_end: null,
            page: 1
        };
        $scope.limit = 10;
        $scope.loadMoreLimit = 5;
        $scope.showSearchResult = false;
        $scope.result = false;
        $scope.deals = [];
        $scope.imagesData = {};
        $scope.min = 0;
        $scope.max = 200000;

//       get array for the particular num  used to show amenities dynamically
         $scope.getNumber = function(num) {
         return new Array(num);

        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];


        var urlParams = $location.search();
        console.log("urlParams ", urlParams);
        $scope.loadmoredeals = function () {
            $scope.loadMoreLimit = $scope.loadMoreLimit + 5;
        };

        $scope.hotelData = [];

        $scope.getHotelsData = function (cb) {

            if (!cb) $scope.hotel.page = 1;

            let searchURL = api_url + '/api/v1/hotel/search' + document.location.search


            Object.keys($scope.hotel).forEach(function (param) {
                if ($scope.hotel[param])
                    searchURL += `&${param}=${$scope.hotel[param]}`;
            });

            $http({
                method: 'GET',
                url: api_url + '/api/v1/hotel/list/b2b',
                params: urlParams
            }).then(function (res) {

                if (cb) {
                    cb(res);
                } else {
                    $scope.hotelData = res.data.result.hotel;
                    console.log($scope.hotelData);
                }
            })
        }

        $scope.loadMoreHotelsData = function () {
            $scope.hotel.page = $scope.hotel.page + 1;

            $scope.getHotelsData(function (res) {
                $scope.hotelData = $scope.hotelData.concat(res.data.result.hotel);
            });

        }

        $scope.getHotelsData();
        $scope.show = function () {
            if ($scope.showSearchResult == false) {
                $scope.showSearchResult = true;
            }
            else {
                $scope.showSearchResult = false;
            }
        }

        $scope.checkErr = function () {
            $scope.errMessage = '';
            $scope.curDate = new Date();

            var check_in = $scope.hotel.check_in;
            console.log("check in",check_in); 
            if ($scope.hotel.check_in == undefined) {
                $scope.hotel.check_in = check_in;
            }

            if (new Date($scope.hotel.check_in) > new Date($scope.hotel.check_out)) {
                $scope.errMessage = 'End Date should be greater than start date';
                return false;
            }
            if (new Date($scope.hotel.check_in) < $scope.curDate) {
                $scope.errMessage = 'Start date should not be before today.';
                return false;
            }

        }




        $scope.getHotels = function () {
            var pathname = window.location.pathname;
            var appId = pathname.split('/')[6];
            $scope.location = document.location.href;
            $scope.hotel.ci = Date.parse($scope.hotel.ci) / 1000;
            $scope.hotel.co = Date.parse($scope.hotel.co) / 1000;

            window.open($scope.location + "/list?" + searchKey + "=" + $scope.hotel.search + '&' + 'ci' + '=' + $scope.hotel.ci + '&' + 'co' + '=' + $scope.hotel.co, '_self');
        }



        $http({
            method: 'GET',
            url: api_url + '/api/v1/hotel/list/b2b'
        }).then(function successCallback(response) {
            $scope.hotels = response.data.result.hotel;
            for (var j = 0; j < $scope.hotels.length; j++) {
                $scope.hotelid[$scope.hotels[j].id] = $scope.hotels[j];
            }
            // this callback will be called asynchronously
            // when the response is available
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });


        $scope.addToCart = function(dealDetails) {
            
            console.log(dealDetails);

            $scope.noOfDeal = 1;

            console.log("urlParams.ci = ",urlParams.ci);
            console.log("urlParams.co = ",urlParams.co);

           var finalCartData =  {
                "ci_date": urlParams.ci,
                "co_date": urlParams.co,
                "deal_id": dealDetails.id,
                "no_of_deals": $scope.noOfDeal
            };


            $http.post("/api/v1/cart/deal", finalCartData)
            .then(function(response) {

                console.log(response.data);

            })
            .catch(function(err) {
                console.log(err);
            });
        };


        $scope.addOneToCart= function(){
            $scope.noOfDeal =  $scope.noOfDeal + 1; 

        };

        $scope.subOneToCart= function(){
            $scope.noOfDeal =  $scope.noOfDeal - 1;
        };







    }])

   .controller('hotelController', ["$scope", "$http", "$filter", function ($scope, $http, $filter) {
       $scope.roomData = {};
       $scope.room = {};
       $scope.id = [];

       $scope.hotel = {};
       $scope.hotels = {};

       $scope.hotelobj = {};
       $scope.deals = [];
       $scope.imagesData = {};
       $scope.similarhotels = [];
       $scope.limit = 10;
       $scope.roomPrice = {};
       $scope.deallimit = 1;


       var path = document.location.pathname;
       var key1 = path.split("/");
       if (key1[2] == 'hotel')
           var id = key1[3];
       else
           var id = key1[2];
       $http({
           method: 'GET',
           url: api_url + '/api/v1/hotel/b2b?name=' + name
       }).then(function successCallback(response) {
           $scope.hotel = response.data.result.hotel;
           getSimilarHotels();
       }, function errorCallback(response) {
           // called asynchronously if an error occurs
           // or server returns response with an error status.
       })


       var getSimilarHotels = function () {
           $http({
               method: 'GET',
               url: api_url + '/api/v1/hotel/b2b?city=' + $scope.hotel[0].city
           }).then(function successCallback(response) {

               for (var i = 0; i < response.data.result.hotel.length; i++) {
                   if (response.data.result.hotel[i].id == $scope.hotel[0].id) {
                       response.data.result.hotel.splice(1, i); //to remove current showing hotel data
                   }
                   else {
                       $scope.similarhotels.push(response.data.result.hotel[i])
                   }
               }

           }, function errorCallback(response) {
               // called asynchronously if an error occurs
               // or server returns response with an error status.
           })

       }

   }]);
