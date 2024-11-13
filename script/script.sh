#!/bin/bash

# Function to set Dark Mode
set_dark_mode() {
    export GTK_THEME=Adwaita:dark
    echo "Dark mode enabled."
}
#Add a theme switcher
#also make it do c poject
create_website(){
  PROJECT_NAME=$(zenity --entry --title="C++ Project Setup" --height=400 --width=400 --text="Enter your project name:")

    if [ -z "$PROJECT_NAME" ]; then
        zenity --error --text="Project name cannot be empty. Exiting."
        return 1
    fi

    mkdir "$PROJECT_NAME"
    cd "$PROJECT_NAME"
    mkdir css js scss images

    cat > index.html <<EOL
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-117525947-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-117525947-1');
</script>
  
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1,  shrink-to-fit=no">
  
  
  <!-- development version, includes helpful console warnings -->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  
  <title>Winter Scarves</title>

  <link rel="icon" type="image/png" href="images/favicon.png">

  <link rel="stylesheet" href="css/reset.css">


  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">


  <!--  Personal Font Awesome CDN link here  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/overlay.css">
  <link rel="stylesheet" type="text/css" media="(max-width: 576px)" href="css/small.css">


</head>

<!--<body onresize="resizeHandler()">-->
<body>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>


  <div class="content-wrapper">
    <header>

      <nav class="nav-default">
        <div class="nav-container " id="nav-container">
          <div class="row px-2 pt-2 align-content-center" id="nav-row-links">
            <div class="col-sm-3 pt-3 col-nav">
              <a href="#" id="hats">Hats</a>
            </div>
            <div class="col-sm-3 pt-3 col-nav">
              <a href="#" id="gloves">Gloves</a>
            </div>
            <div class="col-sm-3 pt-3 col-nav">
              <a href="#" id="scarves">Scarves</a>
            </div>
            <div class="col-sm-3 col-nav">
              <nav class="navbar navbar-dark cart-nav align-content-center justify-content-center">
                <button class="button-cart navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                  <figure>
                    <figcaption class="cart-button-qty" id="cart-button-qty"></figcaption>
                    <span class="fa fa-shopping-cart" id="cart-icon" onclick="buildCart();"></span></figure>
                
              </button>
              </nav>
            </div>
        
          </div>

          <div class="row px-2 pt-2 pb-2 " id="nav-row">
            <div class="col col-nav">
              <div class="pos-f-t">
                <div class="collapse" id="navbarToggleExternalContent">
                  <!-- <div class="cart-hidden p-4">-->
                  <div class="cart-hidden p-1">
                    <div class="cart-wrapper">
                      <div class="cart-content-wrapper">
                        <div class="d-flex flex-nowrap" id="cart-content-row">
                       <!--   <div class="cart-footer" >-->
                          </div>
                        </div>
                      </div>
                      <div class="cart-footer" id="cart-footer">
                        <div class="row justify-content-center align-items-center justify-content-between">
                          <div class="col col-lg-2 col-md-3 cart-items-qty">
                            <span class="cart-footer-items-label">Cart Items: </span>
                            <span class="cart-footer-items-qty" id="cart-footer-items-qty"></span>
                          </div>
                          <div class="col col-lg-2 col-md-3 checkOutButton" >
                            <button type="submit" value="submit" class="btn btn-primary btn-sm btn-block mt-2 cart-button " style="background-color: #3d7ece;" id="checkout-button" ><a href="checkOut.html" target="_blank" id="checkout-link">CHECK OUT</a></button>
                          </div>
                          <div class="col col-lg-2 col-md-3 cart-items-total">
                            <span class="cart-footer-total-label">Cart Total: </span>
                            <span class="cart-footer-total" id="cart-footer-total"></span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

            </div>
          </div>
      </nav>



      <div class="media pl-3 pt-2 ">
        <a href="#">
          <picture class="mr-3">
            <source media="(max-width: 576px)" srcset="images/logo-scarfcat-64w.png">
            <source media="(max-width: 770px)" srcset="images/logo-scarfcat-72w.png">
            <img class="logo-img" src="images/logo-scarfcat-80w.png" alt="dapper cat with scarf">
          </picture>
        </a>

        <div class="media-body">
          <p>Winter</p>
          <p>Wear</p>
          <p>Warehouse</p>
        </div>
      </div>
    </header>


    <div id="app-index">
    <main>
      <div class="content-container">
        <div class="row px-2 pt-2 pb-2 " id="content-row">
          <!--display tools-->
          <div class="tools-container  col-lg-3 col-md-4">
           <!-- <form class="pl-2" id="filter-items" name="filterForm" onsubmit="filterProducts()">-->
            <form class="pl-2" id="filter-items" name="filterForm" >
              <label for="inputState">Filter by:</label>
              <select id="inputState" class="form-control" name="dropDown">
                  <option selected>Choose...</option>
                  <option value="material">Material</option>
                  <option value="price">Price</option>
                </select>
              <button type="submit" value="submit" class="btn btn-primary btn-block mt-2" style="background-color: #3d7ece;" v-on:click.prevent="filterItems(this)">Sort</button>
            </form>
          </div>

          <!--display products-->
          <div class="item-container col-lg-9 col-md-8">
            <h2>Scarves</h2>
            <div class="d-flex flex-wrap p-2 justify-content-center" id="item-grid">
              
              <div v-for="scarf in scarves" class="item-wrapper" v-bind:id="itemWrapper(scarf)">
                <div class="item-unit" v-bind:id="itemNum(scarf)">
                  <h3>{{scarf.name}}</h3>
                    <img v-bind:src="srcI(scarf)" v-bind:alt="nameI(scarf)">
                    <p class="product-description">{{scarf.description}}</p>
                    <p class="product-price">{{scarf.price}}</p>
                </div>
                <div class="overlayContainer" v-bind:id="overlayContainer(scarf)">
                  <div class="purchaseOverlay" v-bind:id="overlayPurchase(scarf)">
                    <i class="fa fa-shopping-cart buyMeIcon" v-bind:id="nameI(scarf)" onclick="addItemToCart(this.id);"></i>
                  </div>
                </div>
              </div>
          
            </div>
          </div>
        </div>
      </div>
    </main>

    </div>


    <footer id="productsFooter">



      <!--  email registration form  -->

      <form name="getEmail" onsubmit="processSignUp();" id="getEmail">
        <div class="pt-2 form-row justify-content-center sign-up">
          <div class="col-sm-auto px-3">
            <label class="sr-only" for="inlineFormInputEmail">email</label>
            <input type="email" placeholder="jane@company.com" name="email" class="form-control mb-2 mr-sm-2" id="inlineFormInputEmail" onfocus="restorePlaceHolderText()">
          </div>
          <div class="col-sm-1">
            <button type="submit" class="btn btn-primary mb-2 " style="background-color: #3d7ece;">SIGN UP</button>
          </div>

        </div>
      </form>


    </footer>

    <!--   javascript files   -->

   <!-- <script src="js/script.js"></script>
    <script src="js/script-unsorted.js"></script>-->
    <script src="js/vue-component.js"></script>
    <script src="js/main-vue.js"></script>
    <script src="js/main.js"></script>
    <script src="js/cart.js"></script>
    <script src="js/signup.js"></script>

  </div>



</body>

</html>


EOL
cd css
cat > main.css << EOL
* {
  box-sizing: border-box;
}

body {
  font-size: 100%;
  font-family: Montserrat, "Open Sans", Helvetica, Arial, sans-serif;
}

p {
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-weight: lighter;
  color: #2d2d2d;
}

/* TODO: size images manually so this is not necessary */

img {
  max-height: 20rem;
}

/***************** NAV *****************/

nav a:hover {
  text-decoration: underline;
  color: white;
}

nav a {
  color: white;
  letter-spacing: 1px;
}

.nav-container {
  color: white;
  background-color: #3d7ece;
  width: auto;
}

#nav-row, #nav-row-links {
  text-align: center;
}

#cart {
  height: 1rem;
}

/*#scarves {
  color: #ffd05a;
}*/

.button-cart {
  border: none;
  background: #3d7ece;
}

#checkout-button a:hover {
  text-decoration: none;
}

#cart-icon {
}

.cart-button-qty {
  color:linen;
}

.button-cart:hover {
  cursor: pointer;
}

.cart-hidden {
  border-radius: 4px;
  background-color: white;
}

.cart-wrapper {
  color: black;
  align-content: center;
}

.checkOutButton:hover {
  text-decoration:none;
}

.move-left,
.move-right {
  /*color: black;*/
  cursor: pointer;
  width: 40px;
  font-size: 30px;
  margin: auto;
}

