<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>KShop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar Start User/ Not User-->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">

                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">K</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="index.jsp" class="nav-item nav-link">Home</a>
                                <a href="shop?service=listAllProduct" class="nav-item nav-link">Shop</a>
                                <c:choose>
                                    <c:when test="${sessionScope.user ne null}">
                                        <a href="Cart?service=listAllCart" class="nav-item nav-link" >Shopping Cart </a>
                                        <a href="checkout?service=listAllCheckout" class="nav-item nav-link">Checkout</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="login.jsp" class="nav-item nav-link" >Shopping Cart </a>
                                        <a href="login.jsp" class="nav-item nav-link">Checkout</a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <c:if test="${sessionScope.user ne null}">
                                    <div class="d-flex align-items-center">
                                        <a class="navbar-brand" href="">Welcome ${user.name}</a>
                                        <a class="btn btn-outline-dark ms-auto" href="profile?service=listAllProfile" style="margin-right: 10px">Profile</a>
                                        <a class="btn btn-outline-dark ms-auto" href="logout">Logout</a>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.user eq null}">
                                    <div class="d-flex align-items-center">
                                        <a href="login.jsp" class="nav-item nav-link">Login</a>
                                        <a href="register.jsp" class="nav-item nav-link">Register</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-1.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">KSHOP - Best quality and price</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Best quality</h3>
                                        <a href="shop?service=listAllProduct" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-2.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">KSHOP - Best quality and price</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                        <a href="shop.jsp" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Navbar End -->
    </body>
</html>
