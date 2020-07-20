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
        connection = DriverManager.getConnection(connectionURL, "root", "Iluvhim@123");
        if(!connection.isClosed())
             out.println("Successfully connected to " + "MySQL server using "+"<br/><br/>");



     // Create table


   /*    String createSql = "CREATE TABLE user (userKey INT NOT NULL AUTO_INCREMENT, "
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
                + "CREATED_DATE DATE NOT NULL, PRIMARY KEY (PatientKey))";
                 */

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


/*  String insertSql1 = "INSERT INTO user (firstName,lastName,"
                   + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Roman', 'Ballard',0133434830,"
                   +"'801 Pretlow St, Franklin, VA, 23851','airship@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql2 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Marisela', 'Gadison',0143434830,"
                    +"'63 Twin Peaks Ln, Sequim, WA, 98382','crimsane@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql3 ="INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Cliff', 'Woullard',0153434830,"
                    +"'6908 Longview Beach Rd, Jeffersonville','chrisk@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql4 ="INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Domingo', 'Zobel',0163434830,"
                    +"'8863 Black Point Rd, Syracuse, IN, 46567','aaribaud@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql5 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Andria', 'Straley',0153174830,"
                    +"'10318 Kk Rd, Rapid River, MI, 49878','iamcal@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql6 ="INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Santina', 'Linker',0163184830,"
                    +"'87 Gore Rd, Lancaster, NH, 03584','msloan@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql7 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Lucretia', 'Grissom',0173194830,"
                    +"'150 Barren, Conshohocken, PA, 19428 ','kodeman@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql8 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Tianna', 'Nielson',0183420830,"
                    +"'30 Northington Dr, Avon, CT, 06001 ','delpino@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql9 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Angelia', 'Sisk',0193214830,"
                    +"'472 870th Hwy, Winnsboro, LA, 71295','arnold@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql10 ="INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Sheilah', 'Rueb',0203224830,"
                    +"'625 E Plum St, Vineland, NJ, 08360','portele@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql11 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Mafalda', 'Call',0213234830,"
                    +"'234 E Black Point Rd, Syracuse, IN, 46567 ','presoff@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql12 = "INSERT INTO user (firstName,lastName,"
                    + "phoneNumber, address, email,password, CREATED_DATE) "
                    + "VALUES ('Lilia', 'Thorsen',0222434830,"
                    +"'23 Gore st, Lancaster, NH, 03584','vsprintf@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql13 = "INSERT INTO user (firstName,lastName,"
        + "phoneNumber, address, email,password, CREATED_DATE) "
        + "VALUES ('Mafalda', 'Thorsen',0092434830,"
        +"'77 Gore st, hamilton, NH, 03584','Mafalda@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql14 = "INSERT INTO user (firstName,lastName,"
        + "phoneNumber, address, email,password, CREATED_DATE) "
        + "VALUES ('Lilia', 'Sheilah',0222434830,"
        +"'567 Gore st, Lancaster, NH, 03584','Lilia45@grufefse.cf',111111 ,'" + sqlDate + "')";

String insertSql15 = "INSERT INTO user (firstName,lastName,"
        + "phoneNumber, address, email,password, CREATED_DATE) "
        + "VALUES ('Angelia', 'Thorsen',0792434830,"
        +"'568 Gore st, Lancaster, NH, 03584','Angelia56@grufefse.cf',111111 ,'" + sqlDate + "')";

 */
 /*
 String insertSql1 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
       + "prescribedAmount,frequency,CREATED_DATE) "
       + "VALUES ('hydrocodone', '1000 mg',true,'500 mg','2 times', '" + sqlDate + "')";
  String insertSql2 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('levothyroxine', '800 mg',false,'800 mg','no' ,'" + sqlDate + "')";
  String insertSql3 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('prednisone', '1000 mg', true,'1000 mg','no' ,'" + sqlDate + "')";
  String insertSql4 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('amoxicillin', '800 mg',false,'400 mg','1 times' , '" + sqlDate + "')";
  String insertSql5 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('gabapentin', '200 mg',true,'200 mg','no' , '" + sqlDate + "')";
  String insertSql6 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('lisinopril', '500 mg',true,'500 mg','no' , '" + sqlDate + "')";
  String insertSql7 ="INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('atorvastatin', '800 mg',true,'800 mg','no' , '" + sqlDate + "')";
  String insertSql8 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('metformin', '1000 mg', false,'800 mg','1 times' ,'" + sqlDate + "')";
  String insertSql9 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ondansetron', '1000 mg',true,'800 mg','1 times' , '" + sqlDate + "')";
  String insertSql10 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ibuprofen', '800 mg',false,'800 mg','no' , '" + sqlDate + "')";
  String insertSql11 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ibuprofen', '700 mg', true,'700 mg','no' ,'" + sqlDate + "')";
  String insertSql12 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('naproxen', '1000 mg',false,'800 mg','1 times' , '" + sqlDate + "')";
  String insertSql13 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('acetaminophen', '2000 mg',true,'800 mg','2 times' , '" + sqlDate + "')";
  String insertSql14 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ibuprofen', '500 mg',false,'500 mg','no' , '" + sqlDate + "')";
  String insertSql15 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('naproxen', '1000 mg',true,'800 mg','1 times' , '" + sqlDate + "')"; */

  /*

  String insertSql1 = "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('Blood pressure is lower. Feet are inspected and there are no callouses, no compromised skin. No vision complaints.', '" + sqlDate + "')";
  String insertSql2 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('Oral cavity and pharynx normal. No inflammation, swelling, exudate, or lesions. Teeth and gingiva in good general condition.', '" + sqlDate + "')";
  String insertSql3 = "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('External auditory canals and tympanic membranes clear, hearing ', '" + sqlDate + "')";
  String insertSql4 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('Neck supple, non-tender without lymphadenopathy, masses or thyromegaly.', '" + sqlDate + "')";
  String insertSql5 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('No inflammation, swelling, exudate, or lesions. Teeth and gingiva in good general condition.', '" + sqlDate + "')";
  String insertSql6 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('No significant deformity or joint abnormality. No edema. Peripheral pulses intact. No varicosities.', '" + sqlDate + "')";
  String insertSql7 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('The head is normocephalic and atraumatic.  The head and neck are nontender without thyromegaly or adenopathy.  ', '" + sqlDate + "')";
  String insertSql8 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('LUNGS:  Clear to auscultation. ABDOMEN:  Soft and nontender.', '" + sqlDate + "')";
  String insertSql9 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('EXTREMITIES:  No cyanosis, clubbing or edema in the extremities.', '" + sqlDate + "')";
  String insertSql10 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('The patient is pleasant, appears her stated age.  Body habitus is mesomorphic.', '" + sqlDate + "')";
  String insertSql11 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('VITAL SIGNS:  Currently stable.  The patient is afebrile.', '" + sqlDate + "')";
  String insertSql12 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('SKIN AND EXTREMITIES:  No skin rashes or lesions are noted.  No cyanosis, clubbing or edema of the extremities.', '" + sqlDate + "')";
  String insertSql13 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('HEART:  Regular rate and rhythm.LUNGS:  Clear to auscultation.', '" + sqlDate + "')";
  String insertSql14 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('GENERAL:  The patient is a well-developed, well-nourished male in no acute distress, oriented x3.', '" + sqlDate + "')";
  String insertSql15 =  "INSERT INTO note (detail, CREATED_DATE) "
          + "VALUES ('LUNGS:  Clear to auscultation bilaterally. No wheezes, rales or rhonchi.', '" + sqlDate + "')";
     */

  /* String insertSql1 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1970-09-12','Latex Allergy ', 101,'" + sqlDate + "')";
   String insertSql2 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1972-09-3','Cold & Flu' ,104,'" + sqlDate + "')";
   String insertSql3 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1973-09-13','Cholesterol',105 ,'" + sqlDate + "')";
   String insertSql4 ="INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1974-09-15','HIV/AIDS',106 ,'" + sqlDate + "')";
   String insertSql5 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1975-09-11','Infectious Disease',107 ,'" + sqlDate + "')";
   String insertSql6 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1976-09-23','Lung Conditions',108,'" + sqlDate + "')";
   String insertSql7 ="INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1977-09-14','Cancer',109 ,'" + sqlDate + "')";
   String insertSql8 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1978-09-17','Tuberculosisa',110 ,'" + sqlDate + "')";
   String insertSql9 ="INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1979-09-19','Measlesa',111 ,'" + sqlDate + "')";
   String insertSql10 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1979-09-20','Lung cancer',112 ,'" + sqlDate + "')";
   String insertSql11 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1970-08-24','Stomach cancer',113 ,'" + sqlDate + "')";
   String insertSql12 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1977-12-26','Depression',114 ,'" + sqlDate + "')";
   String insertSql13 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1969-13-6','Bipolar disorder',114 ,'" + sqlDate + "')";
   String insertSql14 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1958-1-2','Glaucoma',114 ,'" + sqlDate + "')";
   String insertSql15 = "INSERT INTO patient (dateOfBirth,diagnosis,room, CREATED_DATE) "
           + "VALUES ('1955-2-23','Epilepsy',114 ,'" + sqlDate + "')"; */


  /*
   String insertSql1 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
         + "diseases,symptoms,familyHistory, CREATED_DATE) "
         + "VALUES (16,'Clindamycin', 'Latex Allergy','Asthma',"
         +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql2 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (17,'Ibuprofen', 'Food Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";

   String insertSql3 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (18,'Adderall', 'Mold Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql4 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (19,'Amlodipine', 'Pet Allergy','none',"
           +"'breathlessness, Muscle aches','none','" + sqlDate + "')";
   String insertSql5 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (20,'Omeprazole', 'Pollen Allergy','Asthma',"
           +"'Fever','none','" + sqlDate + "')";
   String insertSql6 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (21,'Amoxicillin', 'Food Allergy','none',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql7 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (22,'Loratadine', 'Pollen Allergy','hemochromatosis',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql8 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (23,'Trazodone', 'Food Allergy','Asthma',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";
   String insertSql9 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (24,'Ozempic', 'Pet Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql10 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (25,'Benzonatate', 'Drug Allergy','none',"
           +"'breathlessness, Muscle aches','none','" + sqlDate + "')";
   String insertSql11 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (26,'Kevzara', 'Insect Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql12 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (27,'Lisinopril', 'Drug Allergy','none',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";

   String insertSql13 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (28,'Benzonatate', 'Drug Allergy','none',"
           +"'chest tightness','none','" + sqlDate + "')";

   String insertSql14 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (29,'Ozempic', 'none','none',"
           +"'Coughing','none','" + sqlDate + "')";

   String insertSql15 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (30,'Trazodone', 'Insect Allergy','none',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";
     */

