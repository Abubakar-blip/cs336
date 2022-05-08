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
			String str = "SELECT * FROM questions";
		
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			
			
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
			<%
			//parse out the results
			while (result.next()) {
				String question = result.getString("question");
				String email =  result.getString("email");
				
				String id = result.getString("id");
			
						
			%>
				
				<tr>   
					<td><%= result.getString("question") %></td> 
				</tr>
				<% if(result.getString("answer") != null){ %>   
				<tr>
					<td><%= result.getString("answer") %></td> 
				</tr>
				<%} %>
				<%String rep = session.getAttribute("rep").toString();
					if(rep.length() > 0){
						
				
				%><tr>
					<td>
					
						<form method="post"  action="answerProccess.jsp">
					
				 <div class="row">
                      
                        <div class="col-md-12"><input class="form-control" type="text" name="answer" placeholder="answer"  value="answer" maxlength="50"></div>
                         <div class="col-md-3">  <input  value="Answer" type="submit"/></div>
                        <input type="hidden" id="questionId" name="questionId" value=<%=result.getString("id")%>>
                        
                    </div>
                        <div class="mb-3" style="text-align: center;display: flex;justify-content: center;"></div>
				</form> 
					</td>
				
				
				</tr>
				
					<%} %>
				
				
					
				

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
					
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>