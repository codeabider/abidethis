shopApp.factory("productData",['$http',function($http){

  return{
    get:function(){
      return $http.get("assets/json/products.json").then(function(response){
        return response;
      })
      }
    
  }
}]);