.move-left {
  /*color:gray;*/ 
  color:black;
}
/*

.move-left:hover,
.move-right:hover {
  color: black;
}
*/


.cart-items-wrapper {
/* margin:auto;*/
  margin:0 5px 0 5px;
 /* width:94%;*/
  overflow:hidden;
  align-content:center;
  justify-content: space-between;
}

#cart-content-row {
 width:95%;
  margin:auto;
  justify-content: space-between;
}

.cart-item {
 margin:auto
  width:100px;
}

/*.cart-item:nth-last-child(n+2) {
  border-right: black;
  border-right-style:solid;
  border-right-width:1px;
}*/

.cart-footer-items-qty, .cart-footer-total {
  font-weight: 600
}


.cart-items-total, .cart-items-qty  {
  padding-top:8px;
  color:black;
}

.cart-footer {
  border-top: black;
  border-top-style: solid;
  border-top-width: 1px;

  padding: 5px 0 5px 0;
  font-size: .8rem;
  margin-top: 12px;
  
  display:;
}

.trash-button {
  cursor:pointer;
  /*padding-top:1rem;*/
  font-size: 1rem;
}

.cart-button {
  cursor: pointer;
}

/**************** EMPTY CART *****************/

.nullCart {
  font-weight:600;
  margin:auto;
  padding: 10px 0 10px 0;
}

/**************** LOGO *****************/

.media {
  width: 20rem;
}

.media-body p {
  z-index: 4;
  font-size: 1.8rem;
  font-weight: 600;
  width: 7rem;
  color: #3d7ece;
}

.cart-quantity {
  padding-right: 10px;
}



.cart-img {
  max-height: 150px;
}

.logo-img {
  max-width: 80px;
  z-index: 4;
}


figcaption {
  height: 10px;
  font-size: .8rem;
}

.cart-fig-caption {
  padding:5px 0 5px 0; 
  visibility: visible;
}

/*h1 .logo-w {
  font-size: 12rem;
}*/

/**************** HERO *****************/

/**************** TOOLS ****************/

input[type="submit"] {
  padding: .25rem;
  background-color: #3D7FCF;
  border: 1px solid #3D7FCF;
  border-radius: 5px;
  font-size: .75rem;
  color: white;
}

.tools-container {
  height: 95%;
  margin-top: 5rem;
}

.filter-items btn {
  width: 100%;
}

#filter-items label {
  font-weight: 600;
  font-size: 1.2rem;
}


/*********** PRODUCTS SECTION ***********/

section {
  padding: 0 .75rem;
}

h2 {
  padding-top: 1.5rem;
  font-size: 2rem;
  text-align: center;
  color: #2d2d2d;
}

h3 {
  font-size: 1.2rem;
  font-weight: 500;
  text-align: center;
  color: #2d2d2d;
  /* text-transform:uppercase;*/
}

.item-wrapper {
  width: 25rem;
  height: 650px;
  /* padding: 1rem;*/
  border-width: 1px;
  border-style: solid;
  border-radius: 4px;
  margin: .5rem;

}

.item-unit {
  /*width: 25rem;*/
  height: 95%;
  padding: 1rem;
  /* border-width: 1px;
  border-style: solid;
  border-radius:4px;*/
  /*margin: .5rem;*/
}

.product-description {
  margin-top: 1rem;
}

.product-price {
  font-weight: 600;
}

.item-unit img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top: 1rem;
}

.item-container {
  height: 95%;
}


/*********** FOOTER ***********/

footer {
  border-top-style: solid;
  border-color: #3d7ece;
  border-width: 1px;
}

footer .sign-up {
  text-align: center;
}

#getEmail {}

.nav-bottom-container {
  margin: auto;
}


/********* SIZING ***********/

@media only screen and (max-width:770px) {
  .media {
    width: 10rem;
    margin: auto;
  }

  .media-body p {
    font-size: 1.6rem;
    font-weight: 600;
    width: 7rem;
    color: #3d7ece;
    margin-left: 1rem;
  }


  header img {
    max-width: 72px;
  }

  .cart-img {
    max-width: 100px;
  }

  .tools-container {
    margin-top: 0;
  }
}

@media only screen and (max-width:576px) {

  .media {
    width: 10rem;
    margin: auto;
  }

  .media-body p {
    font-size: 1.4rem;
    font-weight: 600;
    width: 7rem;
    color: #3d7ece;
  }


  header img {
    max-width: 64px;
  }

  .cart-img {
    max-width: 100px;
  }

  .tools-container {
    margin-top: 0;
  }
}

@media only screen and (max-device-width: 400px) {
  .media {
    width: 10rem;
    margin: auto;
  }

  .media-body p {
    font-size: 1.4rem;
    font-weight: 600;
    width: 7rem;
    color: #3d7ece;
  }


  header img {
    max-width: 64px;
  }

  .tools-container {
    margin-top: 0;
  }

}
EOL

cat > overlay.css << EOL
* {
  -webkit-box-sizing: border-box;
          box-sizing: border-box; }

.overlayContainer {
  position: relative;
  width: 50%;
  width: 25rem;
  width: 100%;
  padding: 1rem;
  bottom: 0;
  left: 0; }

.image {
  display: block;
  width: 100%;
  height: auto; }

.purchaseOverlay {
  position: absolute;
  bottom: 0;
  left: 0;
  background: rgba(61, 126, 206, 0.75);
  /* blue see-through */
  color: #f1f1f1;
  width: 100%;
  -webkit-transition: .5s ease;
  transition: .5s ease;
  opacity: 0;
  color: white;
  font-size: 20px;
  padding: 30px;
  text-align: center;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px; }

.overlayContainer:hover .purchaseOverlay {
  opacity: 1; }

.buyMeIcon {
  color: white;
  cursor: pointer; }

/*# sourceMappingURL=overlay.css.map */
EOL
cat > overlay.css.map<< EOL
{
"version": 3,
"mappings": "AAEA,CAAE;EACE,UAAU,EAAE,UAAU;;AAGxB,iBAAkB;EAChB,QAAQ,EAAE,QAAQ;EAClB,KAAK,EAAE,GAAG;EACV,KAAK,EAAE,KAAK;EACZ,KAAK,EAAE,IAAI;EACX,OAAO,EAAE,IAAI;EACb,MAAM,EAAC,CAAC;EACR,IAAI,EAAC,CAAC;;AAGR,MAAO;EACL,OAAO,EAAE,KAAK;EACd,KAAK,EAAE,IAAI;EACX,MAAM,EAAE,IAAI;;AAGd,gBAAiB;EACf,QAAQ,EAAE,QAAQ;EAClB,MAAM,EAAE,CAAC;EACT,IAAI,EAAE,CAAC;EAEP,UAAU,EA3Ba,wBAAwB;EA6B/C,sBAAsB;EACtB,KAAK,EAAE,OAAO;EACd,KAAK,EAAE,IAAI;EACX,UAAU,EAAE,QAAQ;EACpB,OAAO,EAAE,CAAC;EACV,KAAK,EAAE,KAAK;EACZ,SAAS,EAAE,IAAI;EACf,OAAO,EAAE,IAAI;EAGb,UAAU,EAAE,MAAM;EAElB,0BAA0B,EAAE,GAAG;EAC/B,yBAAyB,EAAE,GAAG;;AAGhC,wCAAyC;EACvC,OAAO,EAAE,CAAC;;AAGZ,UAAW;EACT,KAAK,EAAE,KAAK;EACZ,MAAM,EAAE,OAAO",
"sources": ["../scss/overlay.scss"],
"names": [],
"file": "overlay.css"
}
EOL
cat > reset.css << EOL
/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
  display: block;
}
body {
  line-height: 1;
}
ol, ul {
  list-style: none;
}
blockquote, q {
  quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}
EOL
cat > small.css << EOL
body {
  min-width: 375px;
}

.nav-container {
  background:url("../images/logo-scarfcat-banner.png");
  background-repeat: no-repeat;
  background-color: #3d7ece;
}

.media {
  display: none;
}

.col-nav {
  margin-top: 4px;
}

.cart-items-wrapper {
  height: 100px;
  padding-right:0;
  margin-bottom:10px
}

.cart-img {
  max-width: 90px;
}


/*.cart-item:nth-last-child(n+2) {
  border-right-style:none;
  margin:auto;
}*/

.trash-button,
.cart-quantity {
  display: none;
  border-top: white;
}

.cart-footer {
  padding: 0;
  margin: 0;
}

.cart-items-total, .cart-items-qty  {
  padding-top:8px;
}

.cart-footer-items-label, .cart-footer-total-label {
  display:none;
}

