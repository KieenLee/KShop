<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sign Up</title>
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
    </head>
    <body>
        <div class="auth-container">
            <div class="auth-form fade-in-up">
                <div class="glass-card p-4 p-md-5">
                    <div class="text-center mb-4">
                        <h1 class="h3 mb-3 fw-bold">Create an account</h1>
                        <p class="text-muted">Sign up to get started</p>
                    </div>


                    <form id="registerForm" action="register" method="post">

                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required />
                        </div>

                        <c:if test="${existedUsername ne null}">
                            <p style="color: red; font-size: 1rem; text-align: center">${existedUsername}</p>
                        </c:if>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required />
                        </div>

                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" required />
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required />
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" required />
                        </div>

                        <div class="mb-3">
                            <label for="dob" class="form-label">Birthday</label>
                            <input type="date" class="form-control" id="dob" name="dob" required />
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" required />
                        </div>

                        <button type="submit" class="btn btn-primary w-100 btn-hover-effect" id="submitButton">Sign up</button>

                        <c:if test="${registerSuccess ne null}">
                            <p style="color: green; font-size: 1rem; text-align: center">
                                <a href="login.jsp">${registerSuccess}</a>
                            </p>
                        </c:if>
                    </form>

                    <div class="mt-4 text-center">
                        <p class="text-muted small">Already have an account?
                            <a href="login.jsp" class="text-primary">Sign in</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Registration JS -->
    <script src="/js/register.js"></script>
</body>
</html>
