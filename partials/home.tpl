<!--Main Container for Home Page Begins-->
<div class="bodyContainer">
	<!-- Carousel Begins -->
	<div ng-controller="sliderCtrl">
		<slider images="images"></slider>
	</div>
	<!-- Carousel Ends -->

	<!-- Specials Container Begins -->
	<div class="specials">
		<div class="specialsWrapper">
			<div class="onSale"><div class="onSaleText" ng-click="onSale()">{{onSale}}ON SALE</div></div>
			<div class="specialOffer"><div class="onSaleText" ng-click="specialOffer()">SPECIAL OFFERS</div></div>
			<div class="mustHave"><div class="onSaleText" ng-click="mustHave()">MUST HAVE</div></div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- Specials Container Ends -->

	<!-- New Arrivals Begins -->
	<div class="newArrival">
		<div class="newArrivalHead">
			<span>New arrivals on FooseShoes</span>
			<button ng-show="flag1" ng-click="limit=a; flag1=!flag1" ng-init="flag1=true">Show All</button>
			<button ng-show="!flag1" ng-click="limit=3; flag1=!flag1">Hide</button>
			<div class="clear"></div>
		</div>

		<!-- Div for Items Begins -->
		<div class="newArrivalScroll" ng-class="{'newArrivalScroll':flag1, 'newArrivalScrollOff': !flag1}"> 
			<div class="newArrivalProducts" ng-repeat="x in prodX = (productList | filter: x : x.newarrivals='true' | filter: x : x.onsale=onsale | filter: x : x.specialoffer=specialoffer | filter: x : x.musthave=musthave | limitTo:limit)" >
				<div class="newArrivalChild">
					<!-- on sale badge -->
					<div class="onSaleTag" ng-show={{x.onsale}}>ON SALE!</div>
					<!-- out of stock badge -->
					<div class="stockTag" ng-hide={{x.avail}}>OUT OF STOCK!</div>
					<div class="sandlePrice">{{x.price | currency}}</div>
					<img src="{{x.img}}" alt="Product Image" title="{{x.categories}}" />

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
		<!-- Div for Items Ends -->
	</div>
	<!-- New Arrivals Ends -->
		
	<!-- Best Sellers Container Begins -->
	<div class="bestSeller">
		<div class="bestSellerHead">
			<span>Best sellers of the month</span>
			<button ng-show="flag2" ng-click="bestLimit=a; flag2=!flag2" ng-init="flag2=true">Show All</button>
			<button ng-show="!flag2" ng-click="bestLimit=3; flag2=!flag2">Hide</button>
			<div class="clear"></div>
		</div>

		<!-- Div for Items Begins -->
		<div class="bestSellerScroll" ng-class="{'bestSellerScroll':flag2, 'bestSellerScrollOff': !flag2}"> 
			<div class="bestSellerProducts" ng-repeat="y in prodY = (productList | filter: y : y.bestseller='true' | filter: y : y.onsale=onsale | filter: y : y.specialoffer=specialoffer | filter: y : y.musthave=musthave | limitTo:bestLimit)" >
				<div class="bestSellerChild">
					<!-- on sale badge -->
					<div class="onSaleTag" ng-show={{y.onsale}}>ON SALE!</div>
					<!-- out of stock badge -->
					<div class="stockTag" ng-hide={{y.avail}}>OUT OF STOCK!</div>
					<div class="sandlePrice">{{y.price | currency}}</div>
					<img src="{{y.img}}" alt="Product Image" title="{{y.categories}}"/>

					<!-- Div For Brand Info and Action Buttons Begins -->
					<div class="myBrand">
						<span class="brandName">{{y.brand}}</span>
						<!--Action Buttons Appear on Hover-->
						<div class="divHover">
							<span class="favCartSelected" id={{y.id}}  ng-click="addToCart($event)" ng-show=cartString{{y.id}}></span>
							<span class="favCart" id={{y.id}}  ng-click="addToCart($event)" ng-hide=cartString{{y.id}}></span>
							<span class="favShare"></span>
							<span class="favStarchecked" id={{y.id}}  ng-click="addToFav($event)" ng-show=starString{{y.id}}></span>
							<span class="favStar" id={{y.id}}  ng-click="addToFav($event)" ng-hide=starString{{y.id}}></span>
							<span class="favVisit"></span>
							<div class="clear"></div>	
						</div>
					</div>
					<!-- Div For Brand Info and Action Buttons Ends -->
				</div>
			</div>
		</div>
		<!-- Div for Items Ends -->
	</div>
	<!-- Best Sellers Container Ends -->
</div>
<!--Main Container for Home Page Begins-->