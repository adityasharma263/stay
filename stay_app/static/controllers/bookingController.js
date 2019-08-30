app.controller('bookingController', ["$scope", "$http", function ($scope, $http) {

    $scope.firstName = {};
    $scope.lastName = {};
    $scope.phoneNumber = {};
    $scope.address = {};
    $scope.emailAddress = {};

    $scope.customerDetails = [{
        contact_no: "",
        email: "",
        guest_fist_name: "",
        guest_last_name: ""
    }];

    $scope.submitBooking = function () {
        window.open('/hotel/booking/payment', '_self');
    };

    $scope.addMoreCustomer = function () {
        $scope.customerDetails.push({
            contact_no: "",
            email: "",
            guest_fist_name: "",
            guest_last_name: ""
        });
    };








}]);