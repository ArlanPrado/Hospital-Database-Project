

<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.*" %>
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
#main2 {
  margin: auto;
  width: 320px;
  height: 160px;
  border: 3px solid #73AD21;
  padding: 10px;
  display: flex;
}
#continer {
  margin: auto;
  width: 600px;
  height: 200px;
  border: 10px solid black;
  padding: 10px;
  display: flex;
}
#continer2 {
  margin: auto;
  width: 600px;
  height: 30px;
  border: 0px solid black;
  padding: 10px;
  display: flex;
}
#space {
  margin: auto;
  width: 10px;
  height: 200px;
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

        
        
</head>
<body>
    <h1>Hospital Management System Appointment </h1>
    <hr />
    <div id="continer2">
    <div >
    <p> <h3>create appointment</h3></p>
    </div>
    <div id="space">
    </div>
    <div >
    <p> <h3>request appointment</h3></p>
    </div>
    </div>
 <div id="continer">
<div id="main">
    <br />
    <form action="appointment.jsp" method="post">
    
    <br /> Start Time:<input type="time" name="start_time"  required/><br />
    <br /> End Time:<input type="time" name="end_time"  required/><br />
    <br /> Date:<input type="date" name="date"  required/><br />
        <br /> <input type="submit" onclick="submit()  value="submit" />
        <button><a class="button" href="patient.jsp"> Back</a></button>
    </form>
    
</div> 
<div id="space">
</div>
<div id="main2">
    <br />
    <form action="appointment.jsp" method="post">
    
    <br /> Start Time:<input type="time" name="start_time"  required/><br />
    <br /> End Time:<input type="time" name="end_time"  required/><br />
    <br /> Date:<input type="date" name="date"  required/><br />
        <br /> <input type="submit" onclick="submit()  value="submit" />
        <button><a class="button" href="patient.jsp"> Back</a></button>
    </form>
    
</div> 
 
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
/*     ArrayList <String> al = new ArrayList<String>();
    al.add("8:00");
    al.add("8:30");
    al.add("9:00");
    al.add("9:30");
    al.add("10:00");
    al.add("10:30");
    al.add("11:00");
    al.add("11:30");
    al.add("12:00");
    al.add("12:30");
    al.add("13:00");
    al.add("13:30");
    al.add("14:00");
    al.add("14:30");
    al.add("15:00");
    al.add("15:30");
    al.add("16:00");
    al.add("16:30");
    al.add("17:00");
    al.add("17:30");
    al.add("18:00");
    al.add("18:30");
    al.add("19:00");
    al.add("19:30"); */
    
/*     boolean  check2=true;

    if (Integer.parseInt(StartTime.substring(0,2)) > 19
     || Integer.parseInt(StartTime.substring(0,2)) < 8){
        out.println("invalide time");
        check2=false;
    }
     
  if(Integer.parseInt(EndTime.substring(0,2)) > 19
    || Integer.parseInt(EndTime.substring(0,2)) < 8){
      out.println("invalide time");
      check2=false; 
  }
    */       
    

       
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
            
         
         if( StartTime != null ||  EndTime != null ||  AppDate != null ){ 
             
              boolean check=true;
              ResultSet rs2 = stmt.executeQuery("SELECT * FROM appointment");
              
              
              while(rs2.next()) {  
                 if((rs2.getString(2).substring(0, 5).equals(StartTime) 
                         && rs2.getString(3).substring(0, 5).equals(EndTime) 
                         && rs2.getString(4).equals(AppDate) ) ){
                    
                      out.println(rs2.getString(2).substring(0,5) + " to");
                      out.println(rs2.getString(3).substring(0,5));
                      out.println(rs2.getString(4));
                      out.println(" is not aveleble");
                      out.println(" check the table below");
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
       
          
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
        
        
    %>

</body>
</html>

