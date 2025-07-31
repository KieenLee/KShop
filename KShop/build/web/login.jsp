<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <meta name="description" content="Minimal Authentication System" />
        <meta name="author" content="Lovable" />
        <meta property="og:image" content="/og-image.png" />
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/register.css" />
        <style>
            .error-message {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="auth-container">
            <div class="auth-form fade-in-up">
                <div class="glass-card p-4 p-md-5">
                    <div class="text-center mb-4">
                        <h1 class="h3 mb-3 fw-bold">Welcome back</h1>
                        <p class="text-muted">Sign in to your account</p>
                    </div>

                    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                    <% if (errorMessage != null) {%>
                    <div class="alert alert-danger text-center" role="alert">
                        <%= errorMessage%>
                    </div>
                    <% }%>

                    <form id="loginForm" action="login" method="POST">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required/>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required/>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 btn-hover-effect" id="login">Sign in</button>
                    </form>

                    <div class="mt-4 text-center">
                        <p class="text-muted small">Don't have an account?
                            <a href="register.jsp" class="text-primary">Sign up</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Main JS -->
        <script src="/js/main.js"></script>
    </body>

</html>