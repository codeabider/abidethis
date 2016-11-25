shopApp.filter('unique', function() {
    
  return function (arr,rg) {
    if(arr){
       var yarr=[] , flag;
      for(x = 0; x < arr.length; x++) {
          flag=0;
           for (y = 0; y < yarr.length; y++){
                if (arr[x][rg] == yarr[y][rg]) {
                flag = 1;
              }
            }
            if(!flag){
              yarr.push(arr[x]);
            }
           }
      return yarr;
  }
  };
});
shopApp.filter('price',function(){
  return function(input,name){
  
    if(name){
    var res=name.split("$");
    var i=parseInt(res[1].split(" - "));
    var j=parseInt(res[2]);
    var rng=[];
    angular.forEach(input, function(value){
        if(value.price<=j && value.price >= i){
          rng.push(value);
        }
      })
    return rng;
  }
}
});