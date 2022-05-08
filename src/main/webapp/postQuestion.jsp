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
        <form method="post" action="processQuestion.jsp">
            <h2 class="text-center">Ask question</h2>
            <div class="mb-3">
                <div class="container">
                <div class="row" style="margin-bottom: 4%;">
                <% int questionID = (int)(Math.floor(Math.random() * Math.pow(2, 10))); %>
                	<div class="col-md-12"><input class="form-control" type="text" name="question" placeholder="question" value="question" maxlength="50"></div>
                	<div class="col-md-12"><input class="form-control" type="hidden" name="email" placeholder="email" value=<%= session.getAttribute("email").toString()%> maxlength="50"></div>
                	<input class="form-control" type="hidden" name="questionID" placeholder="questionID" value=<%= questionID%> maxlength="50"></div>
                </div>
                    
                </div>
            </div>
            
            <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"><button class="btn btn-primary" type="submit" style="text-align: center;display: flex;justify-content: center;">Post Question</button></div>
            <div style="text-align: center;"></div>
        </form>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>