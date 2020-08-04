

<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.ParseException" %>

<html>
<head>
<title>appointment</title>

<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 100%,#92a8d1 5%,#D3D3D3 5%,#92a8d1 100%,white 100%);
 background-image: url("image9.jpg");
}
#mylogin {
  align-self: center;
}

#main {
  margin: auto;
  width: 320px;
  height: 180px;
  border: 3px solid #73AD21;
  padding: 10px;
  display: flex;
}
#main2 {
  margin: auto;
  width: 320px;
  height: 260px;
  border: 3px solid #73AD21;
  padding: 10px;
  display: flex;
}
#main3 {
  margin: left;
  width: 320px;
  height: 260px;
  border: 0px  #73AD21;
  padding: 10px;
  display: flex;
}
#main4 {
  margin: right;
  width: 320px;
  height: 260px;
  border: 0px  #73AD21;
  padding: 10px;
  display: flex;
}
#continer {
  margin: auto;
  width: 600px;
  height: 280px;
  border: 10px solid black;
  padding: 10px;
  display: flex;
}
#continer2 {
  margin: auto;
  width: 600px;
  height: 35px;
  border: 0px solid black;
  padding: 10px;
  display: flex;
}
#continer3 {
  margin: auto;
  width: 600px;
  height: 35px;
  border: 0px ;
  padding: 10px;
  display: flex;
}
#space {
  margin: auto;
  width: 10px;
  height: 250px;
  border: 0px solid black;
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

.info {
  background-color: #e7f3fe;
  border-left: 6px solid #2196F3;
}

</style>

    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2020.2.617/styles/kendo.default-v2.min.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2020.2.617/js/kendo.all.min.js"></script>
</head>
<body>
    <h1 style="color:blue;">Appointments </h1>
    <a href="patient.jsp">   <button>Back to Dashboard</button> </a>
    <hr />
<<<<<<< HEAD
 <%--  <%String useremail = session.getAttribute("userEmail").toString(); %> --%>
   <%    int user_id =(int)session.getAttribute("userID"); %>
=======
>>>>>>> 55f579b52521b584cca3a7547770df4e959d4288
    <div id="continer2">
    <div >
    <p> <h3 style="color:blue;">Request Appointment</h3></p>
    </div>
    </div>
 <div id="continer">
<script>
    $(document).ready(function(){
        $("#timePicker").kendoTimePicker();
        $("#timePicker2").kendoTimePicker(); 
        $("#timePicker3").kendoTimePicker();
        $("#timePicker4").kendoTimePicker(); 
    });
</script>

<div id="main2">
    <br />
    <form action="appointment.jsp" method="post">
     <label >Choose time in 30 minute interval</label>
     <br />Doctor Id:<input type="text" name="Doctorid"  required/><br />
    <br /> Start Time:<input type="time"id="timePicker3"   name="start_time"  min="09:00" max="18:00" required/><br />
    <br /> End Time:<input type="time" id="timePicker4"  name="end_time"  min="09:00" max="18:00" required/><br />
    <br /> Date:<input type="date" name="date" id="DOB3" required/><br />
        <br /> <input type="submit"  value="Submit" />
    </form>
    
</div> 
   </div>     
   <div >
    <br />
    <form action="appointment.jsp" method="post">
     <label style="color:blue;">check appointment by doctor</label>
      <br /> First Name:<input type="text" name="firstName" required/><br />
      <br /> Last Name:<input type="text" name="lastName" required/><br />   
        <br /> <input type="submit"  value= "Submit" />
    </form>
    
</div>

<script>
      $(function() {
        $("#DOB").kendoDatePicker({
          format: "yyyy-MM-dd",
          min: new Date(),
         
          change: onDOBChange
        });
        $("#DOB2").kendoDatePicker({
            format: "yyyy-MM-dd",
            min: new Date(),
           
            change: onDOBChange
          });
        $("#DOB3").kendoDatePicker({
            format: "yyyy-MM-dd",
            min: new Date(),
         
            change: onDOBChange
          });
      });
    </script>

    <script>
        function onDOBChange(e) {
            var dt = e.sender;
            var value = dt.value();

            if (value === null) {
              value = kendo.parseDate(dt.element.val(), dt.options.parseFormats);
            }

            if (value < dt.min()) {
                dt.value(dt.min());
            }else if (value > dt.max()) {
                dt.value(dt.max());
            }
        }
    </script>

   <% 
    String StartTime=request.getParameter("start_time");
    String EndTime=request.getParameter("end_time");
    String AppDate=request.getParameter("date");
    String Doctor_ID=request.getParameter("Doctorid");   
    String doctor_forApp=request.getParameter("DoctoridForList");  
    String FirstName=request.getParameter("firstName");
    String LastName=request.getParameter("lastName");
<<<<<<< HEAD
    int userid=user_id;
=======
    String userid=session.getAttribute("user_id").toString();
>>>>>>> 55f579b52521b584cca3a7547770df4e959d4288
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
<<<<<<< HEAD

