<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Beer World</title>
		 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
	</head>
	
	<body>
	
 <nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
        <div class="container"><a class="navbar-brand" href="Welcome.jsp">Buy ME</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"></button>
            <div class="collapse navbar-collapse" id="navcol-1"><a class="btn btn-primary ms-auto" role="button" href="auctionSell.jsp">Sell Item</a> </div>
             <div class="collapse navbar-collapse" id="navcol-1"><a class="btn btn-primary ms-auto" role="button" href="postQuestion.jsp">Ask a Question</a> </div>
             <div class="collapse navbar-collapse" id="navcol-1"><a class="btn btn-primary ms-auto" role="button" href="login.jsp">Sign In</a> </div>
        </div>
  </nav>
    <header class="text-center text-white masthead" style="background:url('assets/img/bg-masthead.jpg')no-repeat center center;background-size:cover;">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto position-relative">
                <div class="row"> 
      
                
                <h1 id="name" style="text-align:center" class=class="col-9 col-md-9 mb-2 mb-md-0"> <% try{ 
                	String name = session.getAttribute("name").toString();
                	
                	if(name.length() > 0){
                		
                	out.println("Welcome " + name);
                	}
                }catch (Exception ex) {
            		
            	}  %> </h1>
                <form method="post" action="logout.jsp"> 
                	<div class="col-12 ">
                	
                	
                	<button id="logOut" class="btn btn-primary btn-lg" type="submit">LogOut!</button></div>
                </form>
                </div>
                    <h1 class="mb-5">Search for your favorite products</h1>
                </div>
              
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto position-relative">
                   
                        <div class="row">
                           
                            <div class="col-6"><a class="btn btn-primary btn-lg" type="submit" href="showAuctions.jsp">Show Auctions!</a></div>
                            <div class="col-6"><a class="btn btn-primary btn-lg" type="submit" href="showQuestions.jsp">Show Questions!</a></div>
                        </div>
                         
                   
                </div>
                
            </div>
        </div>
    </header>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
	

</body>
</html>