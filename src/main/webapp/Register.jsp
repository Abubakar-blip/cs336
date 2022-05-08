<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
        <div class="container"><a class="navbar-brand" href="Welcome.jsp">Buy ME</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"></button>
            <div class="collapse navbar-collapse" id="navcol-1"></div>
        </div>
    </nav>
    <section class="contact-clean">
        <form method="post" action="loginModel.jsp">
            <h2 class="text-center">Sign Up</h2>
            <div class="mb-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6"><input class="form-control" type="text" name="first_Name" placeholder="First name" value="first_Name"></div>
                        <div class="col-md-6"><input class="form-control" type="text" name="last_name" placeholder="Last Name"  value="last_name"></div>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <div class="row" style="margin-bottom: 4%;">
                    <div class="col"><input class="form-control" type="text" name="user"  placeholder="userName" style="margin-bottom: 4%;" value="user"></div>
                </div>
                <div class="row">
                    <div class="col"><input class="form-control" type="text" name="Email" placeholder="Email" style="margin-bottom: 4%;" value="Email"></div>
                </div>
                <div class="row">
                    <div class="col"><input class="form-control" type="text" name="Password" placeholder="Password" value="Password"></div>
                </div>
            </div>
            <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"><button class="btn btn-primary" type="submit" style="text-align: center;display: flex;justify-content: center;">Register</button></div>
            <div style="text-align: center;"></div>
        </form>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>