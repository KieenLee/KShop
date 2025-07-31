<%@page import="model.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import = "java.util.Vector ,model.Products" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>KShop - Our Shop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
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
        <!-- Navbar Start -->
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
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Profile Start -->

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-0">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Profile</h1>
            </div>
        </div>
        <!-- Page Header End -->
        
        <!-- UserProfile Start -->
        <div class="container-fluid pt-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0 text-center">User Profile</h4>
                        </div>
                        <div class="card-body">
                            <c:forEach var="user" items="${dataUser}">
                                <form action="profile?service=updateProfile" method="post">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <div class="form-group">
                                        <label>Name:</label>
                                        <input type="text" class="form-control" name="name" value="${user.name}">
                                    </div>
                                    <div class="form-group">
                                        <label>Email:</label>
                                        <input type="email" class="form-control" name="email" value="${user.email}">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone:</label>
                                        <input type="text" class="form-control" name="phone" value="${user.phone}">
                                    </div>
                                    <div class="form-group">
                                        <label>Date of Birth:</label>
                                        <input type="date" class="form-control" name="dob" value="${user.dob}">
                                    </div>
                                    <div class="form-group">
                                        <label>Address:</label>
                                        <input type="text" class="form-control" name="address" value="${user.address}">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Update</button>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- UserProfile End -->

        <!-- Profile End -->


        <%@include file="footer.jsp" %>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>

    </body>

</html>