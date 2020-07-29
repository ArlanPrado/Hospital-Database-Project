

<%@ page import="java.sql.*"%>
<html>
<head>
<title>SignUp</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 13%,#D3D3D3 13%,#92a8d1 50%,white 100%);
}
#mylogin {
  align-self: center;
}

#main {
  margin: auto;
  width: 320px;
  height: 370px;
  border: 3px solid #73AD21;
  padding: 10px;
  display: flex;
}
.button {
  border: none;
  color: black;
  padding: 5px ;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
</head>
<body>
    <h1>Hospital Management System Registration </h1>
    <hr />

<div id="main">
    <br />
    <form action="signUp.jsp" method="post">
    
    <br /> First Name:<input type="text" name="firstName" required/><br />
    <br /> Last Name:<input type="text" name="lastName" required/><br />
    <br /> Birth Date:<input type="date" name="birthdate" required/><br />
    <br /> Gender:<input type="text" name="gender" required/><br />
    <br /> Phone:<input type="number"  name="phone" /><br />
    <br /> Address:<input type="text" name="address" /><br />
        <br /> Email:<input type="email" name="email" required/><br />
        <br /> Password:<input type="password" name="password" required/><br />
        <br /> <input type="submit" value="submit" />
        <button><a class="button" href="login.jsp"> Login</a></button>
    </form>
</div> 


    <% 
    String FirstName=request.getParameter("firstName");
    String LastName=request.getParameter("lastName");
    String dateOfbirth=request.getParameter("birthdate");
    String Gender=request.getParameter("gender");
    String Phone=request.getParameter("phone");
    String Address=request.getParameter("address");
    String UserEmail=request.getParameter("email");
    String UserPassword = request.getParameter("password");
    int user_id = -1;
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
          String password = session.getAttribute("dbPass").toString();
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            
            
            String insertSql = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
                    + " phoneNumber, address, email, password) "
                    + "VALUES ('"+FirstName+"', '"+LastName+"','"+dateOfbirth+"','"+Gender+"', '"+Phone+"' ,"
                    +" '"+Address+"','"+UserEmail +"','"+UserPassword+"')";
            stmt.execute(insertSql);   
            
            ResultSet rs = stmt.executeQuery("SELECT userID, email FROM user WHERE email='" + UserEmail +"'");
            while(rs.next()){
            	user_id = rs.getInt(1);
            	break;
            }
            stmt.close();
            con.close();
        }catch(Exception e){
    		if(e.getMessage() != "null")
    			out.println("SQL Exception Caught: " + e.getMessage());
    	}
    
    if(user_id > 0){
    %>
    <div class="newUser">
    	<p><b>User ID: <%=user_id%></b>
    	<p>First Name: <%= FirstName%></p>
    	<p>Last Name: <%= LastName%></p>
    	<p>Date of Birth: <%= dateOfbirth%></p>
    	<p>Gender: <%= Gender%></p>
    	<p>Phone: <%= Phone%></p>
    	<p>Address: <%=Address %></p>
    	<p>Email: <%=UserEmail %></p>
    	<p>
    </div>
    <%} %>
</body>
</html>

