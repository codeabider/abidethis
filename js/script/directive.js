shopApp.directive("slider", function() {
  return {
    restrict: "AE",

    scope: {
      images: "="
    },

    templateUrl: "partials/carTemplate.tpl",

    link: function(scope, elem, attrs) {
      scope.currentIndex = 0;                                  /*Initially the index is at the first image*/

      scope.traverse = function(listIndex) {
        scope.currentIndex=listIndex;
      };

      scope.$watch("currentIndex", function() {
        scope.images.forEach(function(image) {
          image.visible = false;                                /*make every image invisible*/
        });

        scope.images[scope.currentIndex].visible = true;        /*make the current image visible*/
      });

      scope.selectedIndex = 0;
      scope.select= function(i) {
        scope.selectedIndex=i;
      };
    }
  };
});
shopApp.controller("sliderCtrl", function($scope, $rootScope) {

  $scope.images = [{
    src: "carouselBanner1.jpg",
    title: "banner1",
    product: "Pink Shoes 2013 Collection",
    price: "$145.99",
    name:"Pink Shoes",
    desc:"Now at $145,99"
  }, {
    src: "carouselBanner1.jpg",
    title: "banner2",
    product: "Anna Field 2013 Collection",
    price: "$149.99",
    name:"Anna Field",
    desc:"Limited Edition"
  }, {
    src: "carouselBanner1.jpg",
    title: "banner3",
    product: "Prada 2013 Collection",
    price: "$155.99",
    name:"Prada",
    desc:"Summer is coming"
  }, {
    src: "carouselBanner1.jpg",
    title: "banner4",
    product: "Casadei 2013 Collection",
    price: "$159.99",
    name:"Casadei",
    desc:"All Colors avaiable"
  }, {
    src: "carouselBanner1.jpg",
    title: "banner5",
    product: "Mellow Yellow 2013 Collection",
    price: "$165.99",
    name:"Mellow Yellow",
    desc:"Free delivery"
  }];
});