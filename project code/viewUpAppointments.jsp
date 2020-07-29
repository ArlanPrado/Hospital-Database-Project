<%@ page import="java.sql.*"
        import="java.text.SimpleDateFormat"
        import="java.util.Calendar"
        import="java.util.Date"
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upcoming Appointments</title>
<link rel="stylesheet" type="text/css" href="basic.css"/>
<style type="text/css">
</style>
</head>
<body>
    <h1>Upcoming Appointments</h1>
    <button onclick="window.location.href='employee.jsp';">
            Back to Dashboard
    </button>
    <%
    String dbStatus = "Error connecting to database";   //default error message
    
    String db = "Hospital";
    String user = "root";
    String password = session.getAttribute("dbPass").toString();
    
    String p_first, p_last;
    int room = 0;
    int p_id = 0;
    String start_time, end_time, app_date;
    p_first = p_last = start_time = end_time = app_date = "";
    
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm aa");
    SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd-yyyy");
    
    int user_id = (int)session.getAttribute("user_id");
    try{
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
        dbStatus = (db + " database successfully connected.<br/><br/>");
        Statement stmt = con.createStatement();
        
        
        ResultSet rs = stmt.executeQuery("SELECT *" +
                "FROM " + 
                "(SELECT userID, firstName, lastName, room, start_time, end_time, appointment.date, employee.employeeID, appointment.appointmentID " +
                "FROM user "  +
                "JOIN patient ON " +
                "patient.patientID = user.userID " +
                "JOIN patienthasappointment ON " + 
                "patienthasappointment.patientID = patient.patientID " +
                "JOIN appointment ON " +
                "appointment.appointmentID = patienthasappointment.appointmentID " +
                "JOIN employeecreateappointment ON " +
                "appointment.appointmentID = employeecreateappointment.appointmentID " +
                "JOIN employee ON " +
                "employee.employeeID = employeecreateappointment.employeeID) AS T " +
                "WHERE T.employeeID = " + user_id +
                " AND T.date >= CURDATE()" + //this line makes sure appointment
                " ORDER BY T.date ASC, T.start_time ASC");
        //THERE IS A PROBLEM WITH DISPLAYING TIME, IT DOES NOT MATCH WITH THE MYSQL
        %>
        <table border=1 align=center style="text-align:center">
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Room</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Date</th>
                    <th>Patient ID</th>
                    <th>Name</th>
                    
                <tr>
            </thead>
            <tbody>
            <%
           
            Date today = Calendar.getInstance().getTime();
            while(rs.next()){
                //if the date is today or later, then print the appointment
                %>
                <tr>
                    <td><%=rs.getInt("appointmentID")%></td>
                    <td><%=rs.getInt("room")%></td>
                    <td><%=rs.getString("start_time")%></td>
                    <td><%=rs.getString("end_time")%></td>
                    <td><%=rs.getString("date")%></td>
                    <td><%=rs.getInt("userID")%></td>
                    <td><%=rs.getString("firstName") + " " + rs.getString("lastName")%></td>
                </tr>
            <%
            }   %>    
            </tbody>
        </table>
    <%
    }catch(Exception e){
        if(e.getMessage() != "null")
            out.println("SQL Exception Caught: " + e.getMessage());
    }
    %>
    
<div class="dbstatus">
    <p><%=dbStatus%></p>
</div>
</body>
</html>