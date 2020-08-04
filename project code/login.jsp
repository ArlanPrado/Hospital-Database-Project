<%@ page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
<title>SignIn</title>
<style type="text/css">
 {
  box-sizing: border-box;
}
/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
  background-color: #867979;
  background-image: url("image14.jpg");
  color: #ffbf00;
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
  padding: 150px;
  text-align: center;
background-color: rgb(105, 148, 175);
 background-image: url("image15.jpg");
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
#main1 {
  margin: auto;
  width: 220px;
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</style>
</head>
<body>
<div class="header">
  <h1>Welcome! Please sign in</h1>
</div>
<div class="navbar">
  <a href="dashBord.jsp" style="color:#ff8000;">HOME</a>
</div>
<div id="main1">
 <div  id="#mylogin">
 
  <div>
    <br />
    <form action="login.jsp" method="post">
        <br />Email:<input type="text" name="email" /><br />
        <br /> Password:<input type="password" name="password" /><br />
        <br /> <input  type="submit" value="Login" />
        <button><a class="button" href="signUp.jsp"> Sign Up</a></button>
        
        <%
   // session.setAttribute("userEmail", request.getParameter("email"));
        %>
    </form>
</div>  
</div>  
</div> 
    
    <%--  <ul>
        <li><p>
                <b>Email:</b>
                <%= request.getParameter("email")%>
            </p></li>
        <li><p>
                <b>Password:</b>
                <%= request.getParameter("password")%>
            </p></li>
    </ul> --%>
    <% 
 
    String UserEmail=request.getParameter("email");
    String UserPassword = request.getParameter("password");
    
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "R?2nX3?6s";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully connected.<br/><br/>");
             
            Statement stmt = con.createStatement();
                        
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
          	int user_id=0;
          	boolean gotUser = false;
          	boolean attemptedLogin = false;
          	if(UserEmail != null || UserPassword != null){
          		attemptedLogin = true;
          	}
             while(rs.next()) {  
             	if(rs.getString(8).equals(UserEmail) && rs.getString(9).equals(UserPassword)){
	            	out.println(rs.getInt(1) + "<br/><br/>");         
	            	out.println(rs.getString(8) + "<br/><br/>");
	           		out.println(rs.getString(9) + "<br/><br/>");
	            	user_id = rs.getInt(1);  
	            	session.setAttribute("user_id", user_id);						//SET USER_ID THAT WILL BE USED THROUGH OUT THE PERSONAL EXPERIENCE
	            	session.setAttribute("dbPass", "R?2nX3?6s");						//CHANGE THE DATABASE PASSWORD HERE
	            	gotUser = true;
            		break;
                  }
              }
              if(gotUser && attemptedLogin){
	              ResultSet rs6 = stmt.executeQuery("SELECT * FROM employee ");
	              boolean isPatient = true;
	              while(rs6.next()) {  
	                  if(rs6.getInt(1)== user_id ){
	                      isPatient=false;
	                     break;
	                  }
	              } 
	              if(isPatient == true){
	                  response.sendRedirect("patient.jsp");        
	             }else {                
	                 response.sendRedirect("employee.jsp");  
	                 out.println("you are an not a patient");
	                 }
              }else if(gotUser == false && attemptedLogin){
            	  out.println("Invalid email or password");
              }
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception e){
    		if(e.getMessage() != "null")
    			out.println("SQL Exception Caught: " + e.getMessage());
    	}
    %>
<div class="footer">
 
</div>
</body>
</html>