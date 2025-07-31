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

        <%@include file="panner.jsp" %>

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-3">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 100px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
            </div>
        </div>
        <!-- Page Header End -->

        <%
            Vector<Products> vectorProduct = (Vector<Products>) request.getAttribute("dataProduct");
            Vector<Categories> vectorCategories = (Vector<Categories>) request.getAttribute("dataCategories");
        %>

        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-2 col-md-12">
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Categories</h5>
                        <div class="price-filter-links">
                            <%
                                for (Categories categories : vectorCategories) {
                            %>
                            <a href="shop?service=searchId&cateId=<%= categories.getId()%>" class="price-link d-flex justify-content-between align-items-center mb-3">
                                <%= categories.getName().substring(0, 1).toUpperCase() + categories.getName().substring(1).toLowerCase()%>
                            </a>
                            <%}%>
                        </div>
                    </div>   
                </div>
                <!-- Shop Sidebar End -->

                <!-- Shop Product Start -->
                <div class="col-lg-10 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">                      
                                <form action="shop" method="POST">
                                    <input type="hidden" name="service" value="searchByName">
                                    <div class="input-group">
                                        <input type="text" name="keyword" class="form-control" placeholder="Search by name" value="${keyword}">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                               
                            </div>
                        </div>

                        <%
                            for (Products products : vectorProduct) {
                        %>
                        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                            <div class="card product-item border-0 mb-4">
                                <a href="#" class="product-link" data-id="<%=products.getId()%>" data-name="<%=products.getName()%>" 
                                   data-price="<%=products.getPrice()%>" data-type="<%=products.getCategory_type().substring(0, 1).toUpperCase() + products.getCategory_type().substring(1).toLowerCase()%>"
                                   data-image="<%=products.getImage()%>">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0" >
                                        <img class="img-fluid w-100" src="<%=products.getImage()%>" alt="" style="width: 420px; height: 490px;" >
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3"><%=products.getName()%></h6>
                                        <div class="d-flex justify-content-center">
                                            <h6><%=products.getPrice()%></h6>
                                        </div>
                                    </div>
                                </a>
                                <div class="card-footer d-flex justify-content-right bg-light border">
                                    <c:choose>
                                        <c:when test="${sessionScope.user ne null}">
                                            <a href="Cart?service=add2Cart&pid=<%=products.getId()%>&price=<%=products.getPrice()%>" class="btn btn-sm text-dark p-0 ml-auto">
                                                <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                            </c:when>
                                            <c:otherwise>
                                            <a href="login.jsp" class="btn btn-sm text-dark p-0 ml-auto">
                                                <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->

        <!-- quick view -->
        <div class="modal fade" id="modaltoggle" aria-hidden="true" tabindex="-1">
            <div class="modal-dialog modal-fullscreen-md-down modal-md modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="col-lg-12 col-md-12 me-3">
                            <div class="image-holder">
                                <img src="img/product-1.jpg" alt="Shoes" id="product-image" style="width: 420px; height: 490px;">
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="summary">
                                <div class="summary-content fs-6">
                                    <div class="product-header d-flex justify-content-between mt-4">
                                        <h3 class="display-7" id="product-name">Product Name</h3>
                                    </div>
                                    <span class="product-price fs-3" id="product-price">$99</span>
                                    <ul>
                                        <li>
                                            <strong>Size:</strong> S / M / L / XL
                                        </li>
                                        <li>
                                            <strong>Type:</strong> <span class="product-type fs-3" id="product-type"></span>
                                        </li>
                                    </ul>
                                    <div class="variations-form shopify-cart">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <a rel="nofollow" data-no-instant="" href="#" class="btn btn-block btn-primary my-3 py-3" id="add-to-cart-link">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ quick view -->

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
        <script>
            $(document).ready(function () {
                $('.product-link').on('click', function (e) {
                    e.preventDefault();
                    var id = $(this).data('id');
                    var name = $(this).data('name');
                    var price = $(this).data('price');
                    var type = $(this).data('type');
                    var image = $(this).data('image');

                    $('#product-name').text(name);
                    $('#product-price').text('$' + price);
                    $('#product-type').text(type);
                    $('#product-image').attr('src', image);

                    var addToCartLink;
            <% if (session.getAttribute("user") != null) { %>
                    addToCartLink = "Cart?service=add2Cart&pid=" + id + "&price=" + price;
            <% } else { %>
                    addToCartLink = "login.jsp";
            <% }%>
                    $('#add-to-cart-link').attr('href', addToCartLink);

                    $('#modaltoggle').modal('show');
                });
            });
        </script>
    </body>

</html>