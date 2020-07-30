
<%@ page import="java.sql.*"
	     import="java.util.*"
    import="java.text.SimpleDateFormat"
    import="java.util.ArrayList"
    import="org.joda.time.format.*"
     import="org.joda.time.*"
%>
<a href="dashBord.jsp"><button>Home</button> </a>
<html>
<head>
<title>Employee</title>
<link rel="stylesheet" type="text/css" href="css/basic.css"/>
<style type="text/css">
body {
	background: linear-gradient(to bottom, #92a8d1 10%, #92a8d1 20%, #D3D3D3 20%,
		#92a8d1 50%, white 100%);
		 background-image: url("image8.jpg");
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
.employeeInfo{
	background-color: #ddffdd;
  	border-left: 6px solid #4CAF50;
}
.appointment{
	background-color: #FFE4B3;
	border-left: 6px solid #FFA500;
}

.options{
	background-color: #E1E3FF;
	border-left: 6px solid #6A71FF;
}
<%--
.note {
  background-color: #FFD7D7;
  border-left: 6px solid #FF4242;
}

.patientList {
  background-color: #E1E3FF;
  border-left: 6px solid #6A71FF;
}

.patientSearch {
  background-color: #FFFFE1;
  border-left: 6px solid #FFFF66;
}

.addEmployee {
  background-color: #D6FFEC;
  border-left: 6px solid #48F9A8;
}
--%>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 10% auto;
  padding: 10px;
  width: 70%;
}

@keyframes example {
  0%   {background-color:red; left:0px; top:0px;}

  50%  {background-color:blue; left:200px; top:200px;}
 
  100% {background-color:red; left:0px; top:0px;}

.employeeInfo{
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
<button onclick="window.location.href='login.jsp';">
            Log Out
    </button>
    <h1 style="color:white;">Employee Dashboard</h1>
    <div class="tab">
        <button class="tabLink" onclick="window.location.href='viewUpAppointments.jsp';">
            View Upcoming Appointments
        </button>
        <button class="tabLink" onclick="window.location.href='orderPrescriptions.jsp';">
            Order Prescriptions
        </button>
        <button class="tabLink" onclick="window.location.href='employeeAppointment.jsp';">
            Create Appointments
        </button>
        <button class="tabLink" onclick="window.location.href='patientSearch.jsp';">
            Patient Search
        </button>
        <button class="tabLink" onclick="window.location.href='edit_e_profile.jsp';">
            My Profile
        </button>
    </div>
    <hr>
 

    <% 

        String dbStatus = "Error connecting to database";   //default error message
    
        String db = "Hospital";
        String user = "root";
        String password = session.getAttribute("dbPass").toString();
        
        int user_id = (int)session.getAttribute("user_id");
        String first_name, last_name;
        String position;
        int salary = 0;
        first_name = last_name = position = "";
        String hire_date = "";
        
        String p_first, p_last;
        int room = -1;
        int p_id = -1;
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
                if(rs.getInt("userID") == user_id){;       
                    first_name =rs.getString("firstName");
                    last_name=rs.getString("lastName");
                   break;
                }
            }
            
            rs = stmt.executeQuery("SELECT * FROM employee");
            while(rs.next()){
                if(rs.getInt("employeeID") == user_id){
                    salary = rs.getInt("salary");
                    position = rs.getString("position");
                    hire_date = sdf2.format(rs.getDate("hireDate"));
                    break;
                }
            }
			%>
          
<div class="employeeInfo">
    <p><strong><%=position%> <%=first_name%> <%=last_name%></strong></p>
       <p><strong>ID: </strong> <%=user_id%></p>
       <p><strong>Salary: </strong> $<%=salary%></p>
       <p><strong>Hire Date: </strong> <%=hire_date%></p>
</div>         
          <%
          //THERE IS A PROBLEM WITH DISPLAYING TIME, IT DOES NOT MATCH WITH THE MYSQL
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
                  "JOIN employeecreatesappointment ON " +
                  "appointment.appointmentID = employeecreatesappointment.appointmentID " +
                  "JOIN employee ON " +
                  "employee.employeeID = employeecreatesappointment.employeeID) AS T " +
                  "WHERE T.employeeID = " + user_id +
                  " AND T.date >= CURDATE()" +
                  " ORDER BY T.date ASC, T.start_time ASC LIMIT 1 ");
          while(rs.next()){
              p_id = rs.getInt(1);
              p_first = rs.getString(2);
              p_last = rs.getString(3);
              room = rs.getInt(4);
              start_time = rs.getString(5);
              end_time = rs.getString(6);
              app_date = rs.getString("date");
          }
          
          %>
<div class="appointment">
          <%if(room != -1){ %>
  <h4>Next Appointment</h4>
      <p><strong><%=p_first%> <%=p_last%></strong> at room <%=room%></p>
      <p><%=start_time%> - <%=end_time%> <%=app_date%></p>
          <%}else{ %>
  <h4> No Upcoming Appointments</h4>
          <%} %>
</div>     

        <%
            stmt.close();
            con.close();
        } catch(Exception e){
            if(e.getMessage() != "null")
                out.println(e.getMessage());
        }
    %>
    
