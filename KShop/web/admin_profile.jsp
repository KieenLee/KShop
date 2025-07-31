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
        <%@include file="admin_panner.jsp" %>
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