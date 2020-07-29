<%@ page import="java.sql.*"
		 import="java.util.*"%>
<html>
<head>
<title>Patient Search</title>
<link rel="stylesheet" type="text/css" href="css/basic.css"/>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 13%,#D3D3D3 13%,#92a8d1 50%,white 100%);
}
#mylogin {
  align-self: center;
}

#main {
  margin: auto;
  width: 290px;
  height: 200px;
  border: 6px solid #D17CFF;
  background-color: #F8EBFF;
  padding: 10px;
  display: flex;
}

.viewPatientInfo {
  margin: auto;
  width: 290px;
  height: 120px;
  border: 6px solid #D17CFF;
  background-color: #F8EBFF;
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

</style>
</head>
<body>
    <h1>Patient Search</h1>
    <button><a class="button" href="employee.jsp">Back</a></button>
    <hr />
    
     <%String userID = session.getAttribute("user_id").toString(); %>

<div id="main">
    <br />
    <form action="patientSearch.jsp" method="post">
    <br /><strong> Patient Search:</strong><br/>
    <br /> Patient ID: <input type="text" name="patientID" /><br />
    <br /> First Name: <input type="text" name="firstName" /><br />
    <br /> Last Name: <input type="text" name="lastName" /><br />
    <br /> <input type="submit" value="Submit" />
    </form>
</div> 
    <% 
    String patientIDInput = request.getParameter("patientID");
    String firstNameInput = request.getParameter("firstName");
    String lastNameInput = request.getParameter("lastName");
    
    String employeeID = "";
    
    //Single Result
    //String patientID = "";
    //String firstName = "";
    //String lastName = "";
  
    //Multiple Results
    ArrayList<ArrayList<String>> possiblePatientsByFirstName = new ArrayList<ArrayList<String>>();
    
    ArrayList<ArrayList<String>> possiblePatientsByLastName = new ArrayList<ArrayList<String>>();
 
    ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
    
    boolean formCompleted = false;
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
          String password = session.getAttribute("dbPass").toString();
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            
           if (patientIDInput != null || firstNameInput != null || lastNameInput != null) {
            	formCompleted = true;
            }
            
            if (patientIDInput != null) {
            	ResultSet rs2 = stmt.executeQuery("SELECT * FROM user");
            	while(rs2.next()) {  
                	if(rs2.getString(1).equals(patientIDInput) ){
                   		ArrayList<String> patient = new ArrayList<String>();
                		patient.add(patientIDInput);	
              	 		patient.add(rs2.getString(2));
              	 		patient.add(rs2.getString(3));
              	 		results.add(patient);
            		}
         	    } 
            }
            
            if (firstNameInput != null) {
            	ResultSet rs3 = stmt.executeQuery("SELECT * FROM user");
            	while(rs3.next()) {  
                	if(rs3.getString(2).equals(firstNameInput) ){
                    ArrayList<String> possiblePatientByFirstName = new ArrayList<String>();
                    possiblePatientByFirstName.add(rs3.getString(1));
                    possiblePatientByFirstName.add(rs3.getString(2));
                    possiblePatientByFirstName.add(rs3.getString(3));
                    possiblePatientsByFirstName.add(possiblePatientByFirstName);
            		}
         	    } 
            	
            	for (int i = 0; i < possiblePatientsByFirstName.size(); i++) {
            		ResultSet rs4 = stmt.executeQuery("SELECT * FROM patient");
                	while(rs4.next()) {  
                    	if(rs4.getString(1).equals(possiblePatientsByFirstName.get(i).get(0))){
                        results.add(possiblePatientsByFirstName.get(i));
                		}
             	    } 
            	}
            }
            
            if (lastNameInput != null) {
            	ResultSet rs5 = stmt.executeQuery("SELECT * FROM user");
            	while(rs5.next()) {  
                	if(rs5.getString(3).equals(lastNameInput) ){
                    ArrayList<String> possiblePatientByLastName = new ArrayList<String>();
                    possiblePatientByLastName.add(rs5.getString(1));
                    possiblePatientByLastName.add(rs5.getString(2));
                    possiblePatientByLastName.add(rs5.getString(3));
                    possiblePatientsByLastName.add(possiblePatientByLastName);
            		}
         	    } 
            	
            	for (int i = 0; i < possiblePatientsByLastName.size(); i++) {
            		ResultSet rs6 = stmt.executeQuery("SELECT * FROM patient");
                	while(rs6.next()) {  
                    	if(rs6.getString(1).equals(possiblePatientsByLastName.get(i).get(0))){
                        results.add(possiblePatientsByLastName.get(i));
                		}
             	    } 
            	}
            }
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    
<div class="patientSearch">
 <p><strong>Search Results:</strong></p>
 <%if (results.isEmpty() && formCompleted) {
 	out.println("No results");
 }
 for (int i = 0; i < results.size(); i++) {
	out.println("Patient ID: " + results.get(i).get(0) + "\n"); %> <br>
    <%out.println("Name: " + results.get(i).get(1) + " " + results.get(i).get(2) + "\n"); %> <br><br> <%
 }%>
</div>

<div class="viewPatientInfo">
	<form>
    <br /><strong> View Patient Info:</strong><br/>
    <br /> Patient ID: <input type="text" name="patientIDPatientInfo" /><br />
    <br /> <input type="submit" value="Submit" />
    </form>
</div>

		<%
    session.setAttribute("patientIDSearch", request.getParameter("patientIDPatientInfo"));
        %>

	<%
 	String patientID = request.getParameter("patientIDPatientInfo");
	
	boolean formCompleted2 = false;
	boolean canViewPatientInfo = false;
	
	if (patientID != null) {
   	 formCompleted2 = true;
    }
	
	if (formCompleted2) {
     try {
         
         java.sql.Connection con; 
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
         //out.println(db + " database successfully connected.<br/><br/>");
         Statement stmt = con.createStatement();
         
         java.util.Date now = new java.util.Date();
         java.sql.Date sqlDate = new java.sql.Date(now.getTime());
         
         
         
         ResultSet rs = stmt.executeQuery("SELECT * FROM user");
     	 while(rs.next()) {  
         	if(rs.getString(1).equals(userID) ){
       	 	employeeID = rs.getString(1);
      	      break;
     		}
  	     } 
         
         if (patientID != null) {
         	ResultSet rs2 = stmt.executeQuery("SELECT * FROM employeeHasPatient");
         	while(rs2.next()) {  
             	if(rs2.getString(1).equals(patientID)){
                    if (rs2.getString(2).equals(employeeID)) {
                    	canViewPatientInfo = true;
                    }
         		}
      	    } 
         }
         
         if (canViewPatientInfo == false && formCompleted2) {
        	 out.println("Patient " + patientID + " is not under your treatment! Cannot view patient information.<br/><br/>");
         } else if (formCompleted2){
        	 out.println("Patient " + patientID + " is under your treatment! Can view patient information.<br/><br/>");
        	 %>
        	 <div class="patientInfo">
   			  <button><a class="button" href="patientInfo.jsp">Go To Patient Info</a></button>
			 </div> <%
         }
         stmt.close();
         con.close();
     } catch(SQLException e) { 
         out.println("SQLException caught: " + e.getMessage()); 
     }
	}
	
	%>
    
</body>
</html>

