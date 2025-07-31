<!DOCTYPE html>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h1>User Details</h1>
            <%
                Users user = (Users) request.getAttribute("userDetail");
                if (user != null) {
            %>
            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <td><%= user.getId() %></td>
                </tr>
                <tr>
                    <th>User Name</th>
                    <td><%= user.getUserName() %></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><%= user.getPassword() %></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><%= user.getName() %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= user.getEmail() %></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><%= user.getPhone() %></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><%= user.getDob() %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><%= user.getAddress() %></td>
                </tr>
            </table>
            <a href="customerAdmin" class="btn btn-secondary">Back to Customer</a>
            <% } else { %>
            <p class="text-danger">User not found.</p>
            <a href="customerAdmin" class="btn btn-secondary">Back to Customer</a>
            <% } %>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>