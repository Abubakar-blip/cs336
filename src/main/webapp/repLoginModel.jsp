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
		
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");//Make an insert statement for the Sells table:
		String results = "SELECT * FROM repLogin WHERE repLogin.email = " + "\"" + email + "\"" + " AND " + "repLogin.password = " + "\"" + password + "\"";
	
		resultSet = stmt.executeQuery(results);
		int count = 0;
		String name = "";
		String userEmail = "";
		while(resultSet.next()){
			 count++;
			 
			 userEmail = resultSet.getString("email");
		}
		session.setAttribute("name", name);
		session.setAttribute("rep", userEmail );
		session.setAttribute("admin", "" );
		session.setAttribute("email", userEmail);
		if(count == 0){
			out.print("Email or Password is incorrect");
		}else{
			
		out.print("Welcome back " + name + "! Press BuyMe to go back " );
		
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