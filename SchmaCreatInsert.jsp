<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>


<%@ page import="java.sql.*"%>

<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>

    <!--   dabase name =Hospital -->
  <!-- conection name= root
  connection passwored=passwored -->
    <%
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/Hospital?serverTimezone=UTC";
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "passwored");
        if(!connection.isClosed())
             out.println("Successfully connected to " + "MySQL server using "+"<br/><br/>");







       // Create table
    /*    String createSql = "CREATE TABLE Patient (PatientKey INT NOT NULL AUTO_INCREMENT, "
                  + "PatientFirstName VARCHAR(45) NULL,"
                  +"PatientLastName VARCHAR(45) NULL, "
                  +"PatientPhoneNumber INT NULL, "
                  +"PatientDateOfBirth VARCHAR(45) NULL, "
                  +"PatientAddress VARCHAR(45) NULL, "
                  +"PatientEmail VARCHAR(45) NULL, "
                  +"DoctorKey INT NULL, "
                  +"SpecialistKey INT NULL, "
                  +"SurgeonKey INT NULL, "
                  +"NurseKey INT NULL, "
                  + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (PatientKey))";  */
          /* String createSql = "CREATE TABLE PatientMedicalHistory (PatientMedicalHistoryKey INT NOT NULL AUTO_INCREMENT, "
                  +"PatientKey INT NULL, "
                  +"Medications VARCHAR(45) NULL, "
                  +"Alergies VARCHAR(45) NULL, "
                  +"Diseases VARCHAR(45) NULL, "
                  +"Symptoms VARCHAR(45) NULL, "
                  +"FamilyHistory VARCHAR(45) NULL, "
                  +"DoctorKey INT NULL, "
                  +"SpecialistKey INT NULL, "
                  +"SurgeonKey INT NULL, "
                  +"NurseKey INT NULL, "
                  + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (PatientMedicalHistoryKey))";  */

      /*      String createSql = "CREATE TABLE Doctor (DoctorKey INT NOT NULL AUTO_INCREMENT, "
                   +"SupervisorsKey INT NULL, "
                   +"DoctorFirstname VARCHAR(45) NULL, "
                   +"DoctorLastname VARCHAR(45) NULL, "
                   +"DoctorPhoneNumber INT NULL, "
                   + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (DoctorKey))";
   */

   /* String createSql = "CREATE TABLE Nurses (NurseKey INT NOT NULL AUTO_INCREMENT, "
           +"SupervisorsKey INT NULL, "
           +"NurseFirstname VARCHAR(45) NULL, "
           +"NurseLastname VARCHAR(45) NULL, "
           +"NursePhoneNumber INT NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (NurseKey))";
   */

  /*  String createSql = "CREATE TABLE Specialists (SpecialistKey INT NOT NULL AUTO_INCREMENT, "
           +"SupervisorsKey INT NULL, "
           +"SpecialistFirstname VARCHAR(45) NULL, "
           +"SpecialistLastname VARCHAR(45) NULL, "
           +"SpecialistPhoneNumber INT NULL, "
           +"specialization VARCHAR(45) NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (SpecialistKey))";
    */

  /*   String createSql = "CREATE TABLE Surgeons (SurgeonKey INT NOT NULL AUTO_INCREMENT, "
            +"SupervisorsKey INT NULL, "
            +"SurgeonFirstname VARCHAR(45) NULL, "
            +"SurgeonLastname VARCHAR(45) NULL, "
            +"SurgeonPhoneNumber INT NULL, "
            + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (SurgeonKey))";

   */

  /*  String createSql = "CREATE TABLE MedicationOrders (MedicationOrdersKey INT NOT NULL AUTO_INCREMENT, "
           +"OrderName VARCHAR(45) NULL, "
           +"OrderAmount VARCHAR(45) NULL, "
           +"DoctorKey INT NULL, "
           +"SpecialistKey INT NULL, "
           +"SurgeonKey INT NULL, "
           +"PatientKey INT NULL, "
           +"PharmacistKey INT NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (MedicationOrdersKey))";
   */
  /*  String createSql = "CREATE TABLE Supervisors (SupervisorsKey INT NOT NULL AUTO_INCREMENT, "
           +"SupervisorsFirstname VARCHAR(45) NULL, "
           +"SupervisorsLastname VARCHAR(45) NULL, "
           +"SupervisorsPhoneNumber INT NULL, "
           +"Supervision VARCHAR(45) NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (SupervisorsKey))";
   */

  /*  String createSql = "CREATE TABLE Pharmacists (PharmacistKey INT NOT NULL AUTO_INCREMENT, "
           +"SupervisorsKey INT NULL, "
           +"PharmacistFirstname VARCHAR(45) NULL, "
           +"PharmacistLastname VARCHAR(45) NULL, "
           +"PharmacistPhoneNumber INT NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (PharmacistKey))";

    */

  /*   String createSql = "CREATE TABLE Receptionists (ReceptionisKey INT NOT NULL AUTO_INCREMENT, "
            +"SupervisorsKey INT NULL, "
            +"ReceptionisFirstname VARCHAR(45) NULL, "
            +"ReceptionisLastname VARCHAR(45) NULL, "
            +"ReceptionisPhoneNumber INT NULL, "
            + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (ReceptionisKey))";
     */

   /*   String createSql = "CREATE TABLE Secretaries (SecretarieKey INT NOT NULL AUTO_INCREMENT, "
             +"SupervisorsKey INT NULL, "
             +"SecretarieFirstname VARCHAR(45) NULL, "
             +"SecretarieLastname VARCHAR(45) NULL, "
             +"SecretariePhoneNumber INT NULL, "
             + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (SecretarieKey))";
      */

     /*  String createSql = "CREATE TABLE FoodServers (FoodserverKey INT NOT NULL AUTO_INCREMENT, "
              +"ManagersKey INT NULL, "
              +"FoodserverFirstname VARCHAR(45) NULL, "
              +"FoodserverLastname VARCHAR(45) NULL, "
              +"FoodserverPhoneNumber INT NULL, "
              + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (FoodserverKey))";
    */

  /*   String createSql = "CREATE TABLE Housekeepers (HousekeeperKey INT NOT NULL AUTO_INCREMENT, "
            +"ManagersKey INT NULL, "
            +"HousekeeperFirstname VARCHAR(45) NULL, "
            +"HousekeeperLastname VARCHAR(45) NULL, "
            +"HousekeeperPhoneNumber INT NULL, "
            + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (HousekeeperKey))";
   */

   /* String createSql = "CREATE TABLE InventoryManagers (ManagersKey INT NOT NULL AUTO_INCREMENT, "
           +"SupervisorsKey INT NULL, "
           +"ManagersFirstname VARCHAR(45) NULL, "
           +"ManagersLastname VARCHAR(45) NULL, "
           +"ManagersPhoneNumber INT NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (ManagersKey))";
   */

  /*  String createSql = "CREATE TABLE Visit (VisitKey INT NOT NULL AUTO_INCREMENT, "
           +"VisitDate VARCHAR(45) NULL, "
           +"VisitTime VARCHAR(45) NULL, "
           +"DoctorKey INT NULL, "
           +"SpecialistKey INT NULL, "
           +"SurgeonKey INT NULL, "
           +"NurseKey INT NULL, "
           +"ReceptionisKey INT NULL, "
           +"SecretarieKey INT NULL, "
           + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (VisitKey))";
   */

  /*  Statement statement = connection.createStatement();
   statement.execute(createSql); */

  //Insert row
   java.util.Date now = new java.util.Date();
   java.sql.Date sqlDate = new java.sql.Date(now.getTime());
  /*  String insertSql = "INSERT INTO Doctor (DoctorFirstname,DoctorLastname,"
                          + "DoctorPhoneNumber, CREATED_DATE) "
                          + "VALUES ('Katrine', 'Hegmann',33333333, '" + sqlDate + "')";
    */
   /*  String insertSql = "INSERT INTO FoodServers (FoodserverFirstname,FoodserverLastname,"
            + "FoodserverPhoneNumber, CREATED_DATE) "
            + "VALUES ('May', 'Bode',1069272170, '" + sqlDate + "')";
    */
   /*  String insertSql = "INSERT INTO Housekeepers (HousekeeperFirstname,HousekeeperLastname,"
            + "HousekeeperPhoneNumber, CREATED_DATE) "
            + "VALUES ('Jessy', 'Reilly',00651836492, '" + sqlDate + "')";
    */

    /* String insertSql = "INSERT INTO InventoryManagers (ManagersFirstname,ManagersLastname,"
            + "ManagersPhoneNumber, CREATED_DATE) "
            + "VALUES ('Katelin', 'Kris',1642516466, '" + sqlDate + "')";
    */

  /*   String insertSql = "INSERT INTO MedicationOrders (OrderName,OrderAmount,"
            + "CREATED_DATE) "
            + "VALUES ('naproxen', '1000 mg', '" + sqlDate + "')";
    */


   /*  String insertSql = "INSERT INTO Nurses (NurseFirstname,NurseLastname,"
            + "NursePhoneNumber, CREATED_DATE) "
            + "VALUES ('Pattie', 'Ratke',0414834830, '" + sqlDate + "')";
     */

   /*   String insertSql = "INSERT INTO Patient (PatientFirstName,PatientLastName,"
             + "PatientPhoneNumber,PatientDateOfBirth,PatientAddress,PatientEmail, CREATED_DATE) "
             + "VALUES ('Jany', 'Feil',0993434830,'1970-09-08',"
             +"'7732 Lowe Courts Suite 614 Port Janie','shanny80@grufefse.cf' ,'" + sqlDate + "')";

     */

   /*   String insertSql = "INSERT INTO PatientMedicalHistory (Medications,Alergies,"
             + "Diseases,Symptoms,FamilyHistory, CREATED_DATE) "
             + "VALUES ('diphenhydramine', 'Food Allergy','Asthma',"
             +"'breathlessness, chest tightness','none','" + sqlDate + "')";
     */

  /*   String insertSql = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
             + "PharmacistPhoneNumber, CREATED_DATE) "
             + "VALUES ('Paula', 'Willms',1000456466, '" + sqlDate + "')";
      */

  /*   String insertSql = "INSERT INTO Receptionists (ReceptionisFirstname,ReceptionisLastname,"
            + "ReceptionisPhoneNumber, CREATED_DATE) "
            + "VALUES ('Janet', 'Fritsch',1004045646, '" + sqlDate + "')";
    */

   /*  String insertSql = "INSERT INTO Secretaries (SecretarieFirstname,SecretarieLastname,"
            + "SecretariePhoneNumber, CREATED_DATE) "
            + "VALUES ('Zachary', 'Schultz',0449111646, '" + sqlDate + "')";
     */

  /*    String insertSql = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
             + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
             + "VALUES ('Amely', 'Boyle',1984511600,'Cardiologist', '" + sqlDate + "')";
   */

    /* String insertSql1 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Pierre', 'Kepler',175657764,'Specialists', '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Amalia', 'Marrero',1193677566,'Nurses', '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Lesley', 'Kresge',0805040638,'Surgeons', '" + sqlDate + "')";
   String insertSql4 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Bruno', 'Brignac',1042180521,'Specialists', '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Demetrius', 'Mcgarrah',0166268546,'Nurses', '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Sandie', 'Perera',1197558156,'Surgeons', '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Foster', 'Koga',1139300666,'Nurses', '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Edris', 'Corrales',0807756426,'Pharmacists', '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Sylvia', 'Kivett',1067459853,'Pharmacists', '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Leeanne', 'Laursen',1035565944,'Surgeons', '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Apryl', 'Waddy',0198204530,'Pharmacists', '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO Supervisors (SupervisorsFirstname,SupervisorsLastname,"
           + "SupervisorsPhoneNumber,Supervision, CREATED_DATE) "
           + "VALUES ('Eloy', 'Ausmus',1147053529,'Surgeons', '" + sqlDate + "')";
   */


    /* String insertSql1 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-08-15', '2:00 pm', '" + sqlDate + "')";
    String insertSql2 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-08-21', '3:00 pm', '" + sqlDate + "')";
    String insertSql3 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-08-14', '4:00 pm', '" + sqlDate + "')";
    String insertSql4 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-09-18', '5:00 pm', '" + sqlDate + "')";
    String insertSql5 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-09-21', '1:00 pm', '" + sqlDate + "')";
    String insertSql6 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-09-5', '1:15 pm', '" + sqlDate + "')";
    String insertSql7 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-10-7', '1:40 pm', '" + sqlDate + "')";
    String insertSql8 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-10-8', '1:00 pm', '" + sqlDate + "')";
    String insertSql9 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-10-17', '8:45 am', '" + sqlDate + "')";
    String insertSql10 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-11-16', '9:00 am', '" + sqlDate + "')";
    String insertSql11 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-11-12', '10:00 am', '" + sqlDate + "')";
    String insertSql12 = "INSERT INTO Visit (VisitDate,VisitTime,CREATED_DATE) "
            + "VALUES ('1920-11-12', '11:00 am', '" + sqlDate + "')";
   */



   Statement statement = connection.createStatement();
          statement.execute(insertSql1);
          statement.execute(insertSql2);
          statement.execute(insertSql3);
          statement.execute(insertSql4);
          statement.execute(insertSql5);
          statement.execute(insertSql6);
          statement.execute(insertSql7);
          statement.execute(insertSql8);
          statement.execute(insertSql9);
          statement.execute(insertSql10);
          statement.execute(insertSql11);
          statement.execute(insertSql12);





          statement.close();
        /*   String sql ="select ID_USER,USERNAME,AGE from USER"; */
         /*  ResultSet resultSet = statement.executeQuery(sql);
        if(resultSet.next()){

            out.println(resultSet.getString(1)+
                    "<br/><br/>"+resultSet.getString(2)+
                    "<br/><br/>"+resultSet.getString(3)
            + "<br/><br/>");
        } */


          connection.close();
      }catch(Exception ex){
          out.println("Unable to connect to database."+ ex.getMessage());
      }

      %>
    </body>
  </html>
