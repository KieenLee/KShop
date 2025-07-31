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
                                <a href="customerAdmin?service=listAllCustomer" class="nav-item nav-link" >Customer</a>
                                <a href="productAdmin?service=listAllProduct" class="nav-item nav-link">Product</a>
                                <a href="billAdmin?service=listAllBill" class="nav-item nav-link">Bill</a>
                                <a href="#" class="nav-item nav-link">Statistic</a>

                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <div class="d-flex align-items-center">
                                    <a class="navbar-brand" href="">Welcome ${user.name}</a>
                                    <a class="btn btn-outline-dark ms-auto" href="profile?service=listAllProfileAdmin" style="margin-right: 10px">Profile</a>
                                    <a class="btn btn-outline-dark ms-auto" href="logout">Logout</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>


        <!-- Navbar End -->
    </body>
</html>
