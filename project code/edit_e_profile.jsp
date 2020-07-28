<%@ page import="java.sql.*"
	import="java.text.SimpleDateFormat"
%>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
<title>Employee Profile</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
}
div {
  margin-bottom: 15px;
  padding: 4px 12px;
}
.container{
	margin: auto;
	width: 50%;
}
.e_info{
	margin: auto;
	background-color:  #F5EDF0;
	border: 6px solid #DCD5D8;
	
}
.edit_info{
	margin: auto;

}
.info{
	box-sizing:border-box;
	margin: auto;
	width:50%;
	float: left;
	background-color:  #F5EDF0;
	border: 6px solid #DCD5D8;
	position: relative;
}
.original_info{
	float: left;
	background-color:  #F5EDF0;
	border: 6px solid #DCD5D8;
	position: relative;

	
}
.input_text input{
	margin-left: 15em;
}
.input_text label{
	position:absolute;
}
.submit_button{
	margin: auto;
	width: 0%;
}



</style>
</head>
<body>
<h1>Employee Profile</h1>
<button onclick="window.location.href='employee.jsp';">
			Back to Dashboard
	</button>
<hr>
<%
	String dbStatus = "Error connecting to database";	//default error message

	String db = "Hospital";
	String user = "root";
	String password = "rootpass";
	
	int user_id = (int)session.getAttribute("user_id");
    String fname, lname, address, 
    	phone, birthDate, gender, email, pwd;
    
    String position, hireDate;
    int salary;
    
    salary = 0;
    pwd = fname = lname = address = phone = birthDate = gender = email = position = hireDate = "";
    
    boolean submitPressed = false;
    boolean confirmedChange = false;
    String tempGender, tempAddress, tempPhone, tempEmail, tempPwd1;
    tempGender = tempAddress = tempPhone = tempEmail = tempPwd1 = "";
    try {
        
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
        dbStatus = (db + " database successfully connected.<br/><br/>");            
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT * " +
        		" FROM user " + 
        		" JOIN employee ON employeeID = userID" +
        		" WHERE employeeID = '" + user_id + "'");
        
        while(rs.next()){
        	fname = rs.getString("firstName");
        	lname = rs.getString("lastName");
        	birthDate = rs.getString("dateOfBirth");
        	gender = rs.getString("gender");
        	phone = rs.getString("phoneNumber");
        	address = rs.getString("address");
        	email = rs.getString("email");
        	pwd = rs.getString("password");
        	position = rs.getString("position");
        	salary = rs.getInt("salary");
        	hireDate = rs.getDate("hireDate").toString();
        }
        %>
<div class="container">
<div class="e_info">
	<p><b>ID:</b> <%= user_id%></p>
	<p><b>Name:</b> <%= fname + " " + lname%></p>
	<p><b>Birth Date:</b> <%= birthDate%></p>
	<p><b>Gender:</b> <%= gender%></p>
	<p><b>Address:</b> <%= address%></p>
	<p><b>Phone:</b> <%= phone%></p>
	<p><b>Email:</b> <%= email%></p>
	<p><b>Position:</b> <%= position%></p>
	<p><b>Salary:</b> <%= salary%></p>
	<p><b>Hire Date:</b> <%= hireDate%></p>
</div>

 <div class="edit_info">
 	<div class="info">
	 <form action="edit_e_profile.jsp" method="post">
	 	<h3>Edit My Info</h3>
	 	<h4>General Information:</h4>
	 	<div class="input_text">
		<label for="gender">Gender:</label>
		<input type="text" name="gender">
		<br></br>
	 	<label for="address">Address:</label>
		<input type="text" name="address">
		<br></br>
		<label for="phone">Phone:</label>
		<input type="text" name="phone">
		<br></br>
		<label for="email">Email:</label>
		<input type="text" name="email">
		<br></br>
		<label for="pwd1">Password:</label>
		<input type="password" name="pwd1">
		<br>
		<label for="pwd2">Password Confirmation:</label>
		<input type="password" name="pwd2">
		<br></br>
		<h4>Employee Confirmation</h4>
		<label for="pwd">Current Password:</label>
		<input type="password" name="pwd" minlength="8">
		</div>
		<br></br>
		<div class="submit_button">
		<input type="submit" value="Submit" name="submit">
		</div>
	</form>
	</div>

        <%

        String pwdConfirm = request.getParameter("pwd");
        //If the parameter is not null, then assign it the value that was inputted, 
        //else assign it its original value
        if(request.getParameter("gender").length() != 0)
        	tempGender = request.getParameter("gender");
        else
        	tempGender = gender;
        
        if(request.getParameter("address").length() != 0)
        	tempAddress = request.getParameter("address");
        else
        	tempAddress = address;
        
        if(request.getParameter("phone").length() != 0)
        	tempPhone = request.getParameter("phone");
        else
        	tempPhone = phone;
        
        if(request.getParameter("email").length() != 0)
        	tempEmail = request.getParameter("email");
        else
        	tempEmail = email;
        
        if(request.getParameter("pwd1").length() != 0 && request.getParameter("pwd2").length() != 0){
        	if(request.getParameter("pwd1").equals(request.getParameter("pwd2"))){
        		tempPwd1 = request.getParameter("pwd1");
        	}else
        		tempPwd1 = pwd;
        }else
        	tempPwd1 = pwd;
        
        String check = request.getParameter("submit");
        if(check != null && check.equals("Submit")){
        	submitPressed = true;
	        if(pwd.equals(pwdConfirm)){
	        	confirmedChange = true;
	        	stmt.execute("UPDATE user" +
	        			" SET gender = '" + tempGender + "'," + 
		        			" address = '" + tempAddress + "'," + 
		        			" phoneNumber = '" + tempPhone + "'," +  
		        			" email = '" + tempEmail + "'," + 
		        			" password = '" + tempPwd1 + "'" + 
	        			" WHERE userID = '" + user_id + "';");
	        }else{
	        	confirmedChange = false;
	        }
        }
       
     }catch(Exception e){
    	if(e.getMessage() != "null")
			out.println("Exception Caught: " + e.getMessage());
    }
%>
	<div class="info">
	<%
	if(submitPressed){
		if(confirmedChange){
			submitPressed = confirmedChange = false;
			%>
			<div class=new_text>
			<h3>Changes made</h3>
			<label><b>Gender:</b> <%= tempGender%></label>
			<br></br>
			<label><b>Address:</b> <%= tempAddress%></label>
			<br></br>
			<label><b>Phone:</b> <%= tempPhone%></label>
			<br></br>
			<label><b>Email:</b> <%= tempEmail%></label>
			<br></br>
			<label><b>Password:</b> <%=tempPwd1 %></label>
			</div>
	<% }else{%>
		<h4>Confirmation not valid</h4>
	<%} 
	}%>
</div>
</div>
</div>
<%-- 
<div class="updated_info">
	<%
	if(submitPressed){
		if(confirmedChange){
			submitPressed = confirmedChange = false;
			%>
			<h4>Changes made</h4>
			<p><b>Gender:</b> <%= tempGender%></p>
			<p><b>Address:</b> <%= tempAddress%></p>
			<p><b>Phone:</b> <%= tempPhone%></p>
			<p><b>Email:</b> <%= tempEmail%></p>
			<p><b>Password:</b> <%=tempPwd1 %></p>
	<% }else{%>
		<h4>Confirmation not valid</h4>
	<%} 
	}%>
</div>
--%>
</body>
</html>