<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Prescriptions</title>
<title>View RX</title>
<link rel="stylesheet" type="text/css" href="css/basic.css"/>
<style type="text/css">
body {
	background: linear-gradient(to bottom, #92a8d1 10%, #92a8d1 20%, #D3D3D3 20%,
		#92a8d1 50%, white 100%);
		 background-image: url("18.jpg");
}
.container {
margin: auto;
  width:20em;
  clear: both;
  
}
</style>
</head>



<h1>My Prescriptions</h1>
    <button onclick="window.location.href='patient.jsp';">
            Back to Dashboard
    </button>
	<%
	String dbStatus = "Error connecting to database";

	String db = "Hospital";
	String user = "root";
	String password = session.getAttribute("dbPass").toString();

	int user_id = (int)session.getAttribute("user_id");
	
	try{
		java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
        dbStatus = (db + " database successfully connected.<br/><br/>");
        Statement stmt = con.createStatement();
        
		ResultSet rs = stmt.executeQuery("SELECT *" +
		" FROM patienthasprescription " +
		" JOIN prescription ON patienthasprescription.prescriptionID = prescription.prescriptionID " +
		" WHERE patientID = " + user_id);
		%>
		        <table border=1 align=center style="text-align:center">
            <thead>
                <tr>
                    <th>Medication</th>
                    <th>Total Amount</th>
                    <th>Dosage</th>
                    <th>Frequency</th> 
                <tr>
            </thead>
            <tbody>
            <%
           
            while(rs.next()){
                //if the date is today or later, then print the appointment
                %>
                <tr>
                    <td><%=rs.getString("medicationName")%></td>
                    <td><%=rs.getString("totalAmount")%></td>
                    <td><%=rs.getString("prescribedAmount")%></td>
                    <td><%=rs.getString("frequency")%></td>

                </tr>
            <%
            }   %>    
            </tbody>
        </table>
		
		<%
	}catch(Exception e){
		if(e.getMessage() != "null")
			out.println("Exception caught: " + e.getMessage());
	}
%>
</body>
</html>