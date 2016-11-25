<div class="slider">
  <!-- Container for Carousel Image and Contents -->
  <div class="sliderWrapper">
  <div>
    <div class="slide" ng-repeat="image in images" ng-show="image.visible">
      <img class="carouselImg" ng-src="assets/images/{{image.src}}" />
      <!-- Carousel Image Content -->
      <div class="carImgContents">
        <div class="priceTag"><p>{{image.price}}</p></div>
        <div  class="carImgContentsHeading"><h2>{{image.product}}</h2></div>
        <p class="infoPara">Nunc non fermentum nunc. Sed ut ante eget leo tempor consequat sit amet eu orci. Donec dignissim dolor eget..</p>
        <div class="actionButtons">
            <a href="#"><div class="actionButton1"><div class="actionButtonsImg1"></div></div></a>
            <a href="#"><div class="actionButton2"><div class="actionButtonsImg2"></div></div></a>
            <a href="#"><div class="actionButton3"><div class="actionButtonsImg3"></div></div></a>
           <a href="#"> <div class="actionButton4"><div class="actionButtonsImg4"></div></div></a>
            <!-- Clears Float -->
            <span class="clear"></span>
        </div>
      </div>
      <!-- Carousel Image Content Ends-->
      </div> 
  </div>
  <!-- Container for Carousel Image and Contents Ends-->
  <div class="bottom-car">
    <div class="carList">
      <!-- Bottom list begins -->
      <ul class="bottom-list-contents">  
        <li ng-click="traverse($index); select($index)" ng-repeat="elem in images">
            <a href="" ng-click="select($index)">
              <div class="activeTop">
                <div class="activeTopC1"><div class="activeTopC2" ng-class="{active: $index===selectedIndex}"></div>
                </div>
              </div>
              <div class="tabDesc" ng-class="{active: $index===selectedIndex}">
                <div class="tabDescHeading"><h5>{{elem.name}}</h5></div>
                <p>{{elem.desc}}</p>
              </div>
            </a>      
        </li>
      </ul>
      <!-- Clears Float -->
      <span class="clear"></span>
    <!-- Bottom list ends -->
    </div>
  </div>
  </div>
</div>