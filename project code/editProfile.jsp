
<%@ page import="java.sql.*"%>

<html>
<head>
<title>Edit User Profile</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
}
div {
  margin-bottom: 15px;
  padding: 4px 12px;
}

#main {
  margin: auto;
  width: 300px;
  height: 270px;
  border: 6px solid #D17CFF;
  background-color: #F3DDFF;
}

.button {
  border: none;
  color: black;
  padding: 5px ;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.current {
  margin: left;
  width: 400px;
  height: 170px;
}

</style>
</head>
<body>
    <h1>Edit User Profile</h1>
    <button><a class="button" href="patient.jsp">Back To Dashboard</a></button>
    <button><a class="button" href="profile.jsp">Back To Profile</a></button>
    <hr />
    
<div id="main">
    <br />
    <form action="editProfile.jsp" method="post">
     <br /><strong> Fill Any Field To Update Profile:</strong><br/>
    <br /> Phone: <input type="number"  name="phone" /><br />
    <br /> Address: <input type="text" name="address" /><br />
        <br /> Email: <input type="email" name="email" /><br />
        <br /> Password: <input type="password" name="password" /><br />
        <br /> <input type="submit" value="Submit" />
    </form>
</div> 

  <%int user_id = (int)session.getAttribute("user_id");

 String currentPhoneNumber = "";
 String currentAddress = "";
 String currentEmail = "";
 String currentUserPassword = "";
 
 
 String phoneNumber = "";
 phoneNumber = request.getParameter("phone");
 String address = "";
 address = request.getParameter("address");
 String email = "";
 email = request.getParameter("email");
 String userPassword = "";
 userPassword = request.getParameter("password");
    
  String db = "Hospital";
     String user; // assumes database name is the same as username
       user = "root";
     String password = "rootpass";
     try {
         
         java.sql.Connection con; 
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
         Statement stmt = con.createStatement();
         
         java.util.Date now = new java.util.Date();
         java.sql.Date sqlDate = new java.sql.Date(now.getTime());
         
         ResultSet rs = stmt.executeQuery("SELECT * FROM user ");
         
         boolean formComplete = false;
         if (phoneNumber != null || address != null || email != null || userPassword != null){
       		formComplete = true;
       	 }
         while(rs.next()) {  
             if(rs.getInt(1) == (user_id) ){
            	 currentPhoneNumber = rs.getString(6);
            	 if (phoneNumber == "") {
            		 phoneNumber = currentPhoneNumber;
            	 }
            	 currentAddress = rs.getString(7);
            	 if (address == "") {
            		 address = currentAddress;
            	 }
            	 currentEmail = rs.getString(8);
            	 if (email == "") {
            		 email = currentEmail;
            	 }
            	 currentUserPassword = rs.getString(9);
            	 if (userPassword == "") {
            		 userPassword = currentUserPassword;
            	 }
                break;
             }
         } 
    	 if (formComplete) {
         String insertSql = "UPDATE user"
        		 + "SET user.phoneNumber ='"+ phoneNumber + "', user.address = '" + address + "', user.email = '" + email + "', user.password = '" + userPassword + "'"
                 + "WHERE user.userID = " + user_id;
         stmt.execute(insertSql);   
         //response.sendRedirect("patient.jsp"); 
    	 }
    	 //rs.close();
         stmt.close();
         con.close();
     } catch(SQLException e) { 
         out.println("SQLException caught: " + e.getMessage()); 
     }
 %>
 
 <div class="current">
  <p><strong>Current Phone Number:</strong> <%=currentPhoneNumber%></p>
   <p><strong>Current Address:</strong> <%=currentAddress%></p>
   <p><strong>Current Email:</strong> <%=currentEmail%></p>
   <p><strong>Current Password:</strong> <%=currentUserPassword%></p>
   
</div>
 
 
</body>
</html>