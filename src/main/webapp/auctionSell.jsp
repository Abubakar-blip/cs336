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
        <form method="post" action="processSellingItem.jsp">
            <h2 class="text-center">Put up an Auction</h2>
            <div class="mb-3">
                <div class="container">
                <div class="row" style="margin-bottom: 4%;">
                	<div class="col-md-12"><input class="form-control" type="text" name="item_Name" placeholder="Item Name" value="item_Name"></div>
                </div>
                    <div class="row">
                        <div class="col-md-6"><input class="form-control" type="number" name="price" placeholder="Item Price" value="price"></div>
                        <div class="col-md-6"><input class="form-control" type="number" name="secret_price" placeholder="Secret Price"  value="secret_price"></div>
                        	 <div class="col-md-6"><input type="datetime-local" id="time" name="time"></div>
                    </div>
                </div>
            </div>
            <div class="mb-3">
            <h1> Pick a category</h1>
               <select name="category" size=1>
				<option value="phone">Phone</option>
				<option value="laptop">Laptop</option>
				<option value="tv">TV</option>
			</select>&nbsp;<br>
            </div>
            <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"><button class="btn btn-primary" type="submit" style="text-align: center;display: flex;justify-content: center;">Sell Item</button></div>
            <div style="text-align: center;"></div>
        </form>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>