.cart-footer-items-qty, .cart-footer-total {  
  font-size:1rem;
}

.cart-fig-caption {
  visibility:hidden;
}
EOL
cat > test.css << EOL

#grad1 {
    height: 200px;
   /* background:url("https://images.pexels.com/photos/40815/youth-active-jump-happy-40815.jpeg");*/
  
    background:url("../images/logo-scarfcat-banner.png");
   background-repeat:no-repeat;
  
   background-color: #cccccc;
   
}
EOL

cd ..

cat >checkOut.html << EOL
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1,  shrink-to-fit=no">

  <title>Winter Scarves</title>

  <link rel="icon" type="image/png" href="images/favicon.png">

  <link rel="stylesheet" href="css/reset.css">


  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">



  <!--  Personal Font Awesome CDN link here  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="css/main-06.css">
  <link rel="stylesheet" href="css/overlay.css">
  <link rel="stylesheet" type="text/css" media="(max-width: 576px)" href="css/small.css">

</head>

  <body>
    <h2>
    Cart (WIP)
    </h2>
  </body>

</html>

EOL
cat > .gitattributes << EOL
# Auto detect text files and perform LF normalization
* text=auto
EOL

cd js

cat > cart.js << EOL
function buildCart() {
  
  var compressedCartList="";
  

 
  if (numCartItems == 0) {
    clearCartUI();
   
    document.getElementById("checkout-link").href="#";
    document.getElementById("checkout-link").target="";
    
    createNullCartMsg();
   
  } else if (numCartItems > 0 ) {
    document.getElementById("cart-footer").style.visibility = "block";
    createCartUILeft();
    stockCart();
    createCartUIRight();
   
    document.getElementById("checkout-link").href="checkOut.html";
    document.getElementById("checkout-link").target="_blank";
    
  }
  updateCartInfo();
}

function toggleCartInfoVisibility() {

  if (numCartItems == 0) {
    /*document.getElementById("cart-footer").style.display = "none";*/
  } else {
    document.getElementById("cart-footer").style.visibility = "block";
  }

}

function createNullCartMsg() {

  var nullCartMsg;

  node = document.createElement("div");
  document.getElementById("cart-content-row").appendChild(node);
  element = document.getElementById("cart-content-row");
  node = element.lastChild;
  node.setAttribute("class", "nullCart");

  nullCartMsg = document.createTextNode("Your Cart Is Empty");
  node.appendChild(nullCartMsg);
  document.getElementById("cart-content-row").appendChild(node);

}

function updateCartInfo() {

  document.getElementById("cart-footer-items-qty").innerHTML = numCartItems;
  document.getElementById("cart-footer-total").innerHTML = "$" + cartItemTotal;
  modifyCartIcon();
}

function modifyCartIcon() {
 
  if (numCartItems > 0) {
    document.getElementById("cart-button-qty").innerHTML = numCartItems;
    document.getElementById("cart-button-qty").style.color = "white";
    document.getElementById("cart-icon").style.color = "white";
  } else {
    document.getElementById("cart-button-qty").innerHTML = "";
    document.getElementById("cart-button-qty").style.color = "";
    document.getElementById("cart-icon").style.color = "";
  }
}


function clearCart() {

  var menuChildList = document.getElementById("cart-items-wrapper");

  while (menuChildList.hasChildNodes()) {
    menuChildList.removeChild(menuChildList.firstChild);
  }

}

function clearCartUI() {

  var menuChildList = document.getElementById("cart-content-row");

  while (menuChildList.hasChildNodes()) {
    menuChildList.removeChild(menuChildList.firstChild);
  }

}

function createCartUILeft() {

  clearCartUI();

  // CREATE LEFT ARROW

  node = document.createElement("div");
  document.getElementById("cart-content-row").appendChild(node);
  element = document.getElementById("cart-content-row");
  node = element.lastChild;
  node.setAttribute("class", "move-left");
  node.setAttribute("id", "cart-arrow-left");

  node = document.createElement("i");
  document.getElementById("cart-arrow-left").appendChild(node);
  element = document.getElementById("cart-arrow-left");
  node = element.lastChild;
  node.setAttribute("class", "fa fa-caret-left");
  node.setAttribute("onclick", "shiftLeft();");

}

function createCartUIRight() {

  // CREATE RIGHT ARROW

  node = document.createElement("div");
  document.getElementById("cart-content-row").appendChild(node);
  element = document.getElementById("cart-content-row");
  node = element.lastChild;
  node.setAttribute("class", "move-right");
  node.setAttribute("id", "cart-arrow-right");

  node = document.createElement("i");
  document.getElementById("cart-arrow-right").appendChild(node);
  element = document.getElementById("cart-arrow-right");
  node = element.lastChild;
  node.setAttribute("class", "fa fa-caret-right");
  node.setAttribute("onclick", "shiftRight();");

}

function createCartItem(itemIndex, imgSource, imgTitle, productQuantity) {
 

  // create cart items wrapper div

  node = document.createElement("div");
  document.getElementById("cart-content-row").appendChild(node);
  element = document.getElementById("cart-content-row");
  node = element.lastChild;
  node.setAttribute("class", "d-flex flex-nowrap cart-items-wrapper");
  node.setAttribute("id", "cart-items-wrapper");


  // create main div for cart item

  node = document.createElement("div");
  document.getElementById("cart-items-wrapper").appendChild(node);

  element = document.getElementById("cart-items-wrapper");
  node = element.lastChild;
  node.setAttribute("class", " pl-2 pr-2 cart-item ");
  node.setAttribute("id", "cart-item-" + itemIndex);



  // create figure

  node = document.createElement("figure");
  document.getElementById("cart-item-" + itemIndex).appendChild(node);
  element = document.getElementById("cart-item-" + itemIndex);
  node = element.lastChild;
  node.setAttribute("id", "cart-figure-" + itemIndex);

 
  // create image for figure

  node = document.createElement("img");
  document.getElementById("cart-figure-" + itemIndex).appendChild(node);
  element = document.getElementById("cart-figure-" + itemIndex);
  node = element.lastChild;
  node.setAttribute("class", "cart-img");
  node.setAttribute("id", "cart-img-" + itemIndex);
  node.setAttribute("src", imgSource);
  node.setAttribute("alt", imgTitle);

  // create caption for figure

  node = document.createElement("figcaption");
  document.getElementById("cart-figure-" + itemIndex).appendChild(node);
  element = document.getElementById("cart-figure-" + itemIndex);
  node = element.lastChild;
  node.setAttribute("id", "cart-figcaption-" + itemIndex);
  node.setAttribute("class", "d-flex flex-nowrap justify-content-between  cart-fig-caption");


  node = document.createElement("span");

 
  node.appendChild(productQuantity);
  document.getElementById("cart-figcaption-" + itemIndex).appendChild(node);
  element = document.getElementById("cart-figcaption-" + itemIndex);
  node = element.lastChild;
  node.setAttribute("class", "cart-qty");
  node.setAttribute("id", "item-" + itemIndex + "-qty");

  /*node = document.createElement("i");*/
  node = document.createElement("img");
  document.getElementById("cart-figcaption-" + itemIndex).appendChild(node);
  element = document.getElementById("cart-figcaption-" + itemIndex);
  node = element.lastChild;
  /*node.setAttribute("class", "fa fa-trash trash-button");*/
  node.setAttribute("class", "trash-button");
  node.setAttribute("src","images/recycleBin.svg");
  node.setAttribute("height","20");
  node.setAttribute("alt","recycleBin");
  node.setAttribute("id", imgTitle);
  node.setAttribute("onclick", "removeItemFromCart(this.id);");
}

function stockCart() {
  var howMany;
  var imgSource;
  var imageTitle;
  var cartItemIndex;
  var quantityPreText;
  var materialPreText;
  var priceClassText;
  var itemPriceBase;
  var itemPrice;
  var itemTitleBase;
  var itemTitle;
  var itemMaterial;
  var itemMaterialBase;



  // Generate HTML for each entry in cart

  for (itemIndex = 0; itemIndex < cartItemList.length; itemIndex++) {

    cartItemIndex = cartItemList[itemIndex][0].productNum;

    imgSource = "images/" + productsScarvesOld[cartItemIndex].imageTitle;

    imgTitle = productsScarvesOld[cartItemIndex].name;
    itemTitleBase = imgTitle;
    itemTitle = itemTitleBase.replace(/(^|\s)[a-z]/g, function (f) {
      return f.toUpperCase();
    });

    itemQuantity = cartItemList[itemIndex][0].quantity;
    productQuantity = document.createTextNode("Qty: " + itemQuantity);

    createCartItem(itemIndex, imgSource, imgTitle, productQuantity);
  }
}

