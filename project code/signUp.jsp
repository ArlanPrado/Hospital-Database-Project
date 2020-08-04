

<%@ page import="java.sql.*"%>
<html>
<head>
<title>SignUp</title>
<style type="text/css">
 {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
  background-color: #867979;
  background-image: url("image/9.jpg");
  color: #4CB9A8;
}

/* Header/logo Title */
.header {
  padding: 2px;
  text-align: center;
  background: #1abc9c;
  color: white;
}

/* Increase the font size of the heading */
.header h1 {
  font-size: 40px;
}

/* Style the top navigation bar */
.navbar {
  overflow: hidden;
  background-color: #333;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}

/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* Column container */
.row {  
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
  -ms-flex: 30%; /* IE10 */
  flex: 30%;
  background-color: #f1f1f1;
  padding: 20px;
}

/* Main column */
.main {   
  -ms-flex: 70%; /* IE10 */
  flex: 70%;
  background-color: #80ff00;
  padding: 20px;
}



/* Footer */
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   height: 20%;
   background-color: #4CB9B1;
   color: white;
   text-align: center;
}

/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
  .row {   
    flex-direction: column;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .navbar a {
    float: none;
    width: 100%;
  }
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
<div class="header">
  <h1>Hospital Management System Registration</h1>
</div>

<div class="navbar">
  <a href="dashBord.jsp" style="color:#ff8000;">HOME</a>
</div>




<div id="main">
    <br />
    <form action="signUp.jsp" method="post">
    
    <br /> First Name:<input type="text" name="firstName" required/><br />
    <br /> Last Name:<input type="text" name="lastName" required/><br />
    <br /> Birth Date:<input type="date" name="birthdatE" required/><br />
    <br /> Gender:<input type="text" name="gendeR" required/><br />
    <br /> Phone:<input type="number"  name="phone" /><br />
    <br /> Address:<input type="text" name="address" /><br />
        <br /> Email:<input type="email" name="email" required/><br />
        <br /> Password:<input type="password" name="password" required/><br />
        <br /> <input type="submit" value="submit" />
        <button><a class="button" href="login.jsp"> Login</a></button>
    </form>
</div> 

    <ul>
        <li><p>
                <b>Email:</b>
                <%= request.getParameter("email")%>
            </p></li>
        <li><p>
                <b>Password:</b>
                <%= request.getParameter("password")%>
            </p></li>
    </ul>


    <% 
    String FirstName=request.getParameter("firstName");
    String LastName=request.getParameter("lastName");
    String dateOfbirth=request.getParameter("birthdatE");
    String Gender=request.getParameter("gendeR");
    String Phone=request.getParameter("phone");
    String Address=request.getParameter("address");
    String UserEmail=request.getParameter("email");
    String USerPassword = request.getParameter("password");
    
       
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
            
            String insertSql = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
                    + " phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('"+FirstName+"', '"+LastName+"','"+dateOfbirth+"','"+Gender+"', '"+Phone+"' ,"
                    +" '"+Address+"','"+UserEmail +"','"+USerPassword+"','" + sqlDate + "')";
            stmt.execute(insertSql);   
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    
    <div class="footer">
  <p>Footer</p>
</div>
</body>
</html>

