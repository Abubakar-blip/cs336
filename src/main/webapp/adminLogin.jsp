<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

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
        <form method="post" action="adminLoginModel.jsp" >
            <h2 class="text-center">Admin Login</h2>
            <div class="mb-3"><input class="form-control" type="text" name="Email" placeholder="Email" value="Email"></div>
            <div class="mb-3"><input class="form-control" type="text" name="Password" placeholder="Password" value="Password"></div>
            <div class="mb-3"></div>
            <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"><button class="btn btn-primary" type="submit" style="text-align: center;display: flex;justify-content: center;">Continue</button></div>
            <div style="text-align: center;"><a href="registerRep.jsp">Create a Representative</a></div>
             
        </form>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>