/*  String insertSql1 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
        + "PharmacistPhoneNumber, CREATED_DATE) "
        + "VALUES ('Karine', 'Patnode',1678456466, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Mose', 'Bastian',1000456466, '" + sqlDate + "')";

   String insertSql3 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Delphia', 'Capo',1123456466, '" + sqlDate + "')";

   String insertSql4 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Nancee', 'Dustin',1463456466, '" + sqlDate + "')";

   String insertSql5 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Ossie', 'Joseph',1673456466, '" + sqlDate + "')";

   String insertSql6 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Man', 'Bonanno',1149456466, '" + sqlDate + "')";

   String insertSql7 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Misty', 'Krebs',1173456466, '" + sqlDate + "')";

   String insertSql8 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Liza', 'Knebel',1159456466, '" + sqlDate + "')";

   String insertSql9 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Theron', 'Paez',1231456466, '" + sqlDate + "')";

   String insertSql10 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('April', 'Giglio',111445466, '" + sqlDate + "')";

   String insertSql11 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Lois', 'Wiersma',11442456466, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO Pharmacists (PharmacistFirstname,PharmacistLastname,"
           + "PharmacistPhoneNumber, CREATED_DATE) "
           + "VALUES ('Alla', 'Midgett',1844456466, '" + sqlDate + "')";

     */


 /*
    String insertSql1 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
          + "VALUES (16,16, '" + sqlDate + "')";
    String insertSql2 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (17,17, '" + sqlDate + "')";
    String insertSql3 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (18,23, '" + sqlDate + "')";
    String insertSql4 ="INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (19,16, '" + sqlDate + "')";
    String insertSql5 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (20,24, '" + sqlDate + "')";
    String insertSql6 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (21,16, '" + sqlDate + "')";
    String insertSql7 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (22,17, '" + sqlDate + "')";
    String insertSql8 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (23,19, '" + sqlDate + "')";
    String insertSql9 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (24,20, '" + sqlDate + "')";
    String insertSql10 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (25,28, '" + sqlDate + "')";
    String insertSql11 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (26,24, '" + sqlDate + "')";
    String insertSql12 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (27,16, '" + sqlDate + "')";
    String insertSql13 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (28,22, '" + sqlDate + "')";
    String insertSql14 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (29,19, '" + sqlDate + "')";
    String insertSql15 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (30,18, '" + sqlDate + "')";


   */


  /*
   String insertSql1 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
         + "VALUES (16,16, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (17,17, '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (18,23, '" + sqlDate + "')";
   String insertSql4 ="INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (19,16, '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (20,24, '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (21,16, '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (22,17, '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (23,19, '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (24,20, '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (25,28, '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (26,24, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (27,16, '" + sqlDate + "')";
   String insertSql13 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (28,22, '" + sqlDate + "')";
   String insertSql14 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (29,19, '" + sqlDate + "')";
   String insertSql15 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (30,18, '" + sqlDate + "')";
 */



