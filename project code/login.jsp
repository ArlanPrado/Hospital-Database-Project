
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
  background-image: url("image/14.jpg");
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
   height: 30%;
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
  <h1>welcome please sign in</h1>
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
        <br /> <input  type="submit" value="login" />
        <button><a class="button" href="signUp.jsp"> SignUp</a></button>
        
        <%
   // session.setAttribute("userEmail", request.getParameter("email"));
        %>
    </form>
</div>  
</div>  
</div> 
<%--      <ul>
        <li><p>
                <b>Email:</b>
                <%= request.getParameter("email")%>
            </p></li>
        <li><p>
                <b>Password:</b>
                <%= request.getParameter("password")%>
            </p></li>
    </ul>  --%>


    <% 
 
    String UserEmail=request.getParameter("email");
    String UserPassword = request.getParameter("password");
    int user_id=0;
    boolean gotUser = false;
    boolean attemptedLogin = false;
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Iluvhim@123";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
           /*  out.println(db + " database successfully connected.<br/><br/>"); */
            
 
            Statement stmt = con.createStatement();
            
            
            ResultSet rs = stmt.executeQuery("SELECT userID,firstName,email FROM user where email = '"+UserEmail+"' AND password = '"+UserPassword+"'");
            if(UserEmail != null || UserPassword != null){
                attemptedLogin = true;
            }
            while(rs.next()) {  

           /*  out.println(rs.getInt("userID") + "<br/><br/>");         
            out.println(rs.getString("firstName") + "<br/><br/>");
            out.println(rs.getString("email") + "<br/><br/>"); */
            user_id = rs.getInt(1);   
            gotUser = true;

              }
              
              ResultSet rs6 = stmt.executeQuery("SELECT employeeID FROM employee where employeeID = '"+user_id+"'");
              boolean isPatient = true;
              while(rs6.next()) {  
                
                      isPatient=false;
                    
              } 
              if(isPatient == true ){
                  if(request.getParameter("email")!= null){
                  session.setAttribute("userEmail", request.getParameter("email"));
                  response.sendRedirect("patient.jsp");  
                  }else{ }
             }else {     
                 session.setAttribute("userEmail", request.getParameter("email"));
                 response.sendRedirect("employee.jsp");  
                 out.println("you are an not a patient");
                 }
              
              session.setAttribute("userID", user_id);
            rs.close();
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
