var app = angular.module('starter.controllers', [])

app.controller('AppCtrl', function($scope, $state) {

    $scope.linelabels = ["Jan", "Feb", "Mar", "Abr", "Mai", "Jun", "Jul"];
    $scope.linedata = [
        [5, 6, 20, 14, 35, 4, 3],
    ];
    $scope.linecolor = ['#388E3C'];

    $scope.pielabels = ["AACD", "Médicos sem Fronteiras", "Ajude Mariana", "Wikipedia"];
    $scope.piedata = [43, 30, 20, 7];
    $scope.piecolors = ['#388E3C', '#B8B42D', '#DD403A', '#E36414'];

    $scope.pieClick = function(event) {
        var label = event[0].label;
        $state.go("list", { "label": label });
    }

});

app.controller('ListCtrl', function($stateParams, $scope) {
    $scope.label = $stateParams.label;
});
