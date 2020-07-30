
<%@ page import="java.sql.*"%>

<html>
<head>
<title>Patient Information</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
 background-image: url("image17.jpg");
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


.profileInfo {
  width: 450px;
  height: 400px;
  border: 6px solid #60B9FB;
  background-color: #E0F2FF;
}


</style>
</head>
<body>
    <h1>Patient Information</h1>
    <button><a class="button" href="employee.jsp">Back To Dashboard</a></button>
  	<button><a class="button" href="patientSearch.jsp">Back To Patient Search</a></button>
    <hr />


  <%String patientID = session.getAttribute("patientIDSearch").toString(); %>
 
 <% 
 
 String db = "Hospital";
 String user; // assumes database name is the same as username
   user = "root";
 String password = session.getAttribute("dbPass").toString();
 
 //int user_id=0;
 //String userId = "";
 String firstName = "";
 String lastName = "";
 String diagnosis = "";
 String room = "";
 String admissionDate = "";
 String medications = "";
 String allergies = "";
 String diseases = "";
 String symptoms = "";
 String familyHistory = "";
 
 try {
     
     java.sql.Connection con; 
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
     Statement stmt = con.createStatement();
     
     java.util.Date now = new java.util.Date();
     java.sql.Date sqlDate = new java.sql.Date(now.getTime());
     //find the patient id using the patient id
     ResultSet rs = stmt.executeQuery("SELECT * FROM user;");
   
     while(rs.next()) {  
         if(rs.getString(1).equals(patientID) ){
        	 firstName = rs.getString(2);
             lastName = rs.getString(3);
            break;
         }
     } 
     
     ResultSet rs2 = stmt.executeQuery("SELECT * FROM patient;");
     
     while(rs2.next()) {  
         if(rs2.getString(1).equals(patientID) ){
        	 diagnosis = rs2.getString(2);
        	 room = rs2.getString(3);
             admissionDate = rs2.getString(4);
            break;
         }
     } 
     
 	ResultSet rs3 = stmt.executeQuery("SELECT * FROM patientMedicalHistory;");
     
     while(rs3.next()) {  
         if(rs3.getString(2).equals(patientID) ){
        	 medications = rs3.getString(3);
        	 allergies = rs3.getString(4);
        	 diseases = rs3.getString(5);
        	 symptoms = rs3.getString(6);
        	 familyHistory = rs3.getString(7);
            break;
         }
     } 
     
     stmt.close();
     con.close();
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
%>


<div class="profileInfo">
 <p><strong>Patient ID: </strong> <%=patientID%></p>
 <p><strong>Patient: </strong> <%=firstName%> <%=lastName%></p>
 <p><strong>Diagnosis: </strong> <%=diagnosis%></p>
 <p><strong>Room: </strong> <%=room%></p>
 <p><strong>Admission Date: </strong> <%=admissionDate%></p>
 <p><strong>Medications: </strong> <%=medications%></p>
 <p><strong>Allergies: </strong> <%=allergies%></p>
 <p><strong>Diseases: </strong> <%=diseases%></p>
 <p><strong>Symptoms: </strong> <%=symptoms%></p>
 <p><strong>Family History: </strong> <%=familyHistory%></p>
 <button><a class="button" href="viewPatientNotes.jsp">View Notes</a></button>
</div>

 
</body>
</html>
