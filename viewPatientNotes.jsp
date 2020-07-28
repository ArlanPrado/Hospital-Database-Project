
<%@ page import="java.sql.*"
		 import="java.util.*"%>

<html>
<head>
<title>Patient Information</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
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


.notes {
  border: 6px solid #60B9FB;
  background-color: #E0F2FF;
}


</style>
</head>
<body>
    <h1>Patient Information</h1>
    <button><a class="button" href="employee.jsp">Back To Dashboard</a></button>
  	<button><a class="button" href="patientSearch.jsp">Back To Patient Search</a></button>
  	<button><a class="button" href="patientInfo.jsp">Back To Patient Info</a></button>
    <hr />


  <%String patientID = session.getAttribute("patientIDSearch").toString(); %>
 
 <% 
 
 String db = "Hospital";
 String user; // assumes database name is the same as username
   user = "root";
 String password = "R?2nX3?6s";
 
 //int user_id=0;
 //String userId = "";
 ArrayList<ArrayList<String>> notes = new ArrayList<ArrayList<String>>();
 //ArrayList<String> noteIDs = new ArrayList<String>();
 //ArrayList<String> details = new ArrayList<String>();
 //ArrayList<String> dates = new ArrayList<String>();

 try {
     
     java.sql.Connection con; 
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
     Statement stmt = con.createStatement();
     
     java.util.Date now = new java.util.Date();
     java.sql.Date sqlDate = new java.sql.Date(now.getTime());
     //find the patient id using the patient id
     ResultSet rs = stmt.executeQuery("SELECT * FROM patientHasNote;");
     
     while(rs.next()) {  
         if(rs.getString(1).equals(patientID) ){
        	 ArrayList<String> note = new ArrayList<String>();
        	 note.add(rs.getString(2));
        	 notes.add(note);
            break;
         }
     } 
     
 	ResultSet rs2 = stmt.executeQuery("SELECT * FROM note;");
     
     while(rs2.next()) {  
    	 for (int i = 0; i < notes.size(); i++) {
        	 if(rs2.getString(1).equals(notes.get(i).get(0)) ){
        		 notes.get(i).add(rs2.getString(2));
        		 notes.get(i).add(rs2.getString(3));
      	     }
    	 }
     } 
     stmt.close();
     con.close();
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
%>


<div class="notes">
 <p><strong>Notes: </strong></p>
 <%for (int i = 0; i < notes.size(); i++) {
	 out.println("Note ID: " + notes.get(i).get(0) + "\n"); %> <br>
	 <%out.println(notes.get(i).get(1) + "\n"); %> <br>
	 <%out.println("Date: " + notes.get(i).get(2) + "\n"); %> <br><br> <%
 }
 %>
</div>

 
</body>
</html>
