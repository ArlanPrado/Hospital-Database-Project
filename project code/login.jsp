

<%@ page import="java.sql.*"%>
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
    String UserPassword = request.getParameter("password");
    
       
     String db = "hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "rootpass";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?serverTimezone=EST5EDT",user, password);
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
	            	session.setAttribute("user_id", user_id);
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
</body>
</html>
