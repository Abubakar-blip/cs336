<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
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
    <p style="text-align:center"> 
	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		ResultSet resultSet = null;
		
		
		//Get parameters from the HTML form at the index.jsp
		String auctionEmail = request.getParameter("auctionEmail");
		String itemName = request.getParameter("auctionName");
		String secretPrice = request.getParameter("secret_price");
		String price = request.getParameter("price");
		String email = session.getAttribute("email").toString();
	
		out.print(itemName);
		
		
		if(secretPrice != null && price != null & email != null){
			String insert = "INSERT INTO bid( email, upperLimit, price, auctionEmail, auctionName)"
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, email);
			ps.setString(2, secretPrice);
			ps.setString(3, price);
			ps.setString(4, auctionEmail);
			ps.setString(5, itemName);
			ps.executeUpdate();
			out.print("Your bid is up");
		}else{
			out.print("Please fill out all information and make sure you are logged in");
		}
			
		
		
	
			
		

		
	
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>
	</p>

</body>
</html>