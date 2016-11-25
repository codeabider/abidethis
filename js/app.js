var shopApp=angular.module("myapp",['ngRoute']);
shopApp.config(['$routeProvider',function($routeProvider){ /*logic for routing goes here*/
	$routeProvider.when('/home',{
		templateUrl:'partials/home.tpl',
		controller:'homeController'
	})
	.when('/products',{
		templateUrl:'partials/products.tpl',
		controller:'productController'
	})
	.otherwise({
		templateUrl:'partials/home.tpl',
		controller:'homeController'
	});
}]);

