

<%@ page import="java.sql.*"%>

<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
<title>Appointments</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 100%,#92a8d1 5%,#D3D3D3 5%,#92a8d1 100%,white 100%);
 background-image: url("9.jpg");
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

  width: 480px;
  height: 35px;
  border: 0px solid black;
  padding: 10px;
  display: flex;
}
#continer3 {
 
  width: 500px;
  height: 35px;
  border: 0px ;
  padding: 5px;
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
    <h1 style="color:blue;">Appointments</h1>
    <a href="employee.jsp">   <button>Back to Dashboard</button> </a>
    <hr />
 <div id="continer">
<script>
    $(document).ready(function(){
        $("#timePicker").kendoTimePicker();
        $("#timePicker2").kendoTimePicker(); 
        $("#timePicker3").kendoTimePicker();
        $("#timePicker4").kendoTimePicker(); 
    });
</script>
 
<div id="main">
    <br />
    <form action="employeeAppointment.jsp" method="post">
    <label >Choose time in 30 minute intervals</label>
     <br />Patient Id: <input type="text" name="Patientid"  required/><br />
    <br />Start Time: <input type="time" id="timePicker" name="start_time" min="09:00" max="18:00"  required/><br />
    <br />End Time: <input type="time" id="timePicker2" name="end_time" min="09:00" max="18:00"  required/><br />
    <br />Date: <input type="date" name="date" id="DOB"  required/><br />
        <br /> <input type="submit" value="Submit" />
    </form>
    
</div> 


   </div>     
   <div >
    <br />
    <form action="employeeAppointment.jsp" method="post">
     <label style="color:blue;">Check appointment by doctor</label>
      <br />Doctor Id: <input type="text" name="DoctoridForList"  required/><br />     
        <br /> <input type="submit"   value="Submit" />
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
      
 <%    int user_id =(int)session.getAttribute("userID"); %>
 

    <% 
    
    String Patient_id=request.getParameter("Patientid");
    String StartTime=request.getParameter("start_time");
    String EndTime=request.getParameter("end_time");
    String AppDate=request.getParameter("date");
    
    
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";

         int userid= user_id;

          String password = session.getAttribute("dbPass").toString();
         
        
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            //out.println(db + " database successfully connected.<br/><br/>");
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
                
                ResultSet rs4 = stmt.executeQuery("SELECT * FROM appointmentRequest where employeeID ='"+userid+"'");
                %>
                <div id="continer2">
    <div >
    <p> <h3 style="color:blue;">Requested Appointments</h3></p>
    </div>
    <div id="space">
    </div>
    <div >
    <p> <h3 style="color:blue;">Current Appointments</h3></p>
    </div>
    </div>
                 <div id="continer3">
            <div id="main3">
                <table border=1 align=center style="text-align:center">
                <thead>
                    <tr>
                      <th>Patient ID</th>
                       <th>Start Time</th>
                       <th>End Time</th>
                       <th>Appo Date</th>
                    </tr>
                </thead>
                <tbody>
                   <%           
                   
                  while(rs4.next())
                  {
                     
                      %>
                      <tr>
                       <td><%=rs4.getString("patientID") %></td>
                          <td><%=rs4.getString("start_time") %></td>
                          <td><%=rs4.getString("end_time")%></td>
                          <td><%=rs4.getString("date") %></td>                      
                      </tr>
                      <%}%>
                     </tbody>
                  </table><br>
                </div>
              <%
              

            
            
            
            
         
         if( StartTime != null ||  EndTime != null ||  AppDate != null ){ 
             
              boolean check=true;
              ResultSet rs2 = stmt.executeQuery("SELECT * FROM appointment join EmployeeCreatesAppointment on appointment.appointmentID=EmployeeCreatesAppointment.appointmentID AND EmployeeCreatesAppointment.employeeID='"+userid+"'");
              
              
              while(rs2.next()) {  
   if((rs2.getString(2).equals(StartTime) && rs2.getString(3).equals(EndTime) && rs2.getString(4).equals(AppDate) ) ){                    
                      out.println(rs2.getString(2) + " to");
                      out.println(rs2.getString(3));
                      out.println(rs2.getString(4));
                      out.println(" is not aveleble");
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
          }else
              if(EndTime.charAt(1) ==':' && StartTime.charAt(2) ==':'){
                  TimeCheck= Integer.parseInt(EndTime.substring(0,1)) - Integer.parseInt(StartTime.substring(0,2));   
                  TimeCheck2= Integer.parseInt(EndTime.substring(2,4)) - Integer.parseInt(StartTime.substring(3,5));     
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
        
        

       
       
       //check if the requested appointment is aveleble 
         if(check == true && TimeC==true ){
             
             String insertSql = "INSERT INTO appointment (start_time,end_time,"
                     + " date,  CREATED_DATE) "
                     + "VALUES ('"+StartTime+"', '"+EndTime+"' ,"
                     +" '"+AppDate+"','" + sqlDate + "')";
             stmt.execute(insertSql); 
            
             
             ResultSet rs6 = stmt.executeQuery("SELECT * FROM appointment");  
             int appID=0;
             while(rs6.next()) {  
            
              appID=rs6.getInt("appointmentID");
             }
             String insertSql3 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID,"
                     + " CREATED_DATE) "
                     + "VALUES ('"+appID+"', '"+userid+"' ,"
                     +"'" + sqlDate + "')";
             stmt.execute(insertSql3);  
             String insertSql4 = "INSERT INTO PatientHasAppointment (patientID,appointmentID,"
                     + " CREATED_DATE) "
                     + "VALUES ('"+Patient_id+"', '"+appID+"' ,"
                     +"'" + sqlDate + "')";
             stmt.execute(insertSql4);  
             
             String insertSql5 = "DELETE FROM appointmentRequest  WHERE patientID='"+Patient_id+"' AND employeeID='"+userid+"'  AND start_time='"+StartTime+"'  AND end_time='"+EndTime+"'  AND date='"+AppDate+"'";
             stmt.execute(insertSql5);  
             
             }else{
             out.println("invalid time or unavailable date and time");
             }
       
        } 
         
 
    ResultSet rs = stmt.executeQuery("SELECT start_time,appointment.end_time,date,firstName,userID FROM user,  appointment  join EmployeeCreatesAppointment on  appointment.appointmentID=EmployeeCreatesAppointment.appointmentID join PatientHasAppointment  on  PatientHasAppointment.appointmentID=EmployeeCreatesAppointment.appointmentID where  user.userID=PatientHasAppointment.patientID AND  EmployeeCreatesAppointment.employeeID = '"+userid+"' AND date >= CURDATE() ORDER BY date ASC, start_time ASC");
    
         %>

     <div id="main3">
         <table border=1 align=center style="text-align:center">
         <thead>
             <tr>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Appo Date</th>
                <th>Appo with</th>
                <th>ID</th>
             </tr>
         </thead>
         <tbody>
            <%           
            
           while(rs.next() )
           {
               %>
               <tr>
                   <td><%=rs.getString("start_time") %></td>
                   <td><%=rs.getString("end_time")%></td>
                   <td><%=rs.getString("date") %></td>
                   <td><%=rs.getString("firstName") %></td>
                    <td><%=rs.getString("userID") %></td>
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

