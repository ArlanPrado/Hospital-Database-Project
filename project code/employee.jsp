<%@ page import="java.sql.*"
	import="java.text.SimpleDateFormat"
	import="java.util.ArrayList"
%>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
<title>Employee</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 24%,#D3D3D3 24%,#92a8d1 50%,white 100%);
}

div {
  margin-bottom: 15px;
  padding: 4px 12px;
}

.success{
  background-color: #ddffdd;
  border-left: 6px solid #4CAF50;
}

.appointment {
  background-color:  #ffc680;
  border-left: 6px solid #FFA500;
}


</style>
</head>
<body>
<a href="login.jsp">Logout</a> 
    <h1>Employee Dashboard</h1>

	<div class="tab">
		<button class="tabLink" onclick="window.location.href='viewUpAppointments.jsp';">
			View Upcoming Appointments
		</button>
		<button class="tabLink" onclick="window.location.href='orderPrescriptions.jsp';">
			Order Prescriptions
		</button>
		<button class="tabLink" onclick="window.location.href='edit_e_profile.jsp';">
			Edit My Profile
		</button>
	</div>
    <hr>


 

    <% 
 
    	String useremail = session.getAttribute("userEmail").toString();
    	String dbStatus = "Error connecting to database";	//default error message
    
     	String db = "Hospital";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "rootpass";
        
        int user_id = 0;
        String first_name, last_name;
        String position;
        first_name = last_name = position = "";
        String hire_date = "";
        int salary = 0;
        
        String p_first, p_last;
        int room = 0;
        int p_id = 0;
        String start_time, end_time, app_date;
        p_first = p_last = start_time = end_time = app_date = "";
        
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm aa");
        SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd-yyyy");
        
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            dbStatus = (db + " database successfully connected.<br/><br/>");            
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
            while(rs.next()) {  
                if(rs.getString(8).equals(useremail) ){
                    user_id= rs.getInt(1);       
                    first_name =rs.getString(2);
                    last_name=rs.getString(3);
                   break;
                }
            }
            
            rs = stmt.executeQuery("SELECT * FROM employee");
            while(rs.next()){
            	if(rs.getInt(1) == user_id){
            		salary = rs.getInt(2);
            		position = rs.getString(3);
            		hire_date = sdf2.format(rs.getDate(4));
            		break;
            	}
            }
            
            rs = stmt.executeQuery("SELECT *" +
            		"FROM " + 
            		"(SELECT userID, firstName, lastName, room, start_time, end_time, appointment.date, employee.employeeID " +
            		"FROM user "  +
            		"JOIN patient ON " +
            		"patient.patientID = user.userID " +
            		"JOIN patienthasappointment ON " + 
            		"patienthasappointment.patientID = patient.patientID " +
            		"JOIN appointment ON " +
            		"appointment.appointmentID = patienthasappointment.appointmentID " +
            		"JOIN employeecreateappointment ON " +
            		"appointment.appointmentID = employeecreateappointment.appointmentID " +
            		"JOIN employee ON " +
            		"employee.employeeID = employeecreateappointment.employeeID) AS T " +
            		"WHERE T.employeeID = " + user_id +
            		" AND T.date >= CURDATE()" +
            		" AND T.start_time >= CURTIME()" +
            		" ORDER BY T.date ASC, T.start_time ASC LIMIT 1 ");
            while(rs.next()){
            	p_id = rs.getInt(1);
            	p_first = rs.getString(2);
            	p_last = rs.getString(3);
            	room = rs.getInt(4);
            	start_time = sdf.format(rs.getDate(5));
            	end_time = sdf.format(rs.getDate(6));
            	//start_time = rs.getDate(5).toString();
            	//end_time = rs.getDate(6).toString();
            	app_date = sdf2.format(rs.getDate(7));
            }
            
            //THIS IS FOR PATIENT LIST
            class PatientObj{
            	int p_id;
            	String p_first;
            	String p_last;
       			int p_room;
            }
            
            rs = stmt.executeQuery("SELECT userID, firstName, lastName, room" +
            		" FROM user" +
            		" JOIN patient ON userID = patientID" + 
            		" JOIN employeehaspatients ON patient.patientID = employeehaspatients.patientID" +
            		" WHERE employeeID = " + user_id);
            ArrayList<PatientObj> patientList = new ArrayList<PatientObj>();
            while(rs.next()){
            	PatientObj temp = new PatientObj();
            	temp.p_id = rs.getInt("userID");
            	temp.p_first = rs.getString("firstName");
            	temp.p_last = rs.getString("lastName");
            	temp.p_room = rs.getInt("room");
            	patientList.add(temp);
            }
        
            stmt.close();
            con.close();
        } catch(Exception e){
    		if(e.getMessage() != "null")
    			out.println(e.getMessage());
    	}
    %>
    
 <div class="success">
  <p><strong><%=position%> <%=first_name%> <%=last_name%></strong></p>
   <p><strong>ID: </strong> <%=user_id%></p>
   <p><strong>Salary: </strong> $<%=salary%></p>
   <p><strong>Hire Date: </strong> <%=hire_date%></p>
</div>

<div class="appointment">
<h4>Next Appointment</h4>
<p><strong><%=p_first%> <%=p_last%></strong> at room <%=room%></p>
<p><%=start_time%> - <%=end_time%> <%=app_date%></p>
</div>


<div class="dbstatus">
	<p><%=dbStatus%></p>
</div>
</body>
</html>