function findItemIndex(itemName) {

  // This finds the index of product in the original product list productsScarvesOld

  var neutralName = itemName.toLowerCase();
  var itemIndexMatch = -1;
 

  for (index = 0; index < productsScarvesOld.length; index++) {
    if (neutralName == productsScarvesOld[index].name.toLowerCase()) {
      itemIndexMatch = index;
    
      return index;
    }
  }
}

function findCartItemIndex(itemNum) {
  var itemIndexMatch = -1;

  for (index = 0; index < cartItemList.length; index++) {
    if (cartItemList[index][0].productNum == itemNum) {
      itemIndexMatch = index;
    }
  }
  return itemIndexMatch;
}

function addItemToCart(itemName) {
  var howMany;
  var imgSource;
  var imageTitle;
  var cartItemIndex;
  var quantityPreText;
  var materialPreText;
  var priceClassText;
  var itemPriceBase;
  var itemPrice;
  var itemTitleBase;
  var itemTitle;
  var itemMaterial;
  var itemMaterialBase;



  var itemIndex = findItemIndex(itemName);
  var refIndex=productsScarvesOld[itemIndex].refNum;
  refIndex--;

  var cartItemIndex = findCartItemIndex(itemIndex);

  
  if (cartItemIndex == -1) {
    
    numCartItems++;
    var newCartItem = [
      {
      /*  "productNum": itemIndex,*/
        "productNum": refIndex,
        "quantity": 1
      }
    ]
 
    
    cartItemList.unshift(newCartItem); // add new product to start of cart list
        
    itemPrice=productsScarvesOld[itemIndex].price;
    
    newItemTotal=fixTotal(cartItemTotal+itemPrice);
    cartItemTotal=newItemTotal;
    
   /* cartItemTotal+=productsScarvesOld[itemIndex].price;*/
      
    buildCart();

  } else {
    
  
    numCartItems++;
    // update quantity of item in cart
    itemQuantity = cartItemList[cartItemIndex][0].quantity;
   
    
    itemPrice=productsScarvesOld[itemIndex].price;
  
    newItemTotal=cartItemTotal+(itemQuantity*itemPrice);
    cartItemTotal=newItemTotal;
    
     itemQuantity++;
    cartItemList[cartItemIndex][0].quantity=itemQuantity;   
  
    
  
    buildCart();
  }
  
  modifyCartIcon();
}

function fixTotal(price){

  return parseFloat(price.toFixed(2));
}

function removeItemFromCart(itemName) {
  
 
  var itemIndex = findItemIndex(itemName);
  var itemQty;
  var itemPrice;
  var newItemTotal;
  
  var cartItemIndex = findCartItemIndex(itemIndex);
  
  if (cartItemIndex != -1 ){
    itemPrice=productsScarvesOld[itemIndex].price;
    itemQty=cartItemList[cartItemIndex][0].quantity;
    
    itemQty--;
    
   /* newItemTotal=fixTotal(cartItemTotal-(itemQty*itemPrice));*/
    newItemTotal=fixTotal(cartItemTotal-itemPrice);
    cartItemTotal=newItemTotal;
    
    /*numCartItems-=itemQty;*/
    numCartItems--;
    
    if (itemQty == 0) {
      cartItemList.splice(cartItemIndex,1);  // if item count goes to zero remove     
    }    else {
      cartItemList[cartItemIndex][0].quantity=itemQty; // update cart list with new qty
    }
  
    buildCart();
    modifyCartIcon();
    
  }
}
EOL
cat > main-vue.js << EOL
var appIndex = new Vue({
  el: '#app-index',
  data: {
    scarves: productsScarves,
  },
  methods: {
    nameI: function (e) {
      return e.name;
    },
    priceI: function (e) {
      return e.price;
    },
    url: function (e) {
      return e.url;
    },
    itemWrapper: function (e) {
      return ("itemWrapper-item-" + e.refNum);
    },
    itemNum: function (e) {
      return ("item-" + e.refNum);
    },
    srcI: function (e) {
      return ("images/" + e.imageTitle);
    },
    overlayContainer: function (e) {
      return ("overlayContainer-item-" + e.refNum);
    },
    overlayPurchase: function (e) {
      return ("purchaseOverlay-item-" + e.refNum);
    },
    filterItems: function (e) {
      console.log("sort value: ", document.getElementById("inputState").value);
      let sortVal = document.getElementById("inputState").value;
      switch (sortVal) {
        case "material":
          {
            productsScarves.sort(function (a, b) {
            if (a.material.toLowerCase() < b.material.toLowerCase()) //sort string ascending
              return -1
            if (a.material.toLowerCase() > b.material.toLowerCase())
              return 1
            return 0 //default return value (no sorting)
          })
          }
          break;
        case "price": {
            productsScarves.sort(function (a, b) {
            return a.price - b.price
          });
        }
          break;
        default:
          {
            alert("Please select how you'd like to view our products.");
          }
      }
    }
  }
})
EOL
cat > main.js << EOL
function createProductListing(itemNum, itemID, itemTitle, imgSource, itemDescription, itemPrice) {

  var node = document.createElement("div");
  var nodelist = document.getElementsByTagName("div").length;
  var id;
  var text;
  var containerID;
  var productID;
  var itemWrapperID;


  document.getElementById("item-grid").appendChild(node);

  element = document.getElementById("item-grid");
  node = element.lastChild;

  node.setAttribute("class", "item-wrapper");
  itemWrapperID = "itemWrapper-" + itemID
  node.setAttribute("id", itemWrapperID);

  /*NEW CODE*/
  node = document.createElement("div");
  document.getElementById(itemWrapperID).appendChild(node);
  element = document.getElementById(itemWrapperID);
  node = element.lastChild;

  node.setAttribute("class", "item-unit");
  node.setAttribute("id", itemID);


  node = document.createElement("H3");
  title = document.createTextNode(itemTitle);
  node.appendChild(title);

  document.getElementById(itemID).appendChild(node);

  node = document.createElement("IMG");
  nodelist = document.getElementsByTagName("img").length;

  document.getElementById(itemID).appendChild(node);
  document.getElementsByTagName("img")[nodelist].setAttribute("src", imgSource);
  document.getElementsByTagName("img")[nodelist].setAttribute("alt", itemTitle);

  node = document.createElement("P");
  text = document.createTextNode(itemDescription);
  node.appendChild(text);
  nodelist = document.getElementsByTagName("p").length;

  document.getElementById(itemID).appendChild(node);
  document.getElementsByTagName("p")[nodelist].setAttribute("class", "product-description");

  node = document.createElement("P");
  text = document.createTextNode(itemPrice);
  node.appendChild(text);
  nodelist = document.getElementsByTagName("p").length;

  document.getElementById(itemID).appendChild(node);
  document.getElementsByTagName("p")[nodelist].setAttribute("class", "product-price");

  /*Overlay*/

  containerID = "overlayContainer-" + itemID;
  node = document.createElement("div");
  document.getElementById(itemWrapperID).appendChild(node);
  element = document.getElementById(itemWrapperID);
  node = element.lastChild;
  node.setAttribute("class", "overlayContainer");
  node.setAttribute("id", containerID);

  node = document.createElement("div");
  document.getElementById(containerID).appendChild(node);
  element = document.getElementById(containerID);
  node = element.lastChild;
  node.setAttribute("class", "purchaseOverlay");

  purchaseOverlayID = "purchaseOverlay-" + itemID;
  node.setAttribute("id", purchaseOverlayID);

  node = document.createElement("i");
  document.getElementById(purchaseOverlayID).appendChild(node);
  element = document.getElementById(purchaseOverlayID);
  node = element.lastChild;
  node.setAttribute("class", "fa fa-shopping-cart buyMeIcon");

  productID = "product-" + itemID;
  /*node.setAttribute("id", productID);*/
  node.setAttribute("id", itemTitle);
  node.setAttribute("onclick", "addItemToCart(this.id);");

}

