@FilterCtrl = ($scope, $window, $http) ->
  $scope.schools = $window.filter_ctrl.schools
  $scope.loadSchools = ->
    $http.get("/schools.json?area=#{$scope.area}").success((data) ->
      $scope.schools = data
    )
