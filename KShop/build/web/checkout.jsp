<%@page import="model.Cart"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>KShop - Checkout</title>
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
    <%
        Vector<Cart> checkoutCart = (Vector<Cart>) request.getAttribute("checkoutCart");
        double totalCartPrice = 0;
    %>

    <body>

        <%@include file="panner.jsp" %>


        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Checkout Start -->
        <div class="container-fluid pt-1">
            <div class="row justify-content-center">
                <div class="col-lg-6">

                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                        </div>

                        <div class="card-body">
                            <h5 class="font-weight-medium mb-3">Products</h5>

                            <% if (checkoutCart == null || checkoutCart.isEmpty()) { %>
                            <p>Please add to cart!</p>
                            <% } else {
                                for (Cart cart : checkoutCart) {
                                    double totalPrice = cart.getPrice() * cart.getQuantity();
                                    totalCartPrice += totalPrice;
                            %>
                            <div class="d-flex justify-content-between">
                                <p><%=cart.getProductName()%></p>
                                <p>$<%= String.format("%.2f", totalPrice)%></p>
                            </div>
                            <% }%>
                            <hr class="mt-0">
                        </div>

                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$<%= String.format("%.2f", totalCartPrice)%></h5>
                            </div>
                        </div>
                    </div>

                    <div class="card border-secondary">
                        <div class="card-footer border-secondary bg-transparent">
                            <a href="checkout?service=updateOrder&totalPrice=<%= String.format("%.2f", totalCartPrice)%>"
                               class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</a>
                        </div>
                    </div>

                    <% }%> <!-- Đóng if kiểm tra giỏ hàng -->
                </div>
            </div>
        </div>
        <!-- Checkout End -->


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