function shiftLeft() {
  var element = document.getElementById("cart-items-wrapper");
  var elementWidth = document.getElementById("cart-items-wrapper").offsetWidth;



  scrollIncrement = document.getElementById("cart-item-0").offsetWidth;

  element.scrollLeft -= scrollIncrement;


  clicksLeft++;



  if (element.scrollLeft <= 0) {
    clicksLeft = 0;
  }

  if (clicksRight > 0) {
    clicksRight--;
  }


  if (element.scrollLeft > 0) {
    var visibleCartItems = Math.floor(elementWidth / element.scrollLeft);
  } else {
    var visibleCartItems = Math.floor(elementWidth / cartItemWidth);
  }
  var numShifts = Math.floor(element.scrollLeft / scrollIncrement);
  var maxRight = Math.floor((numCartItems * cartItemWidth) / elementWidth) + 2;


  var itemWidthTest = (visibleCartItems * cartItemWidth);

  // WIP

  /* if (element.scrollLeft < elementWidth && element.scrollLeft > 0 ) {
      document.getElementById("cart-arrow-left").style.color = "black";
     document.getElementById("cart-arrow-right").style.color = "black";   
   } else if (element.scrollLeft == 0 ) {    
      document.getElementById("cart-arrow-left").style.color = "gray";
     document.getElementById("cart-arrow-right").style.color = "black"; 
   } else {    
      document.getElementById("cart-arrow-left").style.color = "black";
     document.getElementById("cart-arrow-right").style.color = "black"; 
   }*/
}

function shiftRight() {
  var element = document.getElementById("cart-items-wrapper");


  var elementWidth = document.getElementById("cart-items-wrapper").offsetWidth;


  scrollIncrement = document.getElementById("cart-item-0").offsetWidth;

  var maxRight = Math.floor((numCartItems * cartItemWidth) / elementWidth) + 2;

  if (clicksRight >= maxRight) {
    clicksRight = maxRight;
  }
  if (clicksLeft > 0) {
    clicksLeft--;
  }


  element.scrollLeft += scrollIncrement;
  

  clicksRight++;

 
  var numShifts = Math.floor(element.scrollLeft / scrollIncrement);


  cartItemWidth = document.getElementById("cart-item-1").offsetWidth;
  var itemWidthTest = (numCartItems * cartItemWidth);
  
  // WIP
  /* if ((numShifts >= maxRight || clicksRight >= maxRight) && (clicksRight >0)) {
     document.getElementById("cart-arrow-left").style.color = "black";    
     document.getElementById("cart-arrow-right").style.color = "gray";    
   } else if ((numShifts < (maxRight) || clicksRight < maxRight) && (clicksRight > 0 )){
     document.getElementById("cart-arrow-right").style.color = "black";
     document.getElementById("cart-arrow-left").style.color = "black";  
   } else if (clicksRight == 0){    
     document.getElementById("cart-arrow-right").style.color = "black";
     document.getElementById("cart-arrow-left").style.color = "gray";   
   }*/



}

function filterProducts() {
  event.preventDefault();
  var sortedChoice = document.filterForm.dropDown.value;

  clearProducts();
  prepProducts(sortedChoice);


}

function clearProducts() {
  var productChildList = document.getElementById("item-grid");


  while (productChildList.hasChildNodes()) {
    productChildList.removeChild(productChildList.firstChild);
  }

}

