

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
.ppointment {
  background-color:  #ffc680;
  border-left: 6px solid #FFA500;
}


</style>
</head>
<body>
<a href="login.jsp">Logout</a>  
    <h1>Patient Dashboard </h1>
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
      //  int patient_id=0;
        int user_id=0;
        
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
            out.println(db + " database successfully connected.<br/><br/>");
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            //find the patient id using the patient id
           ResultSet rs = stmt.executeQuery("SELECT * FROM user ");
          
            while(rs.next()) {  
                if(rs.getString(8).equals(useremail) ){
                    user_id= rs.getInt(1);       
                    first_name =rs.getString(2);
                    Last_name=rs.getString(3);
                   break;
                }
            } 
            
           
            
       

          ResultSet rs2 = stmt.executeQuery("SELECT * FROM patient ");
          
           while(rs2.next()) {  
               if(rs2.getInt(1) == user_id ){
                   //patient_id= rs2.getInt(1);       
                   diagnosis =  rs2.getString(2);
                  diagnosisDate =rs2.getDate(4);
         break;
               }
           } 
           
           
           ResultSet rs3 = stmt.executeQuery("SELECT * FROM patientMedicalHistory ");
           
           while(rs3.next()) {  
               if(rs3.getInt(2) == user_id ){
                    medications=rs3.getString(3);
                    allergies =rs3.getString(4);
                    diseases=rs3.getString(5);
                    symptoms =rs3.getString(6);
                    familyHistory=rs3.getString(7);
         break;
               }
           } 
           
   
           ResultSet rs4 = stmt.executeQuery("SELECT * FROM PatientHasAppointment ");
           
           while(rs4.next()) {  
               if(rs4.getInt(1) == user_id ){
                   appointment_id=rs4.getInt(2);
           break;
               }
           }
          
         
          /*  java.sql.Date appointmentDate = Date.valueOf("2000-01-01"); */
           
       ResultSet rs5 = stmt.executeQuery("SELECT * FROM appointment ");
           
           while(rs5.next()) {  
               if(rs5.getInt(1) == appointment_id ){
                   startTime=rs5.getString(2);
                   endtTime=rs5.getString(3);
                   appointmentDate = rs5.getString(4);
           break;
               }
           } 
       

        
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
    
 <div class="success">
  <p><strong>Hello!</strong> <%=first_name%> <%=Last_name%></p>
   <p><strong>your User_ID</strong> <%=user_id%></p>
</div>

 <div class="info">
  <p><strong>Medication History: </strong> <%=medications%></p>
   <p><strong>Allergies History:</strong> <%=allergies%></p>
    <p><strong>Diseases History: </strong> <%=diseases%></p>
   <p><strong>Symptoms History:</strong> <%=symptoms%></p>
    <p><strong>Family withHistory: </strong> <%=familyHistory%></p>
</div>

 <div class="danger">
  <p><strong>You are diagnosis with: </strong> <%=diagnosis%></p>
   <p><strong>Date: </strong> <%=diagnosisDate%></p>
</div>

 <div class="ppointment">
 <h4>Next Appointment</h4>
  <p><strong>Date: </strong> <%=appointmentDate%></p>
  <p><strong>time: </strong> <%=startTime %> - <%=endtTime%></p> 
</div>

    
</body>
</html>