=======
>>>>>>> 55f579b52521b584cca3a7547770df4e959d4288
            
            
            
            if(doctor_forApp != null){
            
            ResultSet rs4 = stmt.executeQuery("SELECT * FROM appointmentRequest ");
            %>
             <div id="continer3">
        <div id="main3">
            <table border=1 align=center style="text-align:center">
            <thead>
                <tr>
                  <th>ID</th>
                   <th>Start Time</th>
                   <th>End Time</th>
                   <th>Appo Date</th>
                </tr>
            </thead>
            <tbody>
               <%           
               
              while(rs4.next())
              {
                  if(rs4.getInt("employeeID") == Integer.parseInt(doctor_forApp)){
                  %>
                  <tr>
                   <td><%=rs4.getString("employeeID") %></td>
                      <td><%=rs4.getString("start_time") %></td>
                      <td><%=rs4.getString("end_time")%></td>
                      <td><%=rs4.getString("date") %></td>                      
                  </tr>
                  <%}}%>
                 </tbody>
              </table><br>
            </div>
          <%
          
            }
            
            
            
            
            
            
            
            
         
         if( StartTime != null ||  EndTime != null ||  AppDate != null ){ 
             
              boolean check=true;
              ResultSet rs2 = stmt.executeQuery("SELECT * FROM appointment");
              
              
              while(rs2.next()) {  
   if((rs2.getString(2).equals(StartTime) && rs2.getString(3).equals(EndTime) && rs2.getString(4).equals(AppDate) ) ){                    
                      out.println(rs2.getString(2) + " to");
                      out.println(rs2.getString(3));
                      out.println(rs2.getString(4));
                      out.println(" is not available");
                      out.println(" check the table below");
                     check =false;

            break;
         }
              }    
              
              int TimeCheck=0;
              int TimeCheck2=0;
              boolean TimeC=false;
              
          if(EndTime.charAt(1) ==':' && StartTime.charAt(1) ==':'){
              TimeCheck= Integer.parseInt(EndTime.substring(0,1)) - Integer.parseInt(StartTime.substring(0,1));   
              TimeCheck2= Integer.parseInt(EndTime.substring(2,4)) - Integer.parseInt(StartTime.substring(2,4));     
          }else
         if(EndTime.charAt(2) ==':' && StartTime.charAt(1) ==':'){
             TimeCheck= Integer.parseInt(EndTime.substring(0,2)) - Integer.parseInt(StartTime.substring(0,1));   
             TimeCheck2= Integer.parseInt(EndTime.substring(3,5)) - Integer.parseInt(StartTime.substring(2,4));     
          }else{
          TimeCheck= Integer.parseInt(EndTime.substring(0,2)) - Integer.parseInt(StartTime.substring(0,2));   
          TimeCheck2= Integer.parseInt(EndTime.substring(3,5)) - Integer.parseInt(StartTime.substring(3,5));   
         }
          
         if(TimeCheck == 0 && TimeCheck2==30 ){
             TimeC =true;
         }
        if(TimeCheck == 1 && TimeCheck2==-30 ){
            TimeC =true;
         }
         
        
        
        
        
        boolean check2=true;
        ResultSet rs3 = stmt.executeQuery("SELECT * FROM appointmentRequest");
        
        
        while(rs3.next()) {  
    if((rs3.getString(3).equals(Doctor_ID) && rs3.getString(4).equals(StartTime) 
        && rs3.getString(5).equals(EndTime) && rs3.getString(6).equals(AppDate)) ){                    
                out.println(rs3.getString(3) + " to");
                out.println(rs3.getString(4));
                out.println(rs3.getString(5));
                out.println(rs3.getString(6));
                out.println(" is not available");
               check =false;

      break;
   }
        } 
        
        
       
       //check if the requested appointment is aveleble 
         if(check == true && TimeC==true && Doctor_ID == null){
             
             String insertSql = "INSERT INTO appointment (start_time,end_time,"
                     + " date,  CREATED_DATE) "
                     + "VALUES ('"+StartTime+"', '"+EndTime+"' ,"
                     +" '"+AppDate+"','" + sqlDate + "')";
             stmt.execute(insertSql); 
             
         }else
             if(check == true && TimeC==true && Doctor_ID != null && check2==true){
             
             String insertSql = "INSERT INTO appointmentRequest (patientID,employeeID,start_time,end_time,"
                     + " date,  CREATED_DATE) "
                     + "VALUES ('"+userid+"','"+Doctor_ID+"','"+StartTime+"', '"+EndTime+"' ,"
                     +" '"+AppDate+"','" + sqlDate + "')";
             stmt.execute(insertSql); 
             
         }else{
             out.println("invalid time or unavailable date and time");
             }
         
        } 
         
         ResultSet rs2 = stmt.executeQuery("SELECT * FROM user,employee where user.userID=employee.employeeID AND user.firstName = '"+FirstName+"' AND user.lastName = '"+LastName+"' ");
         
         %>
          <div id="continer3">
     <div id="main3">
        <table border=1 align=center style="text-align:center">
       <thead>
           <tr>
              <th>ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>position</th>
           </tr>
       </thead>
       <tbody>
          <%           
          
         while(rs2.next())
         {
             userid=rs2.getInt("userID");
             %>
             <tr>
                 <td><%=rs2.getString("userID") %></td>
                 <td><%=rs2.getString("firstName")%></td>
                 <td><%=rs2.getString("lastName") %></td>
                 <td><%=rs2.getString("position") %></td>
             </tr>
             <%}%>
            </tbody>
         </table><br>
         </div>
       <%
       ResultSet rs = stmt.executeQuery("SELECT start_time,end_time,date FROM appointment JOIN EmployeeCreatesAppointment ON EmployeeCreatesAppointment.appointmentID=appointment.appointmentID WHERE  EmployeeCreatesAppointment.employeeID = '"+userid+"' ");    

       %>
       <div >
       <table border=1 align=center style="text-align:center">
         <thead>
             <tr>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Appo Date</th>
             </tr>
         </thead>
         <tbody>
            <%           
            
           while(rs.next())
           {
               %>
               <tr>
                   <td><%=rs.getString("start_time") %></td>
                   <td><%=rs.getString("end_time")%></td>
                   <td><%=rs.getString("date") %></td>
               </tr>
               <%}%>
              </tbody>
           </table><br>
       
       </div>
        </div>
     <%
     
          
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
        
        
    %>

</body>
</html>

