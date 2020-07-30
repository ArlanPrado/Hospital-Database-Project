

<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"

 import="java.text.SimpleDateFormat"
    import="java.util.ArrayList"
    import="org.joda.time.format.*"
     import="org.joda.time.*"%>

<html>
<head>
<title>Patient</title>
<style type="text/css">
body {
	background: linear-gradient(to bottom, #92a8d1 10%, #92a8d1 20%, #D3D3D3 20%,
		#92a8d1 50%, white 100%);
		 background-image: url("image/8.jpg");
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

.ppointment {
	background-color: #ffc680;
	border-left: 6px solid #FFA500;
}

body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
background-image: url("image/11.jpg");
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 20%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}


.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #e7f3fe;
  border-left: 6px solid #2196F3;
}
</style>
</head>
<body>
	<a href="login.jsp"><button>Logout</button></a>
	<h1 style="color:white;">Patient Dashboard</h1>
	<hr />





	<%String useremail = session.getAttribute("userEmail").toString(); %>

	<%
	    String db = "Hospital";
	        String user; // assumes database name is the same as username
	          user = "root";
	        String password = "Iluvhim@123";
	        
	        String first_name="";
	        String Last_name="";
	        String diagnosis="";
	        int patient_id=0;
	        //int user_id=0;
	        
	        String medications="";
	        String allergies ="";
	        String diseases="";
	        String symptoms ="";
	        String familyHistory="";
	        
	        int appointment_id=0;
	        String startTime ="";
	        String endtTime ="";
	        String appointmentDate ="";
	        
	        String note="";
	        int note_ID=0;
	      
	        boolean changInfo=false;
	       
	          ArrayList <Integer> al = new ArrayList<Integer>();
	   
	        java.sql.Date note_date = Date.valueOf("2000-01-01");
	       java.sql.Date diagnosisDate = Date.valueOf("2000-01-01");
	        
	        try {
	    
	    java.sql.Connection con; 
	    Class.forName("com.mysql.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
	    out.println(db + " database successfully connected.<br/><br/>");
	    Statement stmt = con.createStatement();
	    
	    java.util.Date now = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(now.getTime());
	    //find the patient id using the patient id
	           ResultSet rs = stmt.executeQuery("SELECT * FROM user ");
	           
	        while (rs.next()) {
	            if (rs.getString(8).equals(useremail)) {
	                patient_id = rs.getInt(1);
	                first_name = rs.getString(2);
	                Last_name = rs.getString(3);
	%>
	<div class="success">
		<p>
			<strong>Hello!</strong>
			<%=first_name%>
			<%=Last_name%></p>
		<p>
			<strong>your User_ID</strong>
			<%=patient_id%></p>
			 <!-- Trigger/Open The Modal -->
<button id="myBtn">Change your Information</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  Modal content
  <div class="modal-content">
   <form action="patient.jsp" method="post">
    <br /> Phone:<input type="number"  name="phone" placeholder="new or old phon number" required /><br />
    <br /> Address:<input type="text" name="address" placeholder="new or old Address" required/><br />
        <br /> Email:<input type="email" name="email" placeholder="new or old phon email"required/><br />
        <br /> <input type="submit" value="submit" />
     <button><a class="button" href="patient.jsp">Cancel</a></button> 
    </form>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script> 
	</div>

	<%
	
                   break;
                }
            } 
            String Phone=request.getParameter("phone");
            String Address=request.getParameter("address");
            String UserEmail=request.getParameter("email");
      if(request.getParameter("phone") != null || request.getParameter("address") != null
                               || request.getParameter("email") != null){
          String insertSql = "UPDATE user SET  phoneNumber = '"+Phone+"',"
                  +"address = '"+Address+"', email='"+UserEmail +"' WHERE userID='"+patient_id+"' ";
                      
                     stmt.execute(insertSql); 
           
          
      } 

            
          ResultSet rs2 = stmt.executeQuery("SELECT * FROM patient ");         
           while(rs2.next()) {  
               if(rs2.getInt(1) == patient_id ){
                   patient_id= rs2.getInt(1);       
                   diagnosis =  rs2.getString(2);
                  diagnosisDate =rs2.getDate(4);
                  session.setAttribute("id", request.getParameter("patient_id"));
                  %>
	<div class="danger">
		<p>
			<strong>You are diagnosis with: </strong>
			<%=diagnosis%></p>
		<p>
			<strong>Date: </strong>
			<%=diagnosisDate%></p>
	</div>

	<%    
	
         break;
               }
           } 
           
       
           
           
           
ResultSet rs8 = stmt.executeQuery("SELECT * FROM PatientHasPrescription");
           
           while(rs8.next()) {  
               
               if(rs8.getInt(1) == patient_id ){
                   note_ID=rs8.getInt(2);
                  // out.println(rs6.getInt(2));
                   al.add(rs8.getInt(2));   
                  // out.println(al.size());
               }            
           } 
           String recived="Yes";
           for(int i=0;i<al.size();i++) {         
       ResultSet rs9 = stmt.executeQuery("SELECT * FROM prescription");      
           while(rs9.next())
           {
               if(rs9.getInt(1) == al.get(i) ){    
                   
                   if(rs9.getInt(1) ==0){
                       recived ="No";  
                   }
               %>
    <div class="info">
    <h3>prescription detail</h3>
        <p>
            <strong>Name: </strong>
            <%=rs9.getString("medicationName")%></p>
        <p>
            <strong>Amount:</strong>
            <%=rs9.getString("totalAmount")%><br>
        </p>
        <p>
            <strong>Note date: </strong>
            <%=rs9.getString("receivedByPatient")%></p>
        <p>
            <strong>received:</strong>
            <%=recived%><br>
        </p>
        <p>
            <strong>frequency: </strong>
            <%=rs9.getString("frequency")%></p>

    </div>
    <%}}}
    
  al.clear();


 
           
           
         
           
           
           
           
           
           
           ResultSet rs3 = stmt.executeQuery("SELECT * FROM patientMedicalHistory ");
           
           while(rs3.next()) {  
               if(rs3.getInt(2) == patient_id ){
                    medications=rs3.getString(3);
                    allergies =rs3.getString(4);
                    diseases=rs3.getString(5);
                    symptoms =rs3.getString(6);
                    familyHistory=rs3.getString(7);
                    
                    %>
	<div class="warning">
		<p>
			<strong>Medication History: </strong>
			<%=medications%></p>
		<p>
			<strong>Allergies History:</strong>
			<%=allergies%></p>
		<p>
			<strong>Diseases History: </strong>
			<%=diseases%></p>
		<p>
			<strong>Symptoms History:</strong>
			<%=symptoms%></p>
		<p>
			<strong>Family withHistory: </strong>
			<%=familyHistory%></p>
	</div>

	<%
         break;
               }
           } 
           
   
           ResultSet rs4 = stmt.executeQuery("SELECT * FROM PatientHasAppointment ");
           
           while(rs4.next()) {  
               if(rs4.getInt(1) == patient_id ){
                   appointment_id=rs4.getInt(2);
           break;
               }
           }
          
         
          /*  java.sql.Date appointmentDate = Date.valueOf("2000-01-01"); */
           
       ResultSet rs5 = stmt.executeQuery("SELECT * FROM appointment");
           
           while(rs5.next()) {  
               if(rs5.getInt(1) == appointment_id ){
                   startTime=rs5.getString(2);
                   endtTime=rs5.getString(3);
                   appointmentDate = rs5.getString(4);
                   
                   %>
	<div class="ppointment">
		<h4>past and current Appointment</h4>
		<p>
			<strong>Date: </strong>
			<%=appointmentDate%></p>
		<p>
			<strong>time: </strong>
			<%=startTime %>
			-
			<%=endtTime%></p>
		<form action="appointment.jsp">
			<input type="submit" value="Create Appointment">
		</form>
	</div>

	<%
                   
                   
           break;
               }
           } 
           
        ResultSet rs6 = stmt.executeQuery("SELECT * FROM patientsHasNote");
           
           while(rs6.next()) {  
               
               if(rs6.getInt(1) == patient_id ){
                   note_ID=rs6.getInt(2);
                  // out.println(rs6.getInt(2));
                   al.add(rs6.getInt(2));   
                  // out.println(al.size());
               }            
           } 
           %>
           <p><h3>Doctors note:</h3></p>
           <%
           for(int i=0;i<al.size();i++) {         
       ResultSet rs7 = stmt.executeQuery("SELECT * FROM note");      
           while(rs7.next())
           {
               if(rs7.getInt(1) == al.get(i) ){
                   
               %>
    <button type="button" class="collapsible"><%=rs7.getString("date")%></button>
	<div class="content">
<%-- 		<p>
			<strong>Note date: </strong>
			<%=rs7.getString("date")%></p> --%>
		<p>
			<strong>note:</strong>
			<%=rs7.getString("detail")%><br>
		</p>

	</div>
	<%}}}%>



	<%
    /*        rs.close();
           rs2.close();
           rs3.close();
           rs4.close();
           rs5.close(); */
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>

<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</body>
</html>

