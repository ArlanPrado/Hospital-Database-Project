
<%@ page import="java.sql.*"%>

<html>
<head>
<title>User Profile</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
}
div {
  margin-bottom: 15px;
  padding: 4px 12px;
}

.button {
  border: none;
  color: black;
  padding: 5px ;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}


.profileInfo {
  width: 400px;
  height: 300px;
  border: 6px solid #57FCA4;
  background-color: #D6FFE9;
}


</style>
</head>
<body>
    <h1>User Profile</h1>
  	<button><a class="button" href="patient.jsp">Back</a></button>
    <hr />
    
  <%int user_id = (int)session.getAttribute("user_id");
 
 
 String db = "Hospital";
 String user; // assumes database name is the same as username
   user = "root";
   String password = session.getAttribute("dbPass").toString();
 
 String firstName = "";
 String lastName = "";
 String gender = "";
 String address = "";
 String phoneNumber = "";
 String dateOfBirth = "";
 String email = "";
 String userPassword = "";
 String censoredPassword = "";
 int passwordLength = 0;
 
 try {
     
     java.sql.Connection con; 
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
     Statement stmt = con.createStatement();
     
     java.util.Date now = new java.util.Date();
     java.sql.Date sqlDate = new java.sql.Date(now.getTime());
     //find the patient id using the patient id
     ResultSet rs = stmt.executeQuery("SELECT * FROM user ");
   
     while(rs.next()) {  
         if(rs.getInt(1) == (user_id) ){
        	 firstName = rs.getString("firstName");
             lastName = rs.getString(3);
             dateOfBirth = rs.getString(4);
             gender = rs.getString(5);
             phoneNumber = rs.getString(6);
             address = rs.getString(7);
             email = rs.getString(8);
             userPassword = rs.getString(9);
             passwordLength = userPassword.length();
             userPassword = "";
             	for (int i = 0; i < passwordLength; i++) {
             		censoredPassword = censoredPassword + "*";
             	}
            break;
         }
     } 
     stmt.close();
     con.close();
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
%>


<div class="profileInfo">
  <p><strong>User:</strong> <%=firstName%> <%=lastName%></p>
   <p><strong>User ID:</strong> <%=user_id%></p>
    <p><strong>Birth Date:</strong> <%=dateOfBirth%></p>
     <p><strong>Gender:</strong> <%=gender%></p>
      <p><strong>Phone Number:</strong> <%=phoneNumber%></p>
       <p><strong>Address:</strong> <%=address%></p>
        <p><strong>Email:</strong> <%=email%></p>
         <p><strong>Password:</strong> <%=censoredPassword%></p>
         
</div>

<div class="edit"> 
  <button><a class="button" href="editProfile.jsp">Edit User Profile</a></button>
</div>

 
</body>
</html>