/* String insertSql1 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
      + "VALUES (16,16, '" + sqlDate + "')";
String insertSql2 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (17,17, '" + sqlDate + "')";
String insertSql3 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (18,23, '" + sqlDate + "')";
String insertSql4 ="INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (19,16, '" + sqlDate + "')";
String insertSql5 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (20,24, '" + sqlDate + "')";
String insertSql6 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (21,16, '" + sqlDate + "')";
String insertSql7 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (22,17, '" + sqlDate + "')";
String insertSql8 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (23,19, '" + sqlDate + "')";
String insertSql9 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (24,20, '" + sqlDate + "')";
String insertSql10 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (25,28, '" + sqlDate + "')";
String insertSql11 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (26,24, '" + sqlDate + "')";
String insertSql12 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (27,16, '" + sqlDate + "')";
String insertSql13 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (28,22, '" + sqlDate + "')";
String insertSql14 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (29,19, '" + sqlDate + "')";
String insertSql15 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (30,18, '" + sqlDate + "')";



 /*
 String insertSql1 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
         + "VALUES (16,16, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (17,17, '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (18,23, '" + sqlDate + "')";
   String insertSql4 ="INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (19,16, '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (20,24, '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (21,16, '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (22,17, '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (23,19, '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (24,20, '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (25,28, '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (26,24, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (27,16, '" + sqlDate + "')";
   String insertSql13 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (28,22, '" + sqlDate + "')";
   String insertSql14 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (29,19, '" + sqlDate + "')";
   String insertSql15 = "INSERT INTO employeeHasPatients (patientID,userID, CREATED_DATE) "
           + "VALUES (30,18, '" + sqlDate + "')";
 */


   /* String insertSql1 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
         + "VALUES (16,16, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (17,17, '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (18,23, '" + sqlDate + "')";
   String insertSql4 ="INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (19,16, '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (20,24, '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (21,16, '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (22,17, '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (23,19, '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (24,20, '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (25,28, '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (26,24, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (27,16, '" + sqlDate + "')";
   String insertSql13 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (28,22, '" + sqlDate + "')";
   String insertSql14 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (29,19, '" + sqlDate + "')";
   String insertSql15 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (30,18, '" + sqlDate + "')";

   */


   /*
     String insertSql1 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
           + "VALUES (16,16, '" + sqlDate + "')";
     String insertSql2 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (17,17, '" + sqlDate + "')";
     String insertSql3 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (18,23, '" + sqlDate + "')";
     String insertSql4 ="INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (19,16, '" + sqlDate + "')";
     String insertSql5 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (20,24, '" + sqlDate + "')";
     String insertSql6 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (21,16, '" + sqlDate + "')";
     String insertSql7 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (22,17, '" + sqlDate + "')";
     String insertSql8 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (23,19, '" + sqlDate + "')";
     String insertSql9 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (24,20, '" + sqlDate + "')";
     String insertSql10 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (25,28, '" + sqlDate + "')";
     String insertSql11 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (26,24, '" + sqlDate + "')";
     String insertSql12 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (27,16, '" + sqlDate + "')";
     String insertSql13 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (28,22, '" + sqlDate + "')";
     String insertSql14 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (29,19, '" + sqlDate + "')";
     String insertSql15 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (30,18, '" + sqlDate + "')";
 */