<div class="options"> 
 <h4>Options</h4>       
<div class="note">
 <button id="noteButton">Write Note</button>
</div>

<%
            String patientID = request.getParameter("patientID");
		    String details = request.getParameter("details");
		    String date = request.getParameter("date");
		    int noteID = 0;
		    boolean noteFormCompleted = false;
   
        	try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            
            if (patientID != null && details != null && date != null) {
            	noteFormCompleted = true;
            }
            if (noteFormCompleted) {
            String insertSql = "INSERT INTO note (detail, date, CREATED_DATE) "
                    + "VALUES ('" + details + "', '" + date + "','" + sqlDate + "')";
            
            stmt.execute(insertSql);   
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM note");
            
            while(rs.next()) {  
                if(rs.getString(2).equals(details) && rs.getString(3).equals(date)){
                    noteID= rs.getInt(1);       
                   break;
                }
            } 
            
            insertSql = "INSERT INTO employeeWritesNote (employeeID, noteID)"
            		+ "VALUES ('" + user_id + "','" + noteID + "')";
            
			stmt.execute(insertSql);   
			
			insertSql = "INSERT INTO patientHasNote (patientID, noteID)"
            		+ "VALUES ('" + patientID + "','" + noteID + "')";
            
			stmt.execute(insertSql);   
            }
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
<%-- NOTE MODEL START --%>
<div id="noteModal" class="modal">
<div class="modal-content">
    <form action="employee.jsp" method="post">
    <br /><strong> New Note:</strong><br/>
    <br /> Patient ID: <input type="text" name="patientID" required/><br />
    <br /> Note Details: <input type="text" name="details" required/><br />
    <br /> Date: <input type="date" name="date" required/><br />
    <br /> <input type="submit" value="Submit" />
     <button><a class="button" href="employee.jsp">Back</a></button>
    </form>
    </div>
</div>

<script>
var noteModal = document.getElementById("noteModal");
var noteButton = document.getElementById("noteButton");
noteButton.onclick = function() {
  noteModal.style.display = "block";
}
</script>

<%-- NOTE MODEL END --%>
<%-- PATIENT LIST START --%>
<div class="patientList">
 <button id="patientListButton">Current Patients</button>
