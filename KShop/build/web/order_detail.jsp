<%@page import="model.Bill"%>
<%@page import="model.Order_Detail"%>
<%@page import="model.Orders"%>
<%@page import="model.Users"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>KShop - Order Details</title>
        <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
            />
    </head>
    <%
        Orders order = (Orders) request.getAttribute("order");
        Users user = (Users) request.getAttribute("user");
        Vector<Bill> orderBill = (Vector<Bill>) request.getAttribute("orderDetails");
    %>
    <body>
        <%@include file="admin_panner.jsp" %>

        <div class="container mt-5">
            <h1>Order Details</h1>
            <p><strong>User:</strong> <%= user.getName()%></p>
            <p><strong>Total Price:</strong> <%= order.getTotalPrice()%></p>
            <p><strong>Status:</strong> <%= order.getStatus()%></p>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Image</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (orderBill != null) {
                            for (Bill detail : orderBill) {
                    %>
                    <tr>
                        <td><%= detail.getProduct_id()%></td>
                        <td><img src="<%= detail.getImage()%>" alt="Product Image" width="100"></td>
                        <td><%= detail.getQuantity()%></td>
                        <td><%= detail.getPrice()%></td>
                        <td><%= detail.getTotal_price()%></td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="5" class="text-center">No order details found.</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <a href="billAdmin?service=listAllBill" class="btn btn-primary">Back to Orders</a>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>