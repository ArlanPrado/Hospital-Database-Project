

<%@ page import="java.sql.*"
	     import="java.util.*"%>
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

div {
  margin-bottom: 15px;
  padding: 4px 12px;
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

/*
div {
  width: 220px;
  height: 150px;
  background-color: #92a8d1;
  position: relative;
  animation-name: example;
  animation-duration: 2s;
  animation-iteration-count: 1;
}
*/
@keyframes example {
  0%   {background-color:red; left:0px; top:0px;}

  50%  {background-color:blue; left:200px; top:200px;}
 
  100% {background-color:red; left:0px; top:0px;}
}

</style>
</head>
<body>
<a href="login.jsp">Logout</a>  
    <h1>Employee Dashboard</h1>

    <hr />
    <%  String userID = session.getAttribute("userID").toString();
 
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "R?2nX3?6s";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password); 
            Statement stmt = con.createStatement();
         
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    
<div class="note">
 <h4>Write Note</h4>
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
            		+ "VALUES ('" + userID + "','" + noteID + "')";
            
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



<div class="patientList">
 <h4>Current Patients</h4>
 <button id="patientListButton">Patient List</button>
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
   
     while(rs.next()) {  
         if(rs.getString(1).equals(userID) ){
        	 userID = rs.getString(1);
            break;
         }
     } 
     
     ResultSet rs2 = stmt.executeQuery("SELECT * FROM employeeHasPatient");
     
     while(rs2.next()) {  
         if(rs2.getString(2).equals(userID) ){
        	 patientIDs.add(rs2.getString(1));
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




<div class="patientSearch">
 <h4>Patient Search</h4>
  <button><a class="button" href="patientSearch.jsp">Search</a></button>
</div>




<div class="addEmployee">
 <h4>Hire Employee</h4>
 <button id="addEmployeeButton">Add Employee</button>
</div>

 <% 
    String employeeID = request.getParameter("userID");
    String salary = request.getParameter("salary");
    String position = request.getParameter("position");
    String hireDate = request.getParameter("hireDate");
    boolean employeeFormCompleted = false;
 
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            
            if (employeeID != null && salary != null && position != null && hireDate != null) {
            	employeeFormCompleted = true;
            }
            String insertSql = "INSERT INTO employee (employeeID, salary, position, hireDate, CREATED_DATE) "
                    + "VALUES ('" + employeeID + "', '" + salary + "','" + position + "','" + hireDate + "','" + sqlDate + "')";
            if (employeeFormCompleted) {
            	stmt.execute(insertSql);   
            }
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    
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

</body>
</html>
