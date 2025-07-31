<!DOCTYPE html>
<%@page import="model.Users"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>KShop - (Admin) Customer Management</title>
        <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
        />
    </head>
    <%
        Vector<Users> vectorUser = (Vector<Users>) request.getAttribute("dataCustomer");
    %>
    <body>
        <%@include file="admin_panner.jsp" %>

        <div class="container mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h1>Manage customer</h1>
                <!-- Search Form -->
                <form class="form-inline" method="post" action="customerAdmin">
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
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Date of birth</th>
                        <th>Address</th>
                        <th>Activity</th>
                    </tr>
                </thead>
                <tbody id="customerTable">
                    <% if (vectorUser != null) {
                        for (Users customer : vectorUser) { %>
                    <tr>
                        <td><%= customer.getId() %></td>
                        <td><%= customer.getName() %></td>
                        <td><%= customer.getEmail() %></td>
                        <td><%= customer.getPhone() %></td>
                        <td><%= customer.getDob() %></td>
                        <td><%= customer.getAddress() %></td>
                        <td>
                            <form method="post" action="customerAdmin" onsubmit="return confirmDelete()">
                                <input type="hidden" name="id" value="<%= customer.getId() %>">
                                <button type="submit" class="btn btn-sm btn-danger" name="service" value="delete">Delete</button>
                            </form>
                            <form method="post" action="customerAdmin">
                                <input type="hidden" name="id" value="<%= customer.getId() %>">
                                <button type="submit" class="btn btn-sm btn-info" name="service" value="detail">Detail</button>
                            </form>
                        </td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="7" class="text-center">No customers found.</td>
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
                return confirm('Are you sure you want to delete this customer?');
            }
        </script>
    </body>
</html>