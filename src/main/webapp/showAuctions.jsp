<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

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
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM auction";
		
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			
			
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
			<%
			//parse out the results
			while (result.next()) {
				String auctionEmail = result.getString("email");
				String auctionName =  result.getString("itemName");
				
				String deadline = result.getString("auctionDate");
				out.print(auctionName);
						String formattedDeadline = deadline.substring(5, 7) + "/" + deadline.substring(8, 10) + "/" + deadline.substring(0, 4) + " at " + deadline.substring(11,16);
			%>
				
				<tr>   
					<td><%= result.getString("itemName") %></td> 
				</tr>
				<tr>
				
					<td> Auction by: <%= result.getString("email") %>
						
					</td>
				</tr>
					<br></br>
					<tr> 
					
					<td> Price:  <%= result.getString("price") %>
					
					</td>
					</tr>
					<tr>
					
					<td> Category: <%= result.getString("category") %>
						
					</td>
					</tr>
					<tr>
					
					<td> Auction End Time:  <%= formattedDeadline %>
						
					</td>
					</tr>
				
					<% String rep= session.getAttribute("rep").toString();
						
						if(rep.length() > 0){
							
					%>
						<tr>
						
						<td>
						<form method="post"  action="deleteAuction.jsp">
					
				 <div class="row">
                      
                        <input type="text"  style="display: none" name="itemEmail" value=<%=result.getString("email")%>>
                         <input type="text"  style="display: none"  name="itemName" value="">
                          <input  value="Delete Auction" type="submit"/>
                    </div>
                        <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"></div>
				</form> 
						</td>
						</tr>	
					
					<%} %>
					<tr>
					<td>
					<% int year = Integer.parseInt(deadline.substring(0,4)) - 1900; 
					int month = Integer.parseInt(deadline.substring(5,7)) - 1;
					int day =  Integer.parseInt(deadline.substring(8,10));
					int hours = Integer.parseInt(deadline.substring(11,13));
					int minutes = Integer.parseInt(deadline.substring(14,16));
						long todayDate = new java.util.Date().getTime();
						long bidDate = new java.util.Date(year, month, day, hours, minutes).getTime();
						
						if(bidDate > todayDate){	
				
							
						%>
					
				<form method="post"  action="proccessBid.jsp">
					
				 <div class="row">
                        <div class="col-md-3"><input class="form-control" type="number" name="price" placeholder="Bid Price" value="price"></div>
                        <div class="col-md-3"><input class="form-control" type="number" name="secret_price" placeholder="Secret Price"  value="secret_price"></div>
                         <div class="col-md-3">  <input  value="Put Bid" type="submit"/></div>
                        <input type="text"  style="display: none"  id="auctionEmail" name="auctionEmail" value=<%= result.getString("email") %>>
                         <input style="display: none"  type="text" id="auctionName" name="auctionName" value=<%= result.getString("itemName") %>>
                    </div>
                        <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"></div>
				</form> 
					</td>
					<tr> 
					
				<% } if( bidDate < todayDate){ %>
					<td>
					<form method="post"  action="showWinner.jsp">
					
				
    
                        <input type="hidden" id="auctionEmailForWinner" name="auctionEmailForWinner" value=<%= result.getString("email") %>>
                         <input type="hidden" id="auctionNameForWinner" name="auctionNameForWinner" value=<%= result.getString("itemName") %>>
                          <input type="hidden" id="auctionCategory" name="auctionCategory" value=<%= result.getString("category") %>>
                          <input type="hidden" id="auctionPrice" name="auctionPrice" value=<%= result.getString("secretPrice") %>>
                              <input  value="Winning Bid"  type="submit"/></div>
                   
                     
				</form> 
				</td> 
				
				<% } %>

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
					</tr>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>