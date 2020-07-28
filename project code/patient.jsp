

<%@ page import="java.sql.*"%>

<html>
<head>
<title>Patient</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
}
div {
  margin-bottom: 15px;
  padding: 4px 12px;
}

.danger {
  background-color: #ffdddd;
  border-left: 6px solid #f44336;
}

.success {
  background-color: #ddffdd;
  border-left: 6px solid #4CAF50;
}

.info {
  background-color: #e7f3fe;
  border-left: 6px solid #2196F3;
}


.warning {
  background-color: #ffffcc;
  border-left: 6px solid #ffeb3b;
}
.appointment {
  background-color:  #ffc680;
  border-left: 6px solid #FFA500;
}
.employee_list{
  background-color: #ffe0b1;
  border-left: 6px solid #655843;
}

</style>
</head>
<body>
<a href="login.jsp">Logout</a>  
    <h1>Patient Dashboard </h1>
    <hr />

	



 
 <% 
    
         
         
        String db = "Hospital";
 		String dbStatus = "Error connecting to database";	//default error message
        String user; // assumes database name is the same as username
          user = "root";
        String password = "rootpass";
        
        String first_name="";
        String last_name="";
        String diagnosis="";
        String condition="";
        int room = 0;
        int user_id= (int)session.getAttribute("user_id");
        
        String medications="";
        String allergies ="";
        String diseases="";
        String symptoms ="";
        String familyHistory="";
        
        int appointment_id=0;
        String startTime ="";
        String endtTime ="";
        String appointmentDate ="";
        
        
       java.sql.Date diagnosisDate = Date.valueOf("2000-01-01");
        
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            dbStatus = (db + " database successfully connected.<br/><br/>");
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            //find the patient id using the patient id
           ResultSet rs = stmt.executeQuery("SELECT * FROM user ");
          
            while(rs.next()) {  
                if(rs.getInt("userID") == user_id ){     
                    first_name =rs.getString("firstName");
                    last_name=rs.getString("lastName");
                   break;
                }
            } 
            
           
            
       

            rs = stmt.executeQuery("SELECT * FROM patient ");
          
           while(rs.next()) {  
               if(rs.getInt("patientID") == user_id){    
                   diagnosis =  rs.getString("diagnosis");
                   condition = rs.getString("patient_condition");
                  diagnosisDate =rs.getDate("admissionDate");
                  room = rs.getInt("room");
         break;
               }
           } 
           
           
           rs = stmt.executeQuery("SELECT * FROM patientMedicalHistory ");
           
           while(rs.next()) {  
               if(rs.getInt("patientID") == user_id ){
                    medications=rs.getString("medications");
                    allergies =rs.getString("allergies");
                    diseases=rs.getString("diseases");
                    symptoms =rs.getString("symptoms");
                    familyHistory=rs.getString("familyHistory");
         break;
               }
           } 
           
   
           rs = stmt.executeQuery("SELECT * FROM PatientHasAppointment ");
           
           while(rs.next()) {  
               if(rs.getInt("patientID") == user_id ){
                   appointment_id=rs.getInt("appointmentID");
           break;
               }
           }
          
         
          /*  java.sql.Date appointmentDate = Date.valueOf("2000-01-01"); */
           
       rs = stmt.executeQuery("SELECT * FROM appointment ");
           
           while(rs.next()) {  
               if(rs.getInt("appointmentID") == appointment_id ){
                   startTime=rs.getString("start_time");
                   endtTime=rs.getString("end_time");
                   appointmentDate = rs.getString("date");
           break;
               }
           } 
       
            
    %>
    
 <div class="success">
  <p><strong><%=first_name%> <%=last_name%></strong></p>
   <p><strong>ID: </strong> <%=user_id%></p>
   <p><strong>Room: </strong> <%=room%></p>
</div>

 <div class="appointment">
 <h4>Next Appointment</h4>
  <p><strong>Date: </strong> <%=appointmentDate%></p>
  <p><strong>time: </strong> <%=startTime %> - <%=endtTime%></p> 
</div>

 <div class="danger">
  <p><strong>Diagnosis: </strong> <%=diagnosis%></p>
  <p><strong>Patient Status: </strong> <%=condition %></p>
   <p><strong>Admission Date: </strong> <%=diagnosisDate%></p>
</div> 

 <div class="info">
  <p><strong>Medication History: </strong> <%=medications%></p>
   <p><strong>Allergies History:</strong> <%=allergies%></p>
    <p><strong>Diseases History: </strong> <%=diseases%></p>
   <p><strong>Symptoms History:</strong> <%=symptoms%></p>
    <p><strong>Family History: </strong> <%=familyHistory%></p>
</div>

<div class="employee_list">
	<h4>Employee List</h4>
	<%
		rs = stmt.executeQuery("SELECT userID, position, firstName, lastName" +
        		" FROM user" +
        		" JOIN employee ON userID = employeeID" + 
        		" JOIN employeehaspatients ON employee.employeeID = employeehaspatients.employeeID" +
        		" WHERE patientID = " + user_id);
	%>
	<table border=1 align=top style="text-align:center">
	<thead>
	        	<tr>
	        		<th>Employee ID</th>
	        		<th>Position</th>
	        		<th>Name</th>       		
	        	<tr>
	</thead>
	<tbody>
	<%
		while(rs.next()){
			%>
			<tr>
				<td><%= rs.getInt("userID") %></td>
				<td><%= rs.getString("position") %></td>
				<td><%= rs.getString("firstName") + " " + rs.getString("lastName") %></td>
			</tr>
			<% 
		}
	%>
	</tbody>
	</table>
</div>
<%
	stmt.close();
	con.close();
	} catch(SQLException e) { 
	out.println("SQLException caught: " + e.getMessage()); 
	}
%>
<div class="dbstatus">
	<p><%=dbStatus%></p>
</div>



    
</body>
</html>

