<%@page import="model.Orders"%>
<%@page import="model.Users"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>KShop - (Admin) Bill Management</title>
        <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
        />
    </head>
    <%
        Vector<Orders> vectorOrder = (Vector<Orders>) request.getAttribute("dataBill");
        Vector<Users> vectorUsers = (Vector<Users>) request.getAttribute("dataUsers");
    %>
    <body>
        <%@include file="admin_panner.jsp" %>

        <div class="container mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h1>Manage Bill</h1>
                <!-- Search Form -->
                <form class="form-inline" method="post" action="billAdmin">
                    <input type="hidden" name="service" value="search">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search by Name" aria-label="Search" name="searchName">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <!-- Search Form End-->
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>Activity</th>
                    </tr>
                </thead>
                <tbody id="orderTable">
                    <% if (vectorOrder != null) {
                        for (Orders order : vectorOrder) { 
                            Users user = vectorUsers.stream().filter(u -> u.getId() == order.getUserId()).findFirst().orElse(null);
                        %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= user != null ? user.getName(): "Unknown" %></td>
                        <td><%= order.getTotalPrice() %></td>
                        <td>
                            <form method="post" action="billAdmin" style="display:inline;">
                                <input type="hidden" name="id" value="<%= order.getId() %>">
                                <select name="status" onchange="this.form.submit()">
                                    <option value="pending" <%= "pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                                    <option value="processing" <%= "processing".equals(order.getStatus()) ? "selected" : "" %>>Processing</option>
                                    <option value="completed" <%= "completed".equals(order.getStatus()) ? "selected" : "" %>>Completed</option>
                                    <option value="canceled" <%= "canceled".equals(order.getStatus()) ? "selected" : "" %>>Canceled</option>
                                </select>
                                <input type="hidden" name="service" value="updateStatus">
                            </form>
                        </td>
                        <td>
                            <form method="post" action="billAdmin" style="display:inline;">
                                <input type="hidden" name="id" value="<%= order.getId() %>">
                                <button type="submit" class="btn btn-sm btn-primary" name="service" value="detail">Detail</button>
                            </form>
                            <form method="post" action="billAdmin" onsubmit="return confirmDelete()" style="display:inline;">
                                <input type="hidden" name="id" value="<%= order.getId() %>">
                                <button type="submit" class="btn btn-sm btn-danger" name="service" value="delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="7" class="text-center">No orders found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function confirmDelete() {
                return confirm('Are you sure you want to delete this bill?');
            }
        </script>
    </body>
</html>