/*Home Controller Begins*/
shopApp.controller("homeController",function($scope, $rootScope, productData, itemService){
  var cartItemsObj = JSON.parse(sessionStorage.getItem("cartItems"));
  var starItemsObj = JSON.parse(sessionStorage.getItem("starItems"));

  $rootScope.selectedIndex = 0;

  $rootScope.selected= function(i){                           /*selecting index for active anchor*/
    $rootScope.selectedIndex=i;
  };

  productData.get().then(function(response){
    $scope.productList=response.data.data;                    /*JSON is fetched from factory*/
    $scope.a=$scope.productList.length;
  });

  $scope.limit=3;                                             /*sets limit for seller and bestSeller*/
  $scope.bestLimit=3;

  /*functions being called onClick of onSale,mustHave,specialOffer*/
  $scope.onSale=function(){                                
    $scope.onsale="true";
    $scope.musthave="false";
    $scope.specialoffer="false";
  }

  $scope.mustHave=function(){
    $scope.onsale="false";
    $scope.musthave="true";
    $scope.specialoffer="false";
  }

  $scope.specialOffer=function(){
    $scope.onsale="false";
    $scope.musthave="false";
    $scope.specialoffer="true";
  }

  /*Storing cart Items in session Storage through Service*/
  if(cartItemsObj){
      for(j=0;j<cartItemsObj.length;j++){
        var the_string = "cartString"+cartItemsObj[j]; /*showing items in cart after page refresh*/
        $scope[the_string]="true";
      }
  }

  $scope.addToCart=function(){                            /*function called onClick of cartIcon*/                                               
    $scope.z=event.currentTarget.id;     
    $rootScope.cartcount=itemService.cartFunc($scope.z);

    if(cartItemsObj){
      for(j=0;j<cartItemsObj.length;j++){              /* retaining all the products from existing cart from session storage*/
        var the_string = "cartString"+cartItemsObj[j];
        $scope[the_string]="true";
      }
    } 
  }
  
  if(cartItemsObj){
    $rootScope.cartcount=cartItemsObj.length; /*retaining cart count after refresh*/
  }
  else{
    $rootScope.cartcount=0;
  }
  /*Cart Storage ends here*/

  /*Storing items in Wishlist or favourite without Service*/            
  if(starItemsObj){
    for(j=0;j<starItemsObj.length;j++){
      var star_string = "starString"+starItemsObj[j];  /*showing items in wishlist after refresh*/
      $scope[star_string]="true";
    }
  }
    
  /*function being called onClick of starIcon*/
  $scope.addToFav=function(event){                                                                   
    
    var prod_id=[];                                                       /*used for retaining items */ 
    var new_prod_id=[];                                                   /*remove duplicate items*/

    if(starItemsObj){     
      for(j=0;j<starItemsObj.length;j++){     /*getting products from session on click into initial array*/
        prod_id[j]=starItemsObj[j];
      }
    }

    prod_id.push(event.currentTarget.id);                                 /*current product add to session storage*/
    sessionStorage.starItems = JSON.stringify(prod_id);

    if(starItemsObj){
      for(j=0;j<starItemsObj.length;j++){     /*retaining all the products from existing wishlist from session storage*/
        var star_string = "starString"+starItemsObj[j];
        $scope[star_string]="true";
      }
    }
    
    for(i=1;i<starItemsObj.length;i++){
      if(starItemsObj[i-1]==event.currentTarget.id){ 
        prod_id.pop(i);
        for(k=0;k<prod_id.length;k++){                                  /*current and its duplicate item removed*/ 
          var tag=0;
          if(prod_id[k]==event.currentTarget.id){
            var star_string = "starString"+prod_id[k];
            $scope[star_string]="false";
            tag=1;
          }
          
          if(!tag){
            new_prod_id.push(prod_id[k])
          }
        }
      sessionStorage.starItems = JSON.stringify(new_prod_id);
    }
  }
  /*function being called onClick of starIcon ends*/
    
  $rootScope.favcount=starItemsObj.length; /*display wishlist count on click*/   
}

if(starItemsObj){
  $rootScope.favcount=starItemsObj.length;    /*retaining cart count after refresh*/
}
else{
  $rootScope.favcount=0;
}
/*Favourite items function ends here*/

});
/*Home Controller Ends*/

