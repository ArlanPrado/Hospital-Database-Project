

<%@ page import="java.sql.*"%>
<%@ include file="index.jsp"%>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
<title>SignIn</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 24%,#D3D3D3 24%,#92a8d1 50%,white 100%);
}
#mylogin {
  align-self: center;
}

#main {
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

div {
  width: 220px;
  height: 150px;
  background-color: #92a8d1;
  position: relative;
  animation-name: example;
  animation-duration: 2s;
  animation-iteration-count: 1;
}

@keyframes example {
  0%   {background-color:red; left:0px; top:0px;}

  50%  {background-color:blue; left:200px; top:200px;}
 
  100% {background-color:red; left:0px; top:0px;}
}

</style>
</head>
<body>
	<h1>Hospital Management System</h1>

	<hr />

	<%-- <%  
String profile_msg=(String)request.getAttribute("profile_msg");  
if(profile_msg!=null){  
out.print(profile_msg);  
}  
String login_msg=(String)request.getAttribute("login_msg");  
if(login_msg!=null){  
out.print(login_msg);  
}  
 %> --%>

 <div id="main">
 <div  id="#mylogin">
 
  <div>
	<br />
	<form action="login.jsp" method="post">
		<br />Email:<input type="text" name="email" /><br />
		<br /> Password:<input type="password" name="password" /><br />
		<br /> <input  type="submit" value="login" />
		<button><a class="button" href="signUp.jsp"> SignUp</a></button>
		
		<%
    session.setAttribute("userEmail", request.getParameter("email"));
        %>
	</form>
</div>  
</div>  
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
            
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
              while(rs.next()) {  
                  if(rs.getString(6).equals(UserEmail) && rs.getString(7).equals(USerPassword)){
                     
            out.println(rs.getString(6) + "<br/><br/>");
            out.println(rs.getString(7) + "<br/><br/>");
            response.sendRedirect("patient.jsp");
            break;
                  }
              }
           
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>