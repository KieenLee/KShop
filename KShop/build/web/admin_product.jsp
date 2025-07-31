<%@page import="model.Products"%>
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
        Vector<Products> vectorProduct = (Vector<Products>) request.getAttribute("dataProduct");
    %>
    <body>
        <%@include file="admin_panner.jsp" %>

        <div class="container mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h1>Manage Products</h1>
                <!-- Search Form -->
                <form class="form-inline" method="post" action="productAdmin">
                    <input type="hidden" name="service" value="search">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search by Name" aria-label="Search" name="searchName">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <!-- Search Form End-->
                <button class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">Add Product</button>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Stock</th>
                        <th>Price</th>
                        <th>Activity</th>
                    </tr>
                </thead>
                <tbody id="customerTable">
                    <% if (vectorProduct != null) {
                        for (Products product : vectorProduct) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><img src="<%= product.getImage()%>" alt="Product Image" width="50"></td>
                        <td><%= product.getName()%></td>
                        <td><%= product.getStock()%></td>
                        <td><%= product.getPrice()%></td>
                        <td>
                            <button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#editProductModal<%= product.getId() %>">Edit</button>
                            <form method="post" action="productAdmin" onsubmit="return confirmDelete()" style="display:inline;">
                                <input type="hidden" name="id" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-sm btn-danger" name="service" value="delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <!-- Edit Product Modal -->
                    <div class="modal fade" id="editProductModal<%= product.getId() %>" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="productAdmin">
                                        <input type="hidden" name="id" value="<%= product.getId() %>">
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control" name="name" value="<%= product.getName() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Price</label>
                                            <input type="number" class="form-control" name="price" value="<%= product.getPrice() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="stock">Stock</label>
                                            <input type="number" class="form-control" name="stock" value="<%= product.getStock() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="category_id">Category ID</label>
                                            <input type="number" class="form-control" name="category_id" value="<%= product.getCategoryId() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="image">Image URL</label>
                                            <input type="text" class="form-control" name="image" value="<%= product.getImage() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="category_type">Category Type</label>
                                            <input type="text" class="form-control" name="category_type" value="<%= product.getCategory_type() %>" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary" name="service" value="update">Save Changes</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="7" class="text-center">No products found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Add Product Modal -->
        <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="productAdmin">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" name="price" required>
                            </div>
                            <div class="form-group">
                                <label for="stock">Stock</label>
                                <input type="number" class="form-control" name="stock" required>
                            </div>
                            <div class="form-group">
                                <label for="category_id">Category ID</label>
                                <input type="number" class="form-control" name="category_id" required>
                            </div>
                            <div class="form-group">
                                <label for="image">Image URL</label>
                                <input type="text" class="form-control" name="image" required>
                            </div>
                            <div class="form-group">
                                <label for="category_type">Category Type</label>
                                <input type="text" class="form-control" name="category_type" required>
                            </div>
                            <button type="submit" class="btn btn-primary" name="service" value="add">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function confirmDelete() {
                return confirm('Are you sure you want to delete this product?');
            }
        </script>
    </body>
</html>