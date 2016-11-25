<!-- Container for Product Page Begins -->
<div class="prodContainer">  
  <!--Container for Product Page Banner Begins-->
  <div class="productHeadImg">
    <!--Banner Image-->
  	<img src="assets/images/productHeadImg.png">

    <!-- Banner Price info and Product Description -->
    <div class="carImgContents carImgContentsProd">
      <div class="priceTag priceTagProd"><p>$145.49</p></div>
      <h2>Pink Shoes 2013 Collection</h2>
      <p class="infoPara infoParaProd">Nunc non fermentum nunc. Sed ut ante eget leo tempor consequat sit amet eu orci. Donec dignissim dolor eget..</p>
    </div>
  </div>
  <!--Container for Product Page Banner Ends-->

  <!-- Container for Filter Dropdowns Begins -->
  <div class="shopWrapper">
    <div class="shopByContainer">
      <div class="shopBy">Shop by</div>

      <!--Container for Price Button and DropDown Div -->
      <div class="pricecontainer">
          <div class="priceRange">{{Price}}
            <span class="arrowImg"></span>
          </div>
          <!--Price DropDown -->
          <div class="priceMenu">
            <div class="upArrowHide"></div>
            <div class="upArrow"></div>
            <ul class='dropdown'>
              <li ng-click="priceClass($event)" id="$130 - $139">$130 - $139</li>
              <li ng-click="priceClass($event)" id="$140 - $149">$140 - $149</li>
              <li ng-click="priceClass($event)" id="$150 - $159">$150 - $159</li>          
            </ul>
          </div>
      </div>

      <!--Container for Categories Button and DropDown Div -->  
      <div class="categorycontainer">
          <div class="categories">{{Categories}}
            <span class="arrowImg"></span>
          </div>
          <!--Categories DropDown -->
          <div class="categoryMenu">
            <div class="upArrowHide"></div>
            <div class="upArrow"></div>
            <ul class="dropdown">
              <li ng-repeat="ite in productList | unique:'categories'" id="{{ite.categories}}" ng-click="categoriesClass($event)">{{ite.categories}}</li>
            </ul>
          </div>
      </div>

      <!--Container for Brands Button and DropDown Div -->
      <div class="brandcontainer">
          <div class="brands">{{Brands}}
            <span class="arrowImg"></span>
          </div>
          <!--Brands DropDown -->
          <div class="brandMenu">
            <div class="upArrowHide"></div>
            <div class="upArrow"></div>
            <ul class="dropdown">
              <li ng-repeat="item in productList | unique:'brand'" id="{{item.brand}}" ng-click="brandClass($event)">{{item.brand}}</li>
            </ul>
          </div>
      </div>
    </div>
  </div>
  <!-- Container for Filter Dropdowns Ends -->

  <!-- Container for BreadCrumbs and View As Buttons Begins -->
  <div class="productWrapper">
    <!--Container for BreadCrumbs -->
    <div class="breadCrumbs">
      <a href="#products" ng-click="relPage()"><span class="procuctHead">All Products</span> </a>
      <p class="allProdHome"><a href="#home">Home</a></p>
      <p class="arrowRight">></p>
      <p ng-init="flagx=true" ng-show="flagx" class="allProd" ng-click="limit=a; flagx=!flagx">All Products</p>
      <p ng-show="!flagx" class="allProd" ng-click="limit=9; flagx=!flagx">All Products</p>
    </div>

    <!--Container for Sorting and View As Buttons -->
    <div class="viewSort">
      <div class="alphaSort">
        <div class="sortByName">
          <span>Sort Alphabetically</span>
          <span class="arrowImgNew"></span>
        </div>
        <div class="alphaMenu">
          <div class="upArrowHide"></div>
          <div class="upArrow"></div>
          <ul class="dropdown">
            <li ng-click="toggle('a-z');">A-Z</li>
            <li ng-click="toggle('z-a');">Z-A</li>
          </ul>
        </div>
      </div>

      <!--Container for Grid/ List View Buttons -->
      <div class="prodButton">
        <button class="gridButton" ng-click="changeClass('newArrivalProducts')"></button>
        <button class="listButton" ng-click="changeClass('listView')"></button>
      </div>

      <div class="prodButton">
        <p class="viewAs">View as</p>
      </div>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
  </div>
  <!-- Container for BreadCrumbs and View As Buttons Ends -->

  <!--Warning Paragraph when there are no items to show -->
  <p class="noProdWarning" ng-show=!prod.length>No Products Found!!</p> 

  <!-- Container for rest of Product page Begins -->
  <div class="allProductScroll"> 
    <div class="newArrivalProducts {{listView}}" ng-repeat="x in prod = (productList | filter:x:x.brand=brandValue | filter:x:x.categories=categorieValue | price:priceValue | limitTo:limit | orderBy:abc)">
      <div class="newArrivalChild">
        <!-- on sale badge -->
        <div class="onSaleTag" ng-show={{x.onsale}}>ON SALE!</div>
        <!-- out of stock badge -->
        <div class="stockTag" ng-hide={{x.avail}}>OUT OF STOCK!</div>
        <div class="sandlePrice">{{x.price | currency}}</div>
        <img src="{{x.img}}" alt="Product Image" title="{{x.categories}}"/>
        <div class="brandDesc" ng-show="run">{{x.desc}}</div>
        <div class="clear"></div>

        <div class="myBrand">
          <span class="brandName">{{x.brand}}</span>
          <div class="divHover">
            <button class="favCartSelected" id={{x.id}}  ng-click="addToCart($event)" ng-show=cartString{{x.id}} ng-disabled="!{{x.avail}}"></button>
            <button class="favCart" id={{x.id}}  ng-click="addToCart($event)" ng-hide=cartString{{x.id}} ng-disabled="!{{x.avail}}"></button>
            <button class="favShare"></button>
            <button class="favStarchecked" id={{x.id}}  ng-click="addToFav($event)" ng-show=starString{{x.id}}></button>
            <button class="favStar" id={{x.id}}  ng-click="addToFav($event)" ng-hide=starString{{x.id}}></button>
            <button class="favVisit"></button>
            <div class="clear"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Container for rest of Product page Ends -->
</div>
<!-- Container for Product Page Ends -->