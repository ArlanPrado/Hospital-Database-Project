

<%@ page import="java.sql.*"%>
<html>
<head>
<title>Profile</title>
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
  height: 150px;
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
    <h1>Patient Edit Profile  Dashbord</h1>
    <hr />

<div id="main">
    <br />
    <form action="patientProfile.jsp" method="post">
    
<!--     <br /> First Name:<input type="text" name="firstName" required/><br />
    <br /> Last Name:<input type="text" name="lastName" required/><br />
    <br /> Birth Date:<input type="date" name="birthdatE" required/><br />
    <br /> Gender:<input type="text" name="gendeR" required/><br /> -->
    <br /> Phone:<input type="number"  name="phone" /><br />
    <br /> Address:<input type="text" name="address" /><br />
        <br /> Email:<input type="email" name="email" required/><br />
 <!--        <br /> Password:<input type="password" name="password" required/><br /> -->
        <br /> <input type="submit" value="submit" />
        <button><a class="button" href="login.jsp"> Login</a></button>
    </form>
</div> 

    <ul>
        <li><p>
                <b>phone:</b>
                <%= request.getParameter("phone")%>
            </p></li>
        <li><p>
                <b>Password</b>
                <%= request.getParameter("address")%>
            </p></li>
    </ul>
<%String userid = session.getAttribute("id").toString(); %>
out.println(userid);
    <% 
    /* String FirstName=request.getParameter("firstName");
    String LastName=request.getParameter("lastName");
    String dateOfbirth=request.getParameter("birthdatE");
    String Gender=request.getParameter("gendeR"); */
    String Phone=request.getParameter("phone");
    String Address=request.getParameter("address");
    String UserEmail=request.getParameter("email");
    /* String USerPassword = request.getParameter("password"); */
    
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Iluvhim@123";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully connected.<br/><br/>");
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            
            String insertSql = "UPDATE user SET  phoneNumber = '"+Phone+"',"
                       +"address = '"+Address+"', email='"+UserEmail +"' WHERE userID='"+userid+"' ";
                
            stmt.execute(insertSql);   
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    
    
</body>
</html>

