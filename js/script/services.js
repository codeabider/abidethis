shopApp.service('itemService',function(){
   this.cartFunc=function(id){
        var prod_id=[];   // used for retaining items 

        if(JSON.parse(sessionStorage.getItem( 'cartItems'))){
          for(j=0;j<JSON.parse(sessionStorage.getItem( 'cartItems')).length;j++){ //getting products from session on click into initial array
          prod_id[j]=JSON.parse(sessionStorage.getItem( 'cartItems'))[j];
          }
          }

        prod_id.push(id);                           //current product add to session storage
        sessionStorage.cartItems = JSON.stringify(prod_id);
    
          for(i=1;i<JSON.parse(sessionStorage.getItem( 'cartItems')).length;i++)
          {
            if(JSON.parse(sessionStorage.getItem( 'cartItems'))[i-1]==id)   //last duplicat item removed
          { 
              prod_id.pop(i);
              sessionStorage.cartItems = JSON.stringify(prod_id);
              alert("Item already exists in cart");
          }
          }
              var a=JSON.parse(sessionStorage.getItem( 'cartItems')).length;
              return a; //display cart count on click
   }
});