</div>

 <%
 ArrayList<String> patientIDs = new ArrayList<String>();
 ArrayList<ArrayList<String>> patients = new ArrayList<ArrayList<String>>();
 
 try {
     
     java.sql.Connection con; 
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
     Statement stmt = con.createStatement();
     
     java.util.Date now = new java.util.Date();
     java.sql.Date sqlDate = new java.sql.Date(now.getTime());
     //find the patient id using the patient id
     
     ResultSet rs = stmt.executeQuery("SELECT * FROM user");
   
     
     ResultSet rs2 = stmt.executeQuery("SELECT * FROM employeeHasPatient");
     
     while(rs2.next()) {  
         if(rs2.getInt("employeeID") == user_id){
        	 patientIDs.add(rs2.getString("patientID"));
            break;
         }
     }
     
	 ResultSet rs3 = stmt.executeQuery("SELECT * FROM user");
     
     while(rs3.next()) {  
    	 for (String ID : patientIDs) {
        	 if(rs3.getString(1).equals(ID)){
        		 ArrayList<String> patient = new ArrayList<String>();
        		 patient.add(rs3.getString(1));
        		 patient.add(rs3.getString(2));
        		 patient.add(rs3.getString(3));
        		 patients.add(patient);
           		break;
         	 }
    	 }
     }
     
     stmt.close();
     con.close();
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
 
%>
<%-- PATIENT LIST END--%>
<%-- PATIENT LIST MODAL START --%>
<div id="patientListModal" class="modal">
<div class="modal-content">
    <p><strong>Patients: </strong></p>
 	<%for (int i = 0; i < patients.size(); i++) {
	 out.println("Patient ID: " + patients.get(i).get(0) + "\n"); %> <br>
	 <%out.println("Name: " + patients.get(i).get(1) + " " + patients.get(i).get(2) + "\n"); %> <br><br> <%
 }
 %>
 <button><a class="button" href="employee.jsp">Back</a></button>
 </div>
 </div>

<script>
var patientListModal = document.getElementById("patientListModal");
var patientListButton = document.getElementById("patientListButton");
patientListButton.onclick = function() {
	patientListModal.style.display = "block";
}
</script>
<%-- PATIENT LIST MODAL END --%>







<%-- ADD EMPLOYEE START --%>
<div class="addEmployee">
 <button id="addEmployeeButton">Hire Employee</button>
</div>

 <% 
    String employeeID = request.getParameter("userID");
    String salaryS = request.getParameter("salary");
    String positionS = request.getParameter("position");
    String hireDate = request.getParameter("hireDate");
    boolean employeeFormCompleted = false;
 
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            
            if (employeeID != null && salaryS != null && salaryS != null && hireDate != null) {
            	employeeFormCompleted = true;
            }
            String insertSql = "INSERT INTO employee (employeeID, salary, position, hireDate, CREATED_DATE) "
                    + "VALUES ('" + employeeID + "', '" + salaryS + "','" + positionS + "','" + hireDate + "','" + sqlDate + "')";
            if (employeeFormCompleted) {
            	stmt.execute(insertSql);   
            } stmt.close();
            con.close();
        } catch(Exception e){
            if(e.getMessage() != "null")
                out.println(e.getMessage());
        }
%>
<%-- ADD EMPLOYEE END --%>

  <%-- ADD EMPLOYEE MODAL START --%>
<div id="addEmployeeModal" class="modal">
<div class="modal-content">
    <form action="employee.jsp" method="post">
    <br /><strong> New Employee:</strong><br/>
    <br /> User ID: <input type="text" name="userID" required/><br />
    <br /> Salary: <input type="text" name="salary" required/><br />
    <br /> Position: <input type="text" name="position" required/><br />
    <br /> Hire Date: <input type="date" name="hireDate" required/><br />
    <br /> <input type="submit" value="Submit" />
     <button><a class="button" href="employee.jsp">Back</a></button>
    </form>
    </div>
</div>

<script>
var addEmployeeModal = document.getElementById("addEmployeeModal");
var addEmployeeButton = document.getElementById("addEmployeeButton");
addEmployeeButton.onclick = function() {
addEmployeeModal.style.display = "block";
}
</script>
  <%-- ADD EMPLOYEE MODAL END --%>

<%--<div class="dbstatus">
    <p><%=dbStatus%></p> --%>
</div>
</div>
</body>
</html>