/*
 String insertSql1 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
       + "VALUES (16,16, '" + sqlDate + "')";
 String insertSql2 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (17,17, '" + sqlDate + "')";
 String insertSql3 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (18,23, '" + sqlDate + "')";
 String insertSql4 ="INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (19,16, '" + sqlDate + "')";
 String insertSql5 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (20,24, '" + sqlDate + "')";
 String insertSql6 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (21,16, '" + sqlDate + "')";
 String insertSql7 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (22,17, '" + sqlDate + "')";
 String insertSql8 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (23,19, '" + sqlDate + "')";
 String insertSql9 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (24,20, '" + sqlDate + "')";
 String insertSql10 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (25,28, '" + sqlDate + "')";
 String insertSql11 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (26,24, '" + sqlDate + "')";
 String insertSql12 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (27,16, '" + sqlDate + "')";
 String insertSql13 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (28,22, '" + sqlDate + "')";
 String insertSql14 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (29,19, '" + sqlDate + "')";
 String insertSql15 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (30,18, '" + sqlDate + "')";
 */


 /* String insertSql1 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
       + "VALUES (16,16, '" + sqlDate + "')";
 String insertSql2 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (17,17, '" + sqlDate + "')";
 String insertSql3 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (18,23, '" + sqlDate + "')";
 String insertSql4 ="INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (19,16, '" + sqlDate + "')";
 String insertSql5 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (20,24, '" + sqlDate + "')";
 String insertSql6 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (21,16, '" + sqlDate + "')";
 String insertSql7 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (22,17, '" + sqlDate + "')";
 String insertSql8 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (23,19, '" + sqlDate + "')";
 String insertSql9 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (24,20, '" + sqlDate + "')";
 String insertSql10 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (25,28, '" + sqlDate + "')";
 String insertSql11 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (26,24, '" + sqlDate + "')";
 String insertSql12 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (27,16, '" + sqlDate + "')";
 String insertSql13 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (28,22, '" + sqlDate + "')";
 String insertSql14 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (29,19, '" + sqlDate + "')";
 String insertSql15 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (30,18, '" + sqlDate + "')";
  */

  /*
    String insertSql1 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
          + "VALUES (16,16, '" + sqlDate + "')";
    String insertSql2 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (17,17, '" + sqlDate + "')";
    String insertSql3 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (18,23, '" + sqlDate + "')";
    String insertSql4 ="INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (19,16, '" + sqlDate + "')";
    String insertSql5 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (20,24, '" + sqlDate + "')";
    String insertSql6 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (21,16, '" + sqlDate + "')";
    String insertSql7 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (22,17, '" + sqlDate + "')";
    String insertSql8 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (23,19, '" + sqlDate + "')";
    String insertSql9 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (24,20, '" + sqlDate + "')";
    String insertSql10 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (25,28, '" + sqlDate + "')";
    String insertSql11 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (26,24, '" + sqlDate + "')";
    String insertSql12 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (27,16, '" + sqlDate + "')";
    String insertSql13 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (28,22, '" + sqlDate + "')";
    String insertSql14 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (29,19, '" + sqlDate + "')";
    String insertSql15 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (30,18, '" + sqlDate + "')";

     */



   /*  String insertSql1 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Laveta', 'Juntunen',135511600,'Urologist', '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Chau', 'Corella',1983534600,'Parasitologist', '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Dorthy', 'Langer',1986789600,'Dentist', '" + sqlDate + "')";
   String insertSql4 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Chasidy', 'Willcox',1987423600,'Urologist', '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Yolonda', 'Schultze',1984311600,'Pathologist', '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Amely', 'Futrell',1984723500,'Endocrinologist', '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Lyndon', 'Calender',1987321600,'Pathologist', '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Carlo', 'Putman',1984525600,'Radiologist', '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Tobie', 'Harlow',198451457,'Cardiologist', '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Trena', 'Galang',1945112245,'Endocrinologist', '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Wesley', 'Heavner',1984011600,'Dentist', '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO Specialists (SpecialistFirstname,SpecialistLastname,"
           + "SpecialistPhoneNumber,specialization, CREATED_DATE) "
           + "VALUES ('Ermelinda', 'Belmonte',1984511600,'Endocrinologist', '" + sqlDate + "')";
    */

 /*
  String insertSql1 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (120000,'Specialists', '" + sqlDate + "')";
 String insertSql2 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (100000,'Nurses', '" + sqlDate + "')";
 String insertSql3 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (150000,'Surgeons', '" + sqlDate + "')";
 String insertSql4 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (150000,'Specialists', '" + sqlDate + "')";
 String insertSql5 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (100000,'Nurses', '" + sqlDate + "')";
 String insertSql6 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (160000,'Surgeons', '" + sqlDate + "')";
 String insertSql7 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (170000,'Nurses', '" + sqlDate + "')";
 String insertSql8 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (150000,'Pharmacists', '" + sqlDate + "')";
 String insertSql9 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (130000,'Pharmacists', '" + sqlDate + "')";
 String insertSql10 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (120000,'Surgeons', '" + sqlDate + "')";
 String insertSql11 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (135000,'Pharmacists', '" + sqlDate + "')";
 String insertSql12 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (160000,'Surgeons', '" + sqlDate + "')";
 String insertSql13 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (136000,'Nurses', '" + sqlDate + "')";
 String insertSql14 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (110000,'Surgeons', '" + sqlDate + "')";
 String insertSql15 = "INSERT INTO employee (salary,position, CREATED_DATE) "
         + "VALUES (140000,'Specialists', '" + sqlDate + "')";
  */

  /*
   String insertSql1 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('2:00 pm','2:30 pm', '1920-08-15','" + sqlDate + "')";
  String insertSql2 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('3:00 pm', '3:30 pm', '1920-08-21','" + sqlDate + "')";
  String insertSql3 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ( '4:00 pm', '4:30 pm','1920-08-14', '" + sqlDate + "')";
  String insertSql4 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('4:30 pm', '5:00 pm', '1920-09-18', '" + sqlDate + "')";
  String insertSql5 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:00 pm', '1:30 pm', '1920-09-21', '" + sqlDate + "')";
  String insertSql6 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:15 pm', '1:45 pm', '1920-09-5', '" + sqlDate + "')";
  String insertSql7 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:40 pm', '2:00 pm', '1920-10-7', '" + sqlDate + "')";
  String insertSql8 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('10:00 pm', '10:30 am', '1920-10-8', '" + sqlDate + "')";
  String insertSql9 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('8:45 am', '9:20 am', '1920-10-17', '" + sqlDate + "')";
  String insertSql10 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('11:00 am', '11:45 am', '1920-11-16', '" + sqlDate + "')";
  String insertSql11 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('10:00 am', '10:30 am', '1920-11-12', '" + sqlDate + "')";
  String insertSql12 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('11:00 am', '11:30 am', '1920-11-12', '" + sqlDate + "')";
  String insertSql13 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ( '11:30 am',  '12:00 pm', '1920-11-12','" + sqlDate + "')";
  String insertSql14 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('12:00 pm', '12:30 pm', '1920-11-12', '" + sqlDate + "')";
  String insertSql15 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('12:30 am','1:00 am','1920-11-12',  '" + sqlDate + "')";

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
        statement.execute(insertSql13);
        statement.execute(insertSql14);
        statement.execute(insertSql15);





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