function getCookie(cookieName) {
  var name = cookieName + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function checkCookie() {
  var sortChoice = getCookie("sortedBy");

  if (sortChoice == "") {
    document.cookie = "sortedBy=unsorted";
  }
}

function prepProducts(sortedChoice) {


  switch (sortedChoice) {
    case "price":
      productsScarves.sort(function (a, b) {
        return a.price - b.price
      });
      break;
    case "material":
      productsScarves.sort(function (a, b) {
        if (a.material.toLowerCase() < b.material.toLowerCase()) //sort string ascending
          return -1
        if (a.material.toLowerCase() > b.material.toLowerCase())
          return 1
        return 0 //default return value (no sorting)
      })
      break;
  }

  /*auto-populate the page with sorted products*/


  for (i = 0; i < productsScarves.length; i++) {
    itemNum = i;

    itemID = "item-" + productsScarves[itemNum].refNum;
    itemTitle = productsScarves[itemNum].name;
    imgSource = "images/" + productsScarves[itemNum].imageTitle;
    itemDescription = productsScarves[itemNum].description;
    itemPrice = productsScarves[itemNum].price;


    createProductListing(itemNum, itemID, itemTitle, imgSource, itemDescription, itemPrice);
  }

  /* productsScarves=productsScarvesOld;*/
}

function resizeHandler() {
  setCartWidth();
  /* centerCartItems();*/
}

function unfurlCart() {
  var element = document.getElementById("cart-items-wrapper");

  element.scrollLeft = 0;


  clicksLeft = 0;
  clicksRight = 0;
  resizeHandler();
}

function setCartWidth() {
  var elementWidth = document.getElementById("cart-items-wrapper").offsetWidth;
  var elementWidth = document.getElementById("nav-container").offsetWidth;
  var cartScaling = .95;
  var cartItemsOffset = 0;


  var element = document.getElementById("cart-items-wrapper");
  scrollIncrement = document.getElementById("cart-item-1").offsetWidth;

  cartItemWidth = document.getElementById("cart-item-1").offsetWidth;

  var adjustedCartSize = (elementWidth * cartScaling - cartItemsOffset) / cartItemWidth;

  var beforeDecimal = Math.floor(adjustedCartSize);
  var afterDecimal = adjustedCartSize - beforeDecimal;

  var cartItemWidthOld = cartItemWidth;

  /* oldScrollIncrement=scrollIncrement;*/
  if (cartItemWidth == 0) {
    cartItemWidth = cartItemWidthOld;
  }


  cartWidth = (Math.floor(adjustedCartSize) + 1) * cartItemWidth;

  if (cartWidth <= 0) {
    cartWidth = cartItemWidth;
  }
  document.getElementById("cart-items-wrapper").style.width = cartWidth + "px";



  if (element.scrollLeft > 0) {
    var visibleCartItems = Math.floor(elementWidth / element.scrollLeft);
  } else {
    var visibleCartItems = Math.floor(elementWidth / cartItemWidth);
  }

  var maxRight = Math.floor((numCartItems * cartItemWidth) / elementWidth) + 2;
  var numShifts = Math.floor(element.scrollLeft / scrollIncrement);

  var itemWidthTest = (visibleCartItems * cartItemWidth);

  // WIP
  /* 
   if (element.scrollLeft < elementWidth && element.scrollLeft > 0 ) {
      document.getElementById("cart-arrow-left").style.color = "black";
     document.getElementById("cart-arrow-right").style.color = "black";   
   } else if (element.scrollLeft == 0 ) {    
      document.getElementById("cart-arrow-left").style.color = "gray";
     document.getElementById("cart-arrow-right").style.color = "black"; 
   } else {    
      document.getElementById("cart-arrow-left").style.color = "black";
     document.getElementById("cart-arrow-right").style.color = "black"; 
   }
   */

}

function centerCartItems() {
  var totalClicks = clicksRight - clicksLeft;
  var numCartItems = Math.floor(cartWidth / cartItemWidth);
  var totalCartItemWidth = numCartItems * cartItemWidth;

  /*var cartPositionOffet=Math.floor((cartWidth - totalCartItemWidth));*/

  var element = document.getElementById("cart-items-wrapper");

  var oldScrollLeft = element.scrollLeft;

  element.scrollLeft = 0;


  var newCartPosition = oldScrollLeft;

  element.scrollLeft = newCartPosition;


}

var itemNum;
var itemID;
var itemTitle;
var imgSource;
var itemDescription;
var itemPrice;
var cookieName = "sortedBy";

var sortedChoice = "unsorted";


var cartItemWidth = 104;
var scrollIncrement = 104;
var clicksLeft = 0;
var clicksRight = 0;
var lastCartWidth = -1;
var cartWidth;

var numCartItems = 0;
var cartItemTotal = 0;
var oldScrollIncrement = scrollIncrement;

var cartItemList = [];


var compressedCartList;



/*prepProducts(productsScarves, sortedChoice);*/
EOL
cat > script-unsorted.js << EOL

var productsScarvesOld = [
  {
    "name": "Reversible Plaid",
    "price": 26.99,
    "material": "acrylic",
    "description": "Two classic patterns in one great look: This supersoft and cozy reversible scarf instantly doubles your street-style cred. 100% acrylic.",
    "imageTitle": "reversible-plaid-600.png",
    "refNum":1
  },
  {
    "name": "Wool Cable Knit",
    "price": 49.99,
    "material": "wool",
    "description": "Warm yourself with this women's natural cable knit scarf, crafted from 100% Merino wool. Imported.",
    "imageTitle": "wool-cable-600.png",
    "refNum":2
  },
  {
    "name": "Northern Lights",
    "price": 29.99,
    "material": "cotton",
    "description": "Handmade by women in Agra, sales provide medical and educational support in this remote area of India. Crinkly 100% cotton.",
    "imageTitle": "northern-lights-600.png",
    "refNum":3
  },
  {
    "name": "Ombre Infinity",
    "price": 11.99,
    "material": "acrylic",
    "description": "A dip-dye effect adds color and dimension to a cozy infinity scarf featuring a soft, chunky knit. 100% acrylic.",
    "imageTitle": "ombre-infinity-600.png",
    "refNum":4
  },
  {
    "name": "Fringed Plaid",
    "price": 18.99,
    "material": "acrylic",
    "description": "Generously sized, extra soft and featuring a dazzling fringe, this scarf is rendered in a versatile gray, black and white plaid. Expertly beat the cold with style. 100% acrylic.",
    "imageTitle": "fringed-plaid-600.png",
    "refNum":5
  },
  {
    "name": "Multi Color",
    "price": 22.99,
    "material": "acrylic",
    "description": "The Who What Wear Oversize Color-Block Square Scarf is big, bold, and designed to twist and wrap any way you wish. All the colors of the season are harmonized in this oversize accent, so you can adjust to contrast or match your outfit; soft and lush, it’s your stylish standoff against cold AC and unexpected fall breezes. 100% acrylic",
    "imageTitle": "multi-color-600.png",
    "refNum":6
  },
  {
    "name": "Etro Paisley-Print Silk",
    "price": 249.99,
    "material": "silk",
    "description": "Luxurious silk scarf with subtle paisley pattern. 100% silk",
    "imageTitle": "etro-600.png",
    "refNum":7
  },
  {
    "name": "Ashby Twill",
    "price": 70.99,
    "material": "wool",
    "description": "Faribault brings you the Ashby Twill Scarf in Natural. Woven with a 'broken' twill technique, the Ashby Twill Scarf has a slight zigzag texture. Made in USA, this timeless scarf is crafted with luxurious merino wool and finished with heather gray fringe. 100% Merino wool",
    "imageTitle": "twill-600.png",
    "refNum":8
  }
]
EOL
cat > script.js << EOL

var productsScarves = [
  {
    "name": "Reversible Plaid",
    "price": 26.99,
    "material": "acrylic",
    "description": "Two classic patterns in one great look: This supersoft and cozy reversible scarf instantly doubles your street-style cred. 100% acrylic.",
    "imageTitle": "reversible-plaid-600.png",
    "refNum":1
  },
  {
    "name": "Wool Cable Knit",
    "price": 49.99,
    "material": "wool",
    "description": "Warm yourself with this women's natural cable knit scarf, crafted from 100% Merino wool. Imported.",
    "imageTitle": "wool-cable-600.png",
    "refNum":2
  },
  {
    "name": "Northern Lights",
    "price": 29.99,
    "material": "cotton",
    "description": "Handmade by women in Agra, sales provide medical and educational support in this remote area of India. Crinkly 100% cotton.",
    "imageTitle": "northern-lights-600.png",
    "refNum":3
  },
  {
    "name": "Ombre Infinity",
    "price": 11.99,
    "material": "acrylic",
    "description": "A dip-dye effect adds color and dimension to a cozy infinity scarf featuring a soft, chunky knit. 100% acrylic.",
    "imageTitle": "ombre-infinity-600.png",
    "refNum":4
  },
  {
    "name": "Fringed Plaid",
    "price": 18.99,
    "material": "acrylic",
    "description": "Generously sized, extra soft and featuring a dazzling fringe, this scarf is rendered in a versatile gray, black and white plaid. Expertly beat the cold with style. 100% acrylic.",
    "imageTitle": "fringed-plaid-600.png",
    "refNum":5
  },
  {
    "name": "Multi Color",
    "price": 22.99,
    "material": "acrylic",
    "description": "The Who What Wear Oversize Color-Block Square Scarf is big, bold, and designed to twist and wrap any way you wish. All the colors of the season are harmonized in this oversize accent, so you can adjust to contrast or match your outfit; soft and lush, it’s your stylish standoff against cold AC and unexpected fall breezes. 100% acrylic",
    "imageTitle": "multi-color-600.png",
    "refNum":6
  },
  {
    "name": "Etro Paisley-Print Silk",
    "price": 249.99,
    "material": "silk",
    "description": "Luxurious silk scarf with subtle paisley pattern. 100% silk",
    "imageTitle": "etro-600.png",
    "refNum":7
  },
  {
    "name": "Ashby Twill",
    "price": 70.99,
    "material": "wool",
    "description": "Faribault brings you the Ashby Twill Scarf in Natural. Woven with a 'broken' twill technique, the Ashby Twill Scarf has a slight zigzag texture. Made in USA, this timeless scarf is crafted with luxurious merino wool and finished with heather gray fringe. 100% Merino wool",
    "imageTitle": "twill-600.png",
    "refNum":8
  }
]
EOL
cat > signup.js << EOL

var productsScarves = [
  {
    "name": "Reversible Plaid",
    "price": 26.99,
    "material": "acrylic",
    "description": "Two classic patterns in one great look: This supersoft and cozy reversible scarf instantly doubles your street-style cred. 100% acrylic.",
    "imageTitle": "reversible-plaid-600.png",
    "refNum":1
  },
  {
    "name": "Wool Cable Knit",
    "price": 49.99,
    "material": "wool",
    "description": "Warm yourself with this women's natural cable knit scarf, crafted from 100% Merino wool. Imported.",
    "imageTitle": "wool-cable-600.png",
    "refNum":2
  },
  {
    "name": "Northern Lights",
    "price": 29.99,
    "material": "cotton",
    "description": "Handmade by women in Agra, sales provide medical and educational support in this remote area of India. Crinkly 100% cotton.",
    "imageTitle": "northern-lights-600.png",
    "refNum":3
  },
  {
    "name": "Ombre Infinity",
    "price": 11.99,
    "material": "acrylic",
    "description": "A dip-dye effect adds color and dimension to a cozy infinity scarf featuring a soft, chunky knit. 100% acrylic.",
    "imageTitle": "ombre-infinity-600.png",
    "refNum":4
  },
  {
    "name": "Fringed Plaid",
    "price": 18.99,
    "material": "acrylic",
    "description": "Generously sized, extra soft and featuring a dazzling fringe, this scarf is rendered in a versatile gray, black and white plaid. Expertly beat the cold with style. 100% acrylic.",
    "imageTitle": "fringed-plaid-600.png",
    "refNum":5
  },
  {
    "name": "Multi Color",
    "price": 22.99,
    "material": "acrylic",
    "description": "The Who What Wear Oversize Color-Block Square Scarf is big, bold, and designed to twist and wrap any way you wish. All the colors of the season are harmonized in this oversize accent, so you can adjust to contrast or match your outfit; soft and lush, it’s your stylish standoff against cold AC and unexpected fall breezes. 100% acrylic",
    "imageTitle": "multi-color-600.png",
    "refNum":6
  },
  {
    "name": "Etro Paisley-Print Silk",
    "price": 249.99,
    "material": "silk",
    "description": "Luxurious silk scarf with subtle paisley pattern. 100% silk",
    "imageTitle": "etro-600.png",
    "refNum":7
  },
  {
    "name": "Ashby Twill",
    "price": 70.99,
    "material": "wool",
    "description": "Faribault brings you the Ashby Twill Scarf in Natural. Woven with a 'broken' twill technique, the Ashby Twill Scarf has a slight zigzag texture. Made in USA, this timeless scarf is crafted with luxurious merino wool and finished with heather gray fringe. 100% Merino wool",
    "imageTitle": "twill-600.png",
    "refNum":8
  }
]
EOL
cat > vue-component.js << EOL

var productsScarves = [
  {
    "name": "Reversible Plaid",
    "price": 26.99,
    "material": "acrylic",
    "description": "Two classic patterns in one great look: This supersoft and cozy reversible scarf instantly doubles your street-style cred. 100% acrylic.",
    "imageTitle": "reversible-plaid-600.png",
    "refNum":1
  },
  {
    "name": "Wool Cable Knit",
    "price": 49.99,
    "material": "wool",
    "description": "Warm yourself with this women's natural cable knit scarf, crafted from 100% Merino wool. Imported.",
    "imageTitle": "wool-cable-600.png",
    "refNum":2
  },
  {
    "name": "Northern Lights",
    "price": 29.99,
    "material": "cotton",
    "description": "Handmade by women in Agra, sales provide medical and educational support in this remote area of India. Crinkly 100% cotton.",
    "imageTitle": "northern-lights-600.png",
    "refNum":3
  },
  {
    "name": "Ombre Infinity",
    "price": 11.99,
    "material": "acrylic",
    "description": "A dip-dye effect adds color and dimension to a cozy infinity scarf featuring a soft, chunky knit. 100% acrylic.",
    "imageTitle": "ombre-infinity-600.png",
    "refNum":4
  },
  {
    "name": "Fringed Plaid",
    "price": 18.99,
    "material": "acrylic",
    "description": "Generously sized, extra soft and featuring a dazzling fringe, this scarf is rendered in a versatile gray, black and white plaid. Expertly beat the cold with style. 100% acrylic.",
    "imageTitle": "fringed-plaid-600.png",
    "refNum":5
  },
  {
    "name": "Multi Color",
    "price": 22.99,
    "material": "acrylic",
    "description": "The Who What Wear Oversize Color-Block Square Scarf is big, bold, and designed to twist and wrap any way you wish. All the colors of the season are harmonized in this oversize accent, so you can adjust to contrast or match your outfit; soft and lush, it’s your stylish standoff against cold AC and unexpected fall breezes. 100% acrylic",
    "imageTitle": "multi-color-600.png",
    "refNum":6
  },
  {
    "name": "Etro Paisley-Print Silk",
    "price": 249.99,
    "material": "silk",
    "description": "Luxurious silk scarf with subtle paisley pattern. 100% silk",
    "imageTitle": "etro-600.png",
    "refNum":7
  },
  {
    "name": "Ashby Twill",
    "price": 70.99,
    "material": "wool",
    "description": "Faribault brings you the Ashby Twill Scarf in Natural. Woven with a 'broken' twill technique, the Ashby Twill Scarf has a slight zigzag texture. Made in USA, this timeless scarf is crafted with luxurious merino wool and finished with heather gray fringe. 100% Merino wool",
    "imageTitle": "twill-600.png",
    "refNum":8
  }
]


var productsScarvesOld = [
  {
    "name": "Reversible Plaid",
    "price": 26.99,
    "material": "acrylic",
    "description": "Two classic patterns in one great look: This supersoft and cozy reversible scarf instantly doubles your street-style cred. 100% acrylic.",
    "imageTitle": "reversible-plaid-600.png",
    "refNum":1
  },
  {
    "name": "Wool Cable Knit",
    "price": 49.99,
    "material": "wool",
    "description": "Warm yourself with this women's natural cable knit scarf, crafted from 100% Merino wool. Imported.",
    "imageTitle": "wool-cable-600.png",
    "refNum":2
  },
  {
    "name": "Northern Lights",
    "price": 29.99,
    "material": "cotton",
    "description": "Handmade by women in Agra, sales provide medical and educational support in this remote area of India. Crinkly 100% cotton.",
    "imageTitle": "northern-lights-600.png",
    "refNum":3
  },
  {
    "name": "Ombre Infinity",
    "price": 11.99,
    "material": "acrylic",
    "description": "A dip-dye effect adds color and dimension to a cozy infinity scarf featuring a soft, chunky knit. 100% acrylic.",
    "imageTitle": "ombre-infinity-600.png",
    "refNum":4
  },
  {
    "name": "Fringed Plaid",
    "price": 18.99,
    "material": "acrylic",
    "description": "Generously sized, extra soft and featuring a dazzling fringe, this scarf is rendered in a versatile gray, black and white plaid. Expertly beat the cold with style. 100% acrylic.",
    "imageTitle": "fringed-plaid-600.png",
    "refNum":5
  },
  {
    "name": "Multi Color",
    "price": 22.99,
    "material": "acrylic",
    "description": "The Who What Wear Oversize Color-Block Square Scarf is big, bold, and designed to twist and wrap any way you wish. All the colors of the season are harmonized in this oversize accent, so you can adjust to contrast or match your outfit; soft and lush, it’s your stylish standoff against cold AC and unexpected fall breezes. 100% acrylic",
    "imageTitle": "multi-color-600.png",
    "refNum":6
  },
  {
    "name": "Etro Paisley-Print Silk",
    "price": 249.99,
    "material": "silk",
    "description": "Luxurious silk scarf with subtle paisley pattern. 100% silk",
    "imageTitle": "etro-600.png",
    "refNum":7
  },
  {
    "name": "Ashby Twill",
    "price": 70.99,
    "material": "wool",
    "description": "Faribault brings you the Ashby Twill Scarf in Natural. Woven with a 'broken' twill technique, the Ashby Twill Scarf has a slight zigzag texture. Made in USA, this timeless scarf is crafted with luxurious merino wool and finished with heather gray fringe. 100% Merino wool",
    "imageTitle": "twill-600.png",
    "refNum":8
  }
]
EOL

cd ..
cd scss
cat > main.scss<<EOL
* {
  box-sizing: border-box;
}

body {
  font-size: 100%;
  font-family: Montserrat, "Open Sans", Helvetica, Arial, sans-serif;
}

p {
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-weight: lighter;
  color: #2d2d2d;
}

/* TODO: size images manually so this is not necessary */

img {
  max-height: 20rem;
}

/***************** NAV *****************/

nav a:hover {
  text-decoration: underline;
  color: white;
}

nav a {
  color: white;
  letter-spacing: 1px;
}

.nav-container {
  color: white;
  background-color: #3d7ece;
  width: auto;
}

#nav-row, #nav-row-links {
  text-align: center;
}

