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
		String itemName = request.getParameter("item_Name");
		String price = request.getParameter("price");
		String secretPrice = request.getParameter("secret_price");
		String category = request.getParameter("category");
		String email = session.getAttribute("email").toString();
		String auctiontime = request.getParameter("time");
		out.print(auctiontime);
		String formattedTime = auctiontime.substring(0,10) + "-" + auctiontime.substring(11,13) + "-" + auctiontime.substring(14,16) + "-00";
		if(itemName != null && price != null && secretPrice != null && category != null && email != null && secretPrice != null){
			
		//Checks if item is already in auctions
		String results = "SELECT * FROM auction WHERE auction.email = " + "\"" + email + "\"" + " AND " + "auction.itemName = " + "\"" + itemName + "\"" ;
		
		resultSet = stmt.executeQuery(results);
		int count = 0;
		while(resultSet.next()){
			 count++;
		}
		
	
			if(count == 0){
				
		String insert = "INSERT INTO auction( secretPrice, price, category, itemName, email, auctionDate)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, secretPrice);
		ps.setString(2, price);
		ps.setString(3, category);
		ps.setString(4, itemName);
		ps.setString(5, email);
		ps.setString(6, formattedTime);
	
		ps.executeUpdate();
		out.print("Your auction is up");
		
			}else{
				out.print("You already have the same auction up Press BuyMe to return to the homepage");
			}
		}else{
			out.print("Please fill out all information");
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