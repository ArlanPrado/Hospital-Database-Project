

<%@ page import="java.sql.*"%>
<html>
<head>
<title>appointment</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 100%,#92a8d1 5%,#D3D3D3 5%,#92a8d1 100%,white 100%);
}
#mylogin {
  align-self: center;
}

#main {
  margin: auto;
  width: 320px;
  height: 160px;
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

.info {
  background-color: #e7f3fe;
  border-left: 6px solid #2196F3;
}


</style>
</head>
<body>
    <h1>Hospital Management System Appointment </h1>
    <hr />

<div id="main">
    <br />
    <form action="appointment.jsp" method="post">
    
    <br /> Start Time:<input type="time" name="start_time"  required/><br />
    <br /> End Time:<input type="time" name="end_time"  required/><br />
    <br /> Date:<input type="text" name="date"  required/><br />
        <br /> <input type="submit" onclick="submit()  value="submit" />
        <button><a class="button" href="patient.jsp"> Back</a></button>
    </form>
    
</div> 



    <ul>
        <li><p>
                <b>Email:</b>
                <%= request.getParameter("start_time")%>
            </p></li>
             <li><p>
                <b>Email:</b>
                <%= request.getParameter("end_time")%>
            </p></li>
        <li><p>
                <b>Password:</b>
                <%= request.getParameter("date")%>
            </p></li>
    </ul>

     

    <% 
    String StartTime=request.getParameter("start_time");
    String EndTime=request.getParameter("end_time");
    String AppDate=request.getParameter("date");

    
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Iluvhim@123";

        
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully connected.<br/><br/>");
            Statement stmt = con.createStatement();
            
            java.util.Date now = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointment ");
            %><table border=1 align=center style="text-align:center">
            <thead>
                <tr>
                   <th>Start Time</th>
                   <th>End Time</th>
                   <th>Appo Date</th>
                </tr>
            </thead>
            <tbody>
              <%while(rs.next())
              {
                  %>
                  <tr>
                      <td><%=rs.getString("start_time") %></td>
                      <td><%=rs.getString("end_time") %></td>
                      <td><%=rs.getString("date") %></td>
                  </tr>
                  <%}%>
                 </tbody>
              </table><br>
          <%
          
         if( StartTime != null ||  EndTime != null ||  AppDate != null){ 
              boolean check=true;
              ResultSet rs2 = stmt.executeQuery("SELECT * FROM appointment ");
              
              
              while(rs2.next()) {  
                  if(rs2.getString(2).equals(StartTime) && rs2.getString(3).equals(EndTime)
                          && rs2.getString(4).equals(AppDate)){
                           
                      out.println(rs2.getString(4));
                     check =false;

            break;
         }
              }      
         if(check == true){
             String insertSql = "INSERT INTO appointment (start_time,end_time,"
                     + " date,  CREATED_DATE) "
                     + "VALUES ('"+StartTime+"', '"+EndTime+"' ,"
                     +" '"+AppDate+"','" + sqlDate + "')";
             stmt.execute(insertSql); 
         }
      
   
         
        } 
          
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
        
        
    %>
    

</body>
</html>