#cart {
  height: 1rem;
}

/*#scarves {
  color: #ffd05a;
}*/

.button-cart {
  border: none;
  background: #3d7ece;
}

#checkout-button a:hover {
  text-decoration: none;
}

#cart-icon {
}

.cart-button-qty {
  color:linen;
}

.button-cart:hover {
  cursor: pointer;
}

.cart-hidden {
  border-radius: 4px;
  background-color: white;
}

.cart-wrapper {
  color: black;
  align-content: center;
}

.checkOutButton:hover {
  text-decoration:none;
}

.move-left,
.move-right {
  /*color: black;*/
  cursor: pointer;
  width: 40px;
  font-size: 30px;
  margin: auto;
}

.move-left {
  /*color:gray;*/ 
  color:black;
}
/*

.move-left:hover,
.move-right:hover {
  color: black;
}
*/


.cart-items-wrapper {
/* margin:auto;*/
  margin:0 5px 0 5px;
 /* width:94%;*/
  overflow:hidden;
  align-content:center;
  justify-content: space-between;
}

#cart-content-row {
 width:95%;
  margin:auto;
  justify-content: space-between;
}

.cart-item {
 margin:auto
  width:100px;
}

/*.cart-item:nth-last-child(n+2) {
  border-right: black;
  border-right-style:solid;
  border-right-width:1px;
}*/

.cart-footer-items-qty, .cart-footer-total {
  font-weight: 600
}


.cart-items-total, .cart-items-qty  {
  padding-top:8px;
  color:black;
}

.cart-footer {
  border-top: black;
  border-top-style: solid;
  border-top-width: 1px;

  padding: 5px 0 5px 0;
  font-size: .8rem;
  margin-top: 12px;
  
  display:;
}

.trash-button {
  cursor:pointer;
  /*padding-top:1rem;*/
  font-size: 1rem;
}

.cart-button {
  cursor: pointer;
}

/**************** EMPTY CART *****************/

.nullCart {
  font-weight:600;
  margin:auto;
  padding: 10px 0 10px 0;
}

/**************** LOGO *****************/

.media {
  width: 20rem;
}

.media-body p {
  z-index: 4;
  font-size: 1.8rem;
  font-weight: 600;
  width: 7rem;
  color: #3d7ece;
}

.cart-quantity {
  padding-right: 10px;
}



.cart-img {
  max-height: 150px;
}

.logo-img {
  max-width: 80px;
  z-index: 4;
}


figcaption {
  height: 10px;
  font-size: .8rem;
}

.cart-fig-caption {
  padding:5px 0 5px 0; 
  visibility: visible;
}

/*h1 .logo-w {
  font-size: 12rem;
}*/

/**************** HERO *****************/

/**************** TOOLS ****************/

input[type="submit"] {
  padding: .25rem;
  background-color: #3D7FCF;
  border: 1px solid #3D7FCF;
  border-radius: 5px;
  font-size: .75rem;
  color: white;
}

.tools-container {
  height: 95%;
  margin-top: 5rem;
}

.filter-items btn {
  width: 100%;
}

#filter-items label {
  font-weight: 600;
  font-size: 1.2rem;
}


/*********** PRODUCTS SECTION ***********/

section {
  padding: 0 .75rem;
}

h2 {
  padding-top: 1.5rem;
  font-size: 2rem;
  text-align: center;
  color: #2d2d2d;
}

h3 {
  font-size: 1.2rem;
  font-weight: 500;
  text-align: center;
  color: #2d2d2d;
  /* text-transform:uppercase;*/
}