shopApp.controller("productController",function($scope,$rootScope,productData,itemService){
  var cartItemsObj = JSON.parse(sessionStorage.getItem("cartItems"));
  var starItemsObj = JSON.parse(sessionStorage.getItem("starItems"));
  
  $scope.Price="Price";                           /*controller for productPage goes here*/
  $scope.Categories="Categories";
  $scope.Brands="Brands";
  $rootScope.selectedIndex = 1;

  productData.get().then(function(response){
    $scope.productList=response.data.data;                                  /*fetches JSON from factory*/
    $scope.a=$scope.productList.length;
  });

  $scope.limit=9;                                                           /*sets the limit value of shown product in product page*/
  $scope.priceValue="$130 - $160";
  $scope.brandClass = function(event){                                      /*function being called on Brands*/
    $scope.Brands=event.currentTarget.id;
    $scope.brandValue=event.currentTarget.id;
  };
      
  $scope.categoriesClass= function(event){     
    $scope.Categories=event.currentTarget.id;                               /*function being called on Categories*/
    $scope.categorieValue=event.currentTarget.id;
  };
    
  $scope.priceClass= function(event){
    $scope.Price=event.currentTarget.id;                                    /*function being called on Price*/
    $scope.priceValue=event.currentTarget.id;
  };
  
  /*logic for grid view and list view goes here*/
  $scope.run=false;
  $scope.changeClass=function(myname){        
    $scope.listView=myname;
    if(myname=="newArrivalProducts"){
      $scope.run=false;
    }
    else{
      $scope.run=true;
    }
  }

  /*Storing cart Items in session Storage through Service*/

  if(cartItemsObj){
    for(j=0;j<cartItemsObj.length;j++){
      var the_string = "cartString"+cartItemsObj[j]; /*showing items in cart after refresh*/
      $scope[the_string]="true";
    }
  }

  $scope.addToCart=function()                                   /*function being called onClick of cartIcon*/
  {
    $scope.z=event.currentTarget.id;                            /*id of the selected cartItem*/
    $rootScope.cartcount=itemService.cartFunc($scope.z);        /*storing id in the functtion defined in Service*/

    if(cartItemsObj){
      for(j=0;j<cartItemsObj.length;j++){          /*retaining all the products from existing cart from session storage*/
        var the_string = "cartString"+cartItemsObj[j];
        $scope[the_string]="true";
      }
    }
  }
          
  if(cartItemsObj){
    $rootScope.cartcount=cartItemsObj.length; /*retaining cart count after refresh*/
  }
  else{
    $rootScope.cartcount=0;                                   /*set the cartcount value on first refresh*/
  }

  /*Cart ends here*/

  /*Storing itms in Wishlist or favourite without Service*/            
  if(starItemsObj){
    for(j=0;j<starItemsObj.length;j++){
      var star_string = "starString"+starItemsObj[j];  /*showing items in wishlist after refresh*/
      $scope[star_string]="true";
    }
  }
  
  $scope.addToFav=function(event){                                             /*function being called on starIcon*/
      
    var prod_id=[];                                                            /*used for retaining items*/ 
    var new_prod_id=[];                                                        /*remove duplicate items*/

    if(starItemsObj){     
      for(j=0;j<starItemsObj.length;j++){   /*getting products from session on click into initial array*/
        prod_id[j]=starItemsObj[j];
      }
    }

    prod_id.push(event.currentTarget.id);                                       /*current product add to session storage*/
    sessionStorage.starItems = JSON.stringify(prod_id);

    if(starItemsObj){
      for(j=0;j<starItemsObj.length;j++){    /*retaining all the products from existing wishlist from session storage*/
        var star_string = "starString"+starItemsObj[j];
        $scope[star_string]="true";
      }
    }
    
    for(i=1;i<starItemsObj.length;i++){
      if(starItemsObj[i-1]==event.currentTarget.id){ 
        prod_id.pop(i);
        for(k=0;k<prod_id.length;k++){                                          /*current and its duplicate item removed*/ 
          var tag=0;
          if(prod_id[k]==event.currentTarget.id){
            var star_string ="starString"+prod_id[k];
            $scope[star_string]="false";
            tag=1;
          }
          if(!tag){
            new_prod_id.push(prod_id[k])
          }
        }
            sessionStorage.starItems = JSON.stringify(new_prod_id);
      }
    }
    
    $rootScope.favcount=starItemsObj.length; /*display wishlist count on click*/
}

if(starItemsObj){
  $rootScope.favcount=starItemsObj.length;    /*retaining cart count after refresh*/
}
else{
  $rootScope.favcount=0;
}

/*Favourite items function ends here*/

/*logic for sorting alphabetically goes here*/
$scope.toggle=function(xyz){
  if(xyz=="a-z"){
    $scope.abc="brand";
  }
  else 
    $scope.abc="-brand";
}; 

$scope.relPage = function(){                          /*function being called onClick of All PRODUCT*/
  window.location.reload();
}

});