

<%@ page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
<title>SignIn</title>
<style type="text/css">
body {
 background: linear-gradient(to bottom, #92a8d1 10%,#92a8d1 24%,#D3D3D3 24%,#92a8d1 50%,white 100%);
}
#mylogin {
  align-self: center;
}

#main {
  margin: auto;
  width: 220px;
  height: 150px;
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

div {
  width: 220px;
  height: 150px;
  background-color: #92a8d1;
  position: relative;
  animation-name: example;
  animation-duration: 2s;
  animation-iteration-count: 1;
}

@keyframes example {
  0%   {background-color:red; left:0px; top:0px;}

  50%  {background-color:blue; left:200px; top:200px;}
 
  100% {background-color:red; left:0px; top:0px;}
}

</style>
</head>
<body>
    <h1>Employee Dashboard</h1>

    <hr />


 

    <% 
 
    
    
       
     String db = "Hospital";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "rootpass";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully connected.<br/><br/>");
            
 
            Statement stmt = con.createStatement();
            
           
              
           
         
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>