.item-wrapper {
  width: 25rem;
  height: 650px;
  /* padding: 1rem;*/
  border-width: 1px;
  border-style: solid;
  border-radius: 4px;
  margin: .5rem;

}

.item-unit {
  /*width: 25rem;*/
  height: 95%;
  padding: 1rem;
  /* border-width: 1px;
  border-style: solid;
  border-radius:4px;*/
  /*margin: .5rem;*/
}

.product-description {
  margin-top: 1rem;
}

.product-price {
  font-weight: 600;
}

.item-unit img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top: 1rem;
}

.item-container {
  height: 95%;
}


/*********** FOOTER ***********/

footer {
  border-top-style: solid;
  border-color: #3d7ece;
  border-width: 1px;
}

footer .sign-up {
  text-align: center;
}

#getEmail {}

.nav-bottom-container {
  margin: auto;
}


/********* SIZING ***********/

@media only screen and (max-width:770px) {
  .media {
    width: 10rem;
    margin: auto;
  }

  .media-body p {
    font-size: 1.6rem;
    font-weight: 600;
    width: 7rem;
    color: #3d7ece;
    margin-left: 1rem;
  }


  header img {
    max-width: 72px;
  }

  .cart-img {
    max-width: 100px;
  }

  .tools-container {
    margin-top: 0;
  }
}

@media only screen and (max-width:576px) {

  .media {
    width: 10rem;
    margin: auto;
  }

  .media-body p {
    font-size: 1.4rem;
    font-weight: 600;
    width: 7rem;
    color: #3d7ece;
  }


  header img {
    max-width: 64px;
  }

  .cart-img {
    max-width: 100px;
  }

  .tools-container {
    margin-top: 0;
  }
}

@media only screen and (max-device-width: 400px) {
  .media {
    width: 10rem;
    margin: auto;
  }

  .media-body p {
    font-size: 1.4rem;
    font-weight: 600;
    width: 7rem;
    color: #3d7ece;
  }


  header img {
    max-width: 64px;
  }

  .tools-container {
    margin-top: 0;
  }

}
EOL
cat > overlay.scss <<EOL
$purchaseOverlay-bg-color: rgba(61, 126, 206, 0.75);

* {
    box-sizing: border-box;
  }

  .overlayContainer {
    position: relative;
    width: 50%;
    width: 25rem;
    width: 100%;
    padding: 1rem;
    bottom:0;
    left:0;
  }

  .image {
    display: block;
    width: 100%;
    height: auto;
  }

  .purchaseOverlay {
    position: absolute;
    bottom: 0;
    left: 0;

    background: $purchaseOverlay-bg-color;
    
    /* blue see-through */
    color: #f1f1f1;
    width: 100%;
    transition: .5s ease;
    opacity: 0;
    color: white;
    font-size: 20px;
    padding: 30px;
    
    
    text-align: center;
    
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
  }

  .overlayContainer:hover .purchaseOverlay {
    opacity: 1;
  }

  .buyMeIcon {
    color: white;
    cursor: pointer;
  }
EOL
}
# Function to create a new project
create_project() {
    PROJECT_NAME=$(zenity --entry --title="C++ Project Setup" --height=400 --width=400 --text="Enter your project name:")

    if [ -z "$PROJECT_NAME" ]; then
        zenity --error --text="Project name cannot be empty. Exiting."
        return 1
    fi

    mkdir "$PROJECT_NAME"
    cd "$PROJECT_NAME" 
    mkdir header src asset lib scripts

    # Create .gitignore, README, CMakeLists.txt, and other project files
    cat > .gitignore <<EOL
# Ignore build files
/build/

# Ignore CMake cache and temp files
CMakeCache.txt
CMakeFiles/
Makefile
*.cmake
*.swp

# Ignore IDE specific files
.idea/
.vscode/
EOL

    cat > .Readme << EOL
# Provide instructions for building the project
zenity --info --title="Build Instructions" --text="To build the project, follow these steps:
1. Open a terminal.
2. Navigate to the project directory.
3. Run the following commands:
   mkdir build
   cd build 
   cmake ..
   make
4. Run the executable:
   ./$PROJECT_NAME
EOL

    cat > CMakeLists.txt <<EOL
cmake_minimum_required(VERSION 3.10)
project(CppFileGenerator VERSION 1.0)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# Set output directory within the build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/bin)

if (WIN32)
    message(STATUS "Configuring for Windows...")
    if (MSVC)
        set(CMAKE_GENERATOR_PLATFORM x64)
    else()
        find_program(GCC_BIN g++)
        find_program(CLANG_BIN clang)
        if (GCC_BIN)
            set(CMAKE_C_COMPILER \${GCC_BIN})
        elseif (CLANG_BIN)
            set(CMAKE_C_COMPILER \${CLANG_BIN})
        else()
            message(FATAL_ERROR "Neither MSVC, GCC, nor Clang found! Please install a compiler.")
        endif()
    endif()
elseif (APPLE)
    set(CMAKE_C_COMPILER clang++)
elseif (UNIX)
    find_program(GCC_BIN g++)
    find_program(CLANG_BIN clang)
    if (GCC_BIN)
        set(CMAKE_C_COMPILER \${GCC_BIN})
    elseif (CLANG_BIN)
        set(CMAKE_C_COMPILER \${CLANG_BIN})
    else()
        message(FATAL_ERROR "Neither G++ nor Clang found! Please install a compiler.")
    endif()
endif()

# Locate source files
file(GLOB SOURCES "src/*.cpp")

# Add executable target with source files
add_executable(app \${SOURCES})

# Link header file directory
target_include_directories(app PRIVATE header)

if (MSVC)
    target_compile_options(app PRIVATE /W4 /permissive-)
else()
    target_compile_options(app PRIVATE -Wall -Wextra -Wpedantic)
endif()
EOL


EOL

    cat > header/win.h <<EOL
#ifndef WIN_H
#define WIN_H

#include <iostream>

void displayMessage() {
    std::cout << "Hello, World from $PROJECT_NAME!" << std::endl;
}

#endif // WIN_H
EOL

    cat > src/main.cpp <<EOL
#include "win.h"

int main() {
    displayMessage();
    return 0;
}
EOL

    zenity --info --title="Project Created" --text="Project '$PROJECT_NAME' created successfully!"

    # Ask if the user wants to initialize a git repository
    INIT_GIT=$(zenity --question --title="Git Initialization" --text="Do you want to initialize a Git repository?" --ok-label="Yes" --cancel-label="No")

    if [ $? -eq 0 ]; then
        git init
        git add .
        git commit -m "Initial commit for $PROJECT_NAME"
        zenity --info --text="Git repository initialized and initial commit made."
    else
        zenity --info --text="No Git repository initialized."
    fi
}

# Function to delete a project
delete_project() {
    PROJECT_NAME=$(zenity --entry --title="Delete Project" --height=400 --width=400 --text="Enter the project name you want to delete:")

    if [ -z "$PROJECT_NAME" ]; then
        zenity --error --text="No project name provided. Exiting."
        return 1
    fi

    if [ -d "$PROJECT_NAME" ]; then
        zenity --question --title="Confirm Deletion" --text="Are you sure you want to delete the project '$PROJECT_NAME'?"
        if [ $? -eq 0 ]; then
            rm -rf "$PROJECT_NAME"
            zenity --info --text="Project '$PROJECT_NAME' has been deleted."
        else
            zenity --info --text="Project deletion canceled."
        fi
    else
        zenity --error --text="Project '$PROJECT_NAME' does not exist."
    fi
}

option() {
  ACTION=$(zenity --list --title="Create" --column="Action" \
        "C++" "Website" --height=400 --width=400)

  case "$ACTION" in
    "C++") 
      create_project
      ;;
    "Website") 
      create_website
      ;;
    *)
      echo "Exiting creation"
      return
      ;;
  esac
}
# Function to display help
show_help() {
    zenity --info --title="Help" --text="This is a simple script to create, delete, and manage a C++ project.

1. Create: Creates a new C++ project with a template structure.
2. Delete: Deletes an existing project directory by specifying its name.
3. Help: Shows this help message."
}

# Main loop for handling user actions
while true; do
    # Load theme
           set_dark_mode

    # Launch Zenity for project-related actions
    ACTION=$(zenity --list --title="C++ Project Setup" --column="Action" \
        "Create" "Delete" "Help" --height=400 --width=400)

    # Check the user's action and call the corresponding function
    case $ACTION in
        "Create")
            option
            ;;
        "Delete")
            delete_project
            ;;
        "Help")
            show_help
            ;;

        *)
            echo "Exiting the script."
            break  # Exit the loop if no valid action is selected
            ;;
    esac
done
