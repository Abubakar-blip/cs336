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
		ResultSet winningBid = null;
		
		//Get parameters from the HTML form at the index.jsp
		String auctionEmail = request.getParameter("auctionEmailForWinner");
		String auctionName = request.getParameter("auctionNameForWinner");
		String auctionCategory = request.getParameter("auctionCategory");
		 String minAuctionPrice = request.getParameter("auctionPrice");
		String highestBid =  "SELECT MAX(price) AS highestBid, email AS winningEmail FROM bid WHERE bid.auctionName = " +"\"" + auctionName + "\"" + " && bid.auctionEmail = " + "\"" + auctionEmail + "\"" ;
			
		winningBid = stmt.executeQuery(highestBid);
		winningBid.next();
		int winningPrice = winningBid.getInt("highestBid");
		String winningEmail = winningBid.getString("winningEmail");
			out.print(minAuctionPrice);
			int auctionPrice = Integer.parseInt(minAuctionPrice);
			if(winningPrice >= auctionPrice){
				
		String results = "SELECT * FROM winningBid WHERE winningBid.auctionEmail = " + "\"" + auctionEmail + "\"" + " && winningBid.auctionName = "+ "\"" + auctionName + "\"" + " && winningBid.winnerEmail = " + "\"" + winningEmail + "\"";
		
		resultSet = stmt.executeQuery(results);
		int count = 0;
		while(resultSet.next()){
			 count++;
		}
	
			if(count == 0){
				
		String insert = "INSERT INTO winningBid( category, auctionName, price, winnerEmail, auctionEmail)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, auctionCategory);
		ps.setString(2, auctionName);
		ps.setInt(3, winningPrice);
		ps.setString(4, winningEmail);
		ps.setString(5, auctionEmail);
		
	
		ps.executeUpdate();
		
		
			}
			out.print(auctionEmail + " has won the auction");
			}else{
				out.print("There was no winner");
			}
		//Make an insert statement for the Sells table:
		
		
		
		
		
			
		
		
	
			
		

		
	
		
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