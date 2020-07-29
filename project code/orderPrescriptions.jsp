<%@ page import="java.sql.*"
    import="java.text.SimpleDateFormat"
    %>

<html>
<head>
<title>Order RX</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 20%,#D3D3D3 20%,#92a8d1 50%,white 100%);
}
.container {
margin: auto;
  width:20em;
  clear: both;
  
}
</style>
</head>
<body>
    <h1>Order Prescription Form</h1>
    <button onclick="window.location.href='employee.jsp';">
            Back to Dashboard
    </button>
    <hr>
 <div class="container">
     <form action="orderPrescriptions.jsp" method="post">
        <h4>Patient Form:</h4>
        <label for="p_id">ID:</label>
        <input type="number" id="p_id" name="p_id">
        <br></br>
        <label for="p_fname">First Name:</label>
        <input type="text" id="p_fname" name="p_fname">
        <br></br>
        <label for="p_lname">Last Name:</label>
        <input type="text" id="p_lname" name="p_lname">
        <br></br>
        <h4>Medication Form:</h4>
        <label for="medication">Medication:</label>
        <input type="text" id="medication" name="medication">
        <br></br>
        <label for="med_amt">Total Amount Prescribed:</label>
        <input type="text" id="med_amt" name="med_amt">
        <br></br>
        <label for="dose">Dosage:</label>
        <input type="text" id="dose" name="dose">
        <br></br>
        <label for="frequency">Frequency:</label>
        <input type="text" id="frequency" name="frequency">
        <h4>Employee Confirmation</h4>
        <label for="e_id">ID:</label>
        <input type="number" id="e_id" name="e_id">
        <br></br>
        <label for="e_fname">First Name:</label>
        <input type="text" id="e_fname" name="e_fname">
        <br></br>
        <label for="p_name">Last Name:</label>
        <input type="text" id="e_lname" name="e_lname">
        <br></br>
        <input type="submit" value="order" name="submit">
    </form>
</div>

<%
    String db = "Hospital";
    String dbStatus = "Error connecting to database";   //default error message
    String orderStatus = "Error with processing order";
    String user = "root";
    String password = session.getAttribute("dbPass").toString();
    try{
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
        dbStatus = (db + " database successfully connected.<br/><br/>");
        Statement stmt = con.createStatement();
        
        int p_id = Integer.parseInt(request.getParameter("p_id"));
        String p_fname = request.getParameter("p_fname");
        String p_lname = request.getParameter("p_lname");
        
        String medication = request.getParameter("medication");
        String med_amt = request.getParameter("med_amt");
        String dose = request.getParameter("dose");
        String freq = request.getParameter("frequency");
        
        int user_id = (int)session.getAttribute("user_id");
        int e_id = Integer.parseInt(request.getParameter("e_id"));
        String e_fname = request.getParameter("e_fname");
        String e_lname = request.getParameter("e_lname");
        
        //check if the employee confirmation and the email logged in with matches
        ResultSet rs = stmt.executeQuery("SELECT userID, firstName, lastName" + 
                " FROM user" +
                " JOIN employee ON userID = employeeID" +
                " WHERE userID = " + e_id + 
                " AND firstName = '" + e_fname + "'" +
                " AND lastName = '" + e_lname + "'");
        
        
        if(rs.next() && user_id==e_id);
        else
            throw new Exception("Invalid employee confirmation");
        
        //check if the patient exists in the table
        rs = stmt.executeQuery("SELECT userID, firstName, lastName" + 
                " FROM user" +
                " JOIN patient ON userID = patientID" +
                " WHERE userID = " + p_id + 
                " AND firstName = '" + p_fname + "'" +
                " AND lastName = '" + p_lname + "'");
        
        if(rs.next());
        else
            throw new Exception("Invalid patient information");
        
        //generate and format the timestamp
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        java.sql.Timestamp current_timestamp = new java.sql.Timestamp(calendar.getTime().getTime());        
        SimpleDateFormat noSeconds = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currTimeStr = noSeconds.format(current_timestamp);
        
        //insert prescription information
        stmt.execute("INSERT INTO prescription(medicationName,totalAmount,prescribedAmount,frequency, CREATED_DATE)" +
                " VALUES ('" + medication + "', '" + med_amt + "', '" + dose + "', '" + freq + "', '" + currTimeStr + "')");
        //get the prescription id associated with the prescription information
        rs = stmt.executeQuery("SELECT prescriptionID" + 
                " FROM prescription" +
                " WHERE medicationName = '" + medication +
                "' AND totalAmount = '" + med_amt +
                "' AND prescribedAmount = '" + dose + 
                "' AND frequency = '" + freq +
                "' AND CREATED_DATE = '" + currTimeStr +"'");
        
        int prescription_id = 0;
        if(rs.next())
            prescription_id = rs.getInt("prescriptionID");
        else
            throw new Exception("Unsuccessful prescription order");
        
        //information 
        stmt.execute("INSERT INTO patienthasprescription(patientID, prescriptionID)" +
                " VALUE (" + p_id + ", " + prescription_id + ")");
        stmt.execute("INSERT INTO employeeordersprescription(employeeID, prescriptionID)" +
                " VALUE (" + e_id + ", " + prescription_id + ")");
        
        stmt.close();
        con.close();
        orderStatus = "Success full prescription order!";
    }catch(Exception e){
        if(e.getMessage() != "null")
            out.println("Exception Caught: " + e.getMessage());
    }
%>
<div class="status">
    <% String check = request.getParameter("submit");
    if(check != null && check.equals("order")){
    %>
        <p><%=orderStatus%></p>
    <% }
    %>
    <p><%=dbStatus%></p>
</div>

</body>
</html>