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
        
        
 
    
 
//Insert row
 java.util.Date now = new java.util.Date();
 java.sql.Date sqlDate = new java.sql.Date(now.getTime());
 
String insertSqluser1 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
                   + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Roman', 'Ballard','1970-09-12','m',0133434830,"
                   +"'801 Pretlow St, Franklin, VA, 23851','airship@grufefse.cf',111111 ,'" + sqlDate + "')"; 
String insertSqluser2 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Marisela', 'Gadison','1966-05-13','f',0143434830,"
                    +"'63 Twin Peaks Ln, Sequim, WA, 98382','crimsane@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser3 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Cliff', 'Woullard','1989-06-20','m',0153434830,"
                    +"'6908 Longview Beach Rd, Jeffersonville','chrisk@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser4 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Domingo', 'Zobel','1978-11-02','m',0163434830,"
                    +"'8863 Black Point Rd, Syracuse, IN, 46567','aribaud@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser5 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Andria', 'Straley','1978-04-19','f',0153174830,"
                    +"'10318 Kk Rd, Rapid River, MI, 49878','iamcal@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser6 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Santina', 'Linker','1994-03-17','f',0163184830,"
                    +"'87 Gore Rd, Lancaster, NH, 03584','msloan@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser7 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Lucretia', 'Grissom','1965-07-06','f',0173194830,"
                    +"'150 Barren, Conshohocken, PA, 19428 ','kodeman@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser8 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Tianna', 'Nielson','1955-08-23','f',0183420830,"
                    +"'30 Northington Dr, Avon, CT, 06001 ','delpino@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser9 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Angelia', 'Sisk','1998-03-16','f',0193214830,"
                    +"'472 870th Hwy, Winnsboro, LA, 71295','arnold@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser10 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Sheilah', 'Rueb','1979-09-26','f',0203224830,"
                    +"'625 E Plum St, Vineland, NJ, 08360','portele@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser11 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Mafalda', 'Call','1984-01-02','f',0213234830,"
                    +"'234 E Black Point Rd, Syracuse, IN, 46567 ','presoff@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser12 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Lilia', 'Thorsen','1995-08-12','f',0222434830,"
                    +"'23 Gore st, Lancaster, NH, 03584','vsprintf@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser13 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
        + "VALUES ('Mafalda', 'Thorsen','1998-05-07','f',0092434830,"
        +"'77 Gore st, hamilton, NH, 03584','Mafalda@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser14 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
        + "VALUES ('Lilia', 'Sheilah','1973-04-11','f',0222434830,"
        +"'567 Gore st, Lancaster, NH, 03584','Lilia45@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser15 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
        + "VALUES ('Angelia', 'Thorsen','1975-09-30','f',0792434830,"
        +"'568 Gore st, Lancaster, NH, 03584','Angelia56@grufefse.cf',111111 ,'" + sqlDate + "')"; 
String insertSqluser16 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
                  + "phoneNumber, address, email, password, CREATED_DATE) "
                  + "VALUES ('Ballard','Roman', '1970-09-12','m',0133434830,"
                  +"'801 Pretlow St, Franklin, VA, 23851','rrirship@grufefse.cf',111111 ,'" + sqlDate + "')"; 
String insertSqluser17 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Gadison','Marisela', '1970-09-12','m',0143434830,"
                   +"'63 Twin Peaks Ln, Sequim, WA, 98382','hgimsane@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser18 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Woullard','Cliff', '1970-09-12','m',0153434830,"
                   +"'6908 Longview Beach Rd, Jeffersonville','jfrisk@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser19 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Zobel','Domingo', '1970-09-12','m',0163434830,"
                   +"'8863 Black Point Rd, Syracuse, IN, 46567','mjibaud@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser20 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Straley','Andria', '1970-09-12','m',0153174830,"
                   +"'10318 Kk Rd, Rapid River, MI, 49878','rsmcal@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser21 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Linker','Santina', '1970-09-12','m',0163184830,"
                   +"'87 Gore Rd, Lancaster, NH, 03584','wfloan@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser22 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Grissom','Lucretia', '1970-09-12','m',0173194830,"
                   +"'150 Barren, Conshohocken, PA, 19428 ','kudeman@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser23 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Nielson','Tianna', '1970-09-12','m',0183420830,"
                   +"'30 Northington Dr, Avon, CT, 06001 ','whlpino@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser24 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Sisk','Angelia', '1970-09-12','m',0193214830,"
                   +"'472 870th Hwy, Winnsboro, LA, 71295','ulnold@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser25 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Rueb','Sheilah', '1970-09-12','m',0203224830,"
                   +"'625 E Plum St, Vineland, NJ, 08360','qdrtele@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser26 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Call','Mafalda', '1970-09-12','m',0213234830,"
                   +"'234 E Black Point Rd, Syracuse, IN, 46567 ','whgsoff@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser27 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Thorsen','Lilia', '1970-09-12','m',0222434830,"
                   +"'23 Gore st, Lancaster, NH, 03584','typrintf@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser28 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
       + "VALUES ('Thorsen','Mafalda', '1970-09-12','m',0092434830,"
       +"'77 Gore st, hamilton, NH, 03584','enfalda@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser29 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
       + "VALUES ('Sheilah','Lilia', '1970-09-12','m',0222434830,"
       +"'567 Gore st, Lancaster, NH, 03584','oplia45@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSqluser30 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
       + "VALUES ('Angelia', 'Thorsen','1970-09-12','m',0792434830,"
       +"'568 Gore st, Lancaster, NH, 03584','qrgelia56@grufefse.cf',111111 ,'" + sqlDate + "')"; 

 
    
  String insertSqlprescription1 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
       + "prescribedAmount,frequency,CREATED_DATE) "
       + "VALUES ('hydrocodone', '1000 mg',true,'500 mg','2 times', '" + sqlDate + "')";
  String insertSqlprescription2 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('levothyroxine', '800 mg',false,'800 mg','no' ,'" + sqlDate + "')";
  String insertSqlprescription3 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('prednisone', '1000 mg', true,'1000 mg','no' ,'" + sqlDate + "')";
  String insertSqlprescription4 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('amoxicillin', '800 mg',false,'400 mg','1 times' , '" + sqlDate + "')";
  String insertSqlprescription5 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('gabapentin', '200 mg',true,'200 mg','no' , '" + sqlDate + "')";
  String insertSqlprescription6 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('lisinopril', '500 mg',true,'500 mg','no' , '" + sqlDate + "')";
  String insertSqlprescription7 ="INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('atorvastatin', '800 mg',true,'800 mg','no' , '" + sqlDate + "')";
  String insertSqlprescription8 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('metformin', '1000 mg', false,'800 mg','1 times' ,'" + sqlDate + "')";
  String insertSqlprescription9 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ondansetron', '1000 mg',true,'800 mg','1 times' , '" + sqlDate + "')";
  String insertSqlprescription10 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ibuprofen', '800 mg',false,'800 mg','no' , '" + sqlDate + "')";
  String insertSqlprescription11 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ibuprofen', '700 mg', true,'700 mg','no' ,'" + sqlDate + "')";
  String insertSqlprescription12 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('naproxen', '1000 mg',false,'800 mg','1 times' , '" + sqlDate + "')";
  String insertSqlprescription13 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('acetaminophen', '2000 mg',true,'800 mg','2 times' , '" + sqlDate + "')";
  String insertSqlprescription14 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('ibuprofen', '500 mg',false,'500 mg','no' , '" + sqlDate + "')";
  String insertSqlprescription15 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
          + "prescribedAmount,frequency,CREATED_DATE) "
          + "VALUES ('naproxen', '1000 mg',true,'800 mg','1 times' , '" + sqlDate + "')";
    
   
  String insertSqlnote1 = "INSERT INTO note (detail, date, CREATED_DATE) "
          + "VALUES ('Blood pressure is lower. Feet are inspected and there are no callouses, no compromised skin. No vision complaints.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote2 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('Oral cavity and pharynx normal. No inflammation, swelling, exudate, or lesions. Teeth and gingiva in good general condition.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote3 = "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('External auditory canals and tympanic membranes clear, hearing ','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote4 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('Neck supple, non-tender without lymphadenopathy, masses or thyromegaly.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote5 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('No inflammation, swelling, exudate, or lesions. Teeth and gingiva in good general condition.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote6 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('No significant deformity or joint abnormality. No edema. Peripheral pulses intact. No varicosities.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote7 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('The head is normocephalic and atraumatic.  The head and neck are nontender without thyromegaly or adenopathy.  ','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote8 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('LUNGS:  Clear to auscultation. ABDOMEN:  Soft and nontender.', '1920-09-12','" + sqlDate + "')";
  String insertSqlnote9 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('EXTREMITIES:  No cyanosis, clubbing or edema in the extremities.', '1920-09-12','" + sqlDate + "')";
  String insertSqlnote10 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('The patient is pleasant, appears her stated age.  Body habitus is mesomorphic.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote11 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('VITAL SIGNS:  Currently stable.  The patient is afebrile.', '1920-09-12','" + sqlDate + "')";
  String insertSqlnote12 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('SKIN AND EXTREMITIES:  No skin rashes or lesions are noted.  No cyanosis, clubbing or edema of the extremities.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote13 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('HEART:  Regular rate and rhythm.LUNGS:  Clear to auscultation.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote14 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('GENERAL:  The patient is a well-developed, well-nourished male in no acute distress, oriented x3.','1920-09-12', '" + sqlDate + "')";
  String insertSqlnote15 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('LUNGS:  Clear to auscultation bilaterally. No wheezes, rales or rhonchi.','1920-09-12', '" + sqlDate + "')";
   
     
   String insertSqlpatient1 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (62,'Latex Allergy ', 101,'2020-06-12','2020-06-18','" + sqlDate + "')";
   String insertSqlpatient2 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (63,'Cold & Flu' ,104,'2020-03-3','2020-03-14','" + sqlDate + "')";
   String insertSqlpatient3 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (64,'High Cholesterol',105 ,'2020-07-13','2020-07-16','" + sqlDate + "')";
   String insertSqlpatient4 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (65,'HIV/AIDS',106 ,'2020-01-15','2020-01-16','" + sqlDate + "')";
   String insertSqlpatient5 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (66,'COVID-19',107 ,'2020-01-11','2020-04-11','" + sqlDate + "')";
   String insertSqlpatient6 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (67,'Lung Conditions',108,'2020-05-10','2020-05-23','" + sqlDate + "')";
   String insertSqlpatient7 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (68,'Cancer',109 ,'2020-02-01','2020-02-14','" + sqlDate + "')";
   String insertSqlpatient8 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (69,'COVID-19',110 ,'2020-03-01','2020-03-17','" + sqlDate + "')";
   String insertSqlpatient9 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (70,'Measles',111 ,'2020-05-01','2020-05-19','" + sqlDate + "')";
   String insertSqlpatient10 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (71,'Lung cancer',112 ,'2020-06-01','2020-06-20','" + sqlDate + "')";
   String insertSqlpatient11 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (82,'COVID-19',113 ,'2020-04-01','2020-04-24','" + sqlDate + "')";
   String insertSqlpatient12 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (83,'Depression',114 ,'2019-12-01','2019-12-26','" + sqlDate + "')";
   String insertSqlpatient13 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (84,'Bipolar disorder',115 ,'2020-07-01','2020-07-18','" + sqlDate + "')";
   String insertSqlpatient14 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (85,'Glaucoma',117 ,'2020-01-2','2020-01-20','" + sqlDate + "')";
   String insertSqlpatient15 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (86,'Epilepsy',119 ,'2020-02-13','2020-02-23','" + sqlDate + "')";  
   
   
   String insertSqlmedhist1 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
         + "diseases,symptoms,familyHistory, CREATED_DATE) "
         + "VALUES (62,'Clindamycin', 'Latex Allergy','Asthma',"
         +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist2 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (63,'Ibuprofen', 'Food Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist3 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (64,'Adderall', 'Mold Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist4 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (65,'Amlodipine', 'Pet Allergy','none',"
           +"'breathlessness, Muscle aches','none','" + sqlDate + "')";
   String insertSqlmedhist5 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (66,'Omeprazole', 'Pollen Allergy','Asthma',"
           +"'Fever','none','" + sqlDate + "')";
   String insertSqlmedhist6 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (67,'Amoxicillin', 'Food Allergy','none',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist7 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (68,'Loratadine', 'Pollen Allergy','hemochromatosis',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist8 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (69,'Trazodone', 'Food Allergy','Asthma',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist9 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (70,'Ozempic', 'Pet Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist10 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (71,'Benzonatate', 'Drug Allergy','none',"
           +"'breathlessness, Muscle aches','none','" + sqlDate + "')";
   String insertSqlmedhist11 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (82,'Kevzara', 'Insect Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist12 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (83,'Lisinopril', 'Drug Allergy','none',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist13 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (84,'Benzonatate', 'Drug Allergy','none',"
           +"'chest tightness','none','" + sqlDate + "')";
   String insertSqlmedhist14 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (85,'Ozempic', 'none','none',"
           +"'Coughing','none','" + sqlDate + "')";
   String insertSqlmedhist15 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (86,'Trazodone', 'Insect Allergy','none',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')"; 
    

    String insertSqlorder1 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
          + "VALUES (16,57, '" + sqlDate + "')";
    String insertSqlorder2 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (17,81, '" + sqlDate + "')";
    String insertSqlorder3 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (18,59, '" + sqlDate + "')";
    String insertSqlorder4 ="INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (19,60, '" + sqlDate + "')";
    String insertSqlorder5 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (20,72, '" + sqlDate + "')";
    String insertSqlorder6 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (21,76, '" + sqlDate + "')";
    String insertSqlorder7 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (22,78, '" + sqlDate + "')";
    String insertSqlorder8 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (23,80, '" + sqlDate + "')";
    String insertSqlorder9 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (24,81, '" + sqlDate + "')";
    String insertSqlorder10 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (25,57, '" + sqlDate + "')";
    String insertSqlorder11 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (26,59, '" + sqlDate + "')";
    String insertSqlorder12 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (27,60, '" + sqlDate + "')";
    String insertSqlorder13 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (28,72, '" + sqlDate + "')";
    String insertSqlorder14 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (29,76, '" + sqlDate + "')";
    String insertSqlorder15 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (30,78, '" + sqlDate + "')";
   
   
   String insertSqlcreateapp1 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
         + "VALUES (16,58, '" + sqlDate + "')";
   String insertSqlcreateapp2 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (17,61, '" + sqlDate + "')";
   String insertSqlcreateapp3 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (18,73, '" + sqlDate + "')";
   String insertSqlcreateapp4 ="INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (19,76, '" + sqlDate + "')";
   String insertSqlcreateapp5 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (20,58, '" + sqlDate + "')";
   String insertSqlcreateapp6 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (21,61, '" + sqlDate + "')";
   String insertSqlcreateapp7 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (22,73, '" + sqlDate + "')";
   String insertSqlcreateapp8 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (23,76, '" + sqlDate + "')";
   String insertSqlcreateapp9 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (24,58, '" + sqlDate + "')";
   String insertSqlcreateapp10 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (25,61, '" + sqlDate + "')";
   String insertSqlcreateapp11 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (26,73, '" + sqlDate + "')";
   String insertSqlcreateapp12 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (27,76, '" + sqlDate + "')";
   String insertSqlcreateapp13 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (28,58, '" + sqlDate + "')";
   String insertSqlcreateapp14 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (29,73, '" + sqlDate + "')";
   String insertSqlcreateapp15 = "INSERT INTO EmployeeCreatesAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (30,73, '" + sqlDate + "')";

 
String insertSqlpatientapp1 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
      + "VALUES (62,16, '" + sqlDate + "')";
String insertSqlpatientapp2 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (63,17, '" + sqlDate + "')";
String insertSqlpatientapp3 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (64,18, '" + sqlDate + "')";
String insertSqlpatientapp4 ="INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (65,19, '" + sqlDate + "')";
String insertSqlpatientapp5 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (66,20, '" + sqlDate + "')";
String insertSqlpatientapp6 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (67,21, '" + sqlDate + "')";
String insertSqlpatientapp7 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (68,22, '" + sqlDate + "')";
String insertSqlpatientapp8 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (86,23, '" + sqlDate + "')";
String insertSqlpatientapp9 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (69,24, '" + sqlDate + "')";
String insertSqlpatientapp10 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (70,25, '" + sqlDate + "')";
String insertSqlpatientapp11 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (71,26, '" + sqlDate + "')";
String insertSqlpatientapp12 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (82,27, '" + sqlDate + "')";
String insertSqlpatientapp13 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (83,28, '" + sqlDate + "')";
String insertSqlpatientapp14 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (84,29, '" + sqlDate + "')";
String insertSqlpatientapp15 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (85,30, '" + sqlDate + "')";

  

   String insertSqlemppat1 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
         + "VALUES (62,57, '" + sqlDate + "')";
   String insertSqlemppat2 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (63,58, '" + sqlDate + "')";
   String insertSqlemppat3 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (64,59, '" + sqlDate + "')";
   String insertSqlemppat4 ="INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (65,60, '" + sqlDate + "')";
   String insertSqlemppat5 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (66,61, '" + sqlDate + "')";
   String insertSqlemppat6 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (67,72,'" + sqlDate + "')";
   String insertSqlemppat7 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (68,73, '" + sqlDate + "')";
   String insertSqlemppat8 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (69,74, '" + sqlDate + "')";
   String insertSqlemppat9 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (71,75, '" + sqlDate + "')";
   String insertSqlemppat10 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (82,76, '" + sqlDate + "')";
   String insertSqlemppat11 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (83,77, '" + sqlDate + "')";
   String insertSqlemppat12 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (84,78, '" + sqlDate + "')";
   String insertSqlemppat13 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (85,79, '" + sqlDate + "')";
   String insertSqlemppat14 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (70,80, '" + sqlDate + "')";
   String insertSqlemppat15 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (86,81, '" + sqlDate + "')";


   String insertSqlpatnote1 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
         + "VALUES (62,41, '" + sqlDate + "')";
   String insertSqlpatnote2 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (63,42, '" + sqlDate + "')";
   String insertSqlpatnote3 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (64,43, '" + sqlDate + "')";
   String insertSqlpatnote4 ="INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (65,44, '" + sqlDate + "')";
   String insertSqlpatnote5 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (66,45, '" + sqlDate + "')";
   String insertSqlpatnote6 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (67,46, '" + sqlDate + "')";
   String insertSqlpatnote7 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (68,47, '" + sqlDate + "')";
   String insertSqlpatnote8 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (69,48, '" + sqlDate + "')";
   String insertSqlpatnote9 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (70,49, '" + sqlDate + "')";
   String insertSqlpatnote10 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (71,50, '" + sqlDate + "')";
   String insertSqlpatnote11 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (82,51, '" + sqlDate + "')";
   String insertSqlpatnote12 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (83,52, '" + sqlDate + "')";
   String insertSqlpatnote13 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (84,53, '" + sqlDate + "')";
   String insertSqlpatnote14 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (85,54, '" + sqlDate + "')";
   String insertSqlpatnote15 = "INSERT INTO patientHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (86,55, '" + sqlDate + "')";

   
     String insertSqlempnote1 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
           + "VALUES (57,41, '" + sqlDate + "')";
     String insertSqlempnote2 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (58,42, '" + sqlDate + "')";
     String insertSqlempnote3 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (59,43, '" + sqlDate + "')";
     String insertSqlempnote4 ="INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (60,44, '" + sqlDate + "')";
     String insertSqlempnote5 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (61,45, '" + sqlDate + "')";
     String insertSqlempnote6 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (72,46, '" + sqlDate + "')";
     String insertSqlempnote7 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (73,47, '" + sqlDate + "')";
     String insertSqlempnote8 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (74,48, '" + sqlDate + "')";
     String insertSqlempnote9 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (75,49, '" + sqlDate + "')";
     String insertSqlempnote10 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (76,50, '" + sqlDate + "')";
     String insertSqlempnote11 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (77,51, '" + sqlDate + "')";
     String insertSqlempnote12 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (78,52, '" + sqlDate + "')";
     String insertSqlempnote13 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (79,53, '" + sqlDate + "')";
     String insertSqlempnote14 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (80,54, '" + sqlDate + "')";
     String insertSqlempnote15 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (81,55, '" + sqlDate + "')";
    

 String insertSqlpatpres1 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
       + "VALUES (62,16, '" + sqlDate + "')";
 String insertSqlpatpres2 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (63,17, '" + sqlDate + "')";
 String insertSqlpatpres3 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (64,18, '" + sqlDate + "')";
 String insertSqlpatpres4 ="INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (65,19, '" + sqlDate + "')";
 String insertSqlpatpres5 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (66,20, '" + sqlDate + "')";
 String insertSqlpatpres6 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (67,21, '" + sqlDate + "')";
 String insertSqlpatpres7 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (68,22, '" + sqlDate + "')";
 String insertSqlpatpres8 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (69,23, '" + sqlDate + "')";
 String insertSqlpatpres9 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (70,24, '" + sqlDate + "')";
 String insertSqlpatpres10 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (71,25, '" + sqlDate + "')";
 String insertSqlpatpres11 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (82,26, '" + sqlDate + "')";
 String insertSqlpatpres12 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (83,27, '" + sqlDate + "')";
 String insertSqlpatpres13 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (84,28, '" + sqlDate + "')";
 String insertSqlpatpres14 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (85,29, '" + sqlDate + "')";
 String insertSqlpatpres15 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (86,30, '" + sqlDate + "')";
         
 
 
 String insertSqlemployee1 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (57,120000,'Specialists','1970-09-12', '" + sqlDate + "')";
 String insertSqlemployee2 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (58,100000,'Nurses','1970-09-12', '" + sqlDate + "')";
 String insertSqlemployee3 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (59,150000,'Surgeons','1971-09-12', '" + sqlDate + "')";
 String insertSqlemployee4 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (60,150000,'Specialists','1972-09-12', '" + sqlDate + "')";
 String insertSqlemployee5 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (61,100000,'Nurses','1973-09-12', '" + sqlDate + "')";
 String insertSqlemployee6 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (72,160000,'Surgeons','1970-09-12', '" + sqlDate + "')";
 String insertSqlemployee7 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (73,140000,'Nurses','1970-09-01', '" + sqlDate + "')";
 String insertSqlemployee8 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (74,150000,'Pharmacists','1990-09-12', '" + sqlDate + "')";
 String insertSqlemployee9 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (75,130000,'Pharmacists','1995-09-12', '" + sqlDate + "')";
 String insertSqlemployee10 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (76,120000,'Surgeons','1995-09-12', '" + sqlDate + "')";
 String insertSqlemployee11 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (77,135000,'Pharmacists','1999-09-12', '" + sqlDate + "')";
 String insertSqlemployee12 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (78,160000,'Surgeons','2000-09-12', '" + sqlDate + "')";
 String insertSqlemployee13 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (79,136000,'Nurses','2000-09-12', '" + sqlDate + "')";
 String insertSqlemployee14 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (80,110000,'Surgeons','1970-09-12', '" + sqlDate + "')";
 String insertSqlemployee15 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (81,140000,'Specialists','1980-09-12', '" + sqlDate + "')";
   

  
  String insertSqlappointment1 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('2:00','2:30', '1920-08-15','" + sqlDate + "')";
  String insertSqlappointment2 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('3:00', '3:30', '1920-08-21','" + sqlDate + "')";
  String insertSqlappointment3 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ( '4:00', '4:30','1920-08-14', '" + sqlDate + "')";
  String insertSqlappointment4 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('4:30', '5:00', '1920-09-18', '" + sqlDate + "')";
  String insertSqlappointment5 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:00', '1:30', '1920-09-21', '" + sqlDate + "')";
  String insertSqlappointment6 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:15', '1:45', '1920-09-5', '" + sqlDate + "')";
  String insertSqlappointment7 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:40', '2:00', '1920-10-7', '" + sqlDate + "')";
  String insertSqlappointment8 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('10:00', '10:30', '1920-10-8', '" + sqlDate + "')";
  String insertSqlappointment9 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('8:45', '9:20', '1920-10-17', '" + sqlDate + "')";
  String insertSqlappointment10 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('11:00', '11:45', '1920-11-16', '" + sqlDate + "')";
  String insertSqlappointment11 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('10:00', '10:30', '1920-11-12', '" + sqlDate + "')";
  String insertSqlappointment12 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('11:00', '11:30', '1920-11-12', '" + sqlDate + "')";
  String insertSqlappointment13 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ( '11:30',  '12:00', '1920-11-12','" + sqlDate + "')";
  String insertSqlappointment14 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('12:00', '12:30', '1920-11-12', '" + sqlDate + "')";
  String insertSqlappointment15 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('12:30','1:00','1920-11-12',  '" + sqlDate + "')";
 

  
 Statement statement = connection.createStatement();
        statement.execute(insertSqluser1);
        statement.execute(insertSqluser2);
        statement.execute(insertSqluser3);
        statement.execute(insertSqluser4);
        statement.execute(insertSqluser5);
        statement.execute(insertSqluser6);
        statement.execute(insertSqluser7);
        statement.execute(insertSqluser8);
        statement.execute(insertSqluser9); 
        statement.execute(insertSqluser10);
        statement.execute(insertSqluser11);
        statement.execute(insertSqluser12); 
        statement.execute(insertSqluser13);
        statement.execute(insertSqluser14);
        statement.execute(insertSqluser15);
        statement.execute(insertSqluser16);
        statement.execute(insertSqluse(17);
        statement.execute(insertSqluser18);
        statement.execute(insertSqluser19);
        statement.execute(insertSqluser20);
        statement.execute(insertSqluser21);
        statement.execute(insertSqluser22);
        statement.execute(insertSqluser23);
        statement.execute(insertSqluser24); 
        statement.execute(insertSqluser25);
        statement.execute(insertSqluser26);
        statement.execute(insertSqluser27); 
        statement.execute(insertSqluser28);
        statement.execute(insertSqluser29);
        statement.execute(insertSqluser30); 
        
        statement.execute(insertSqlprescription1);
        statement.execute(insertSqlprescription2);
        statement.execute(insertSqlprescription3);
        statement.execute(insertSqlprescription4);
        statement.execute(insertSqlprescription5);
        statement.execute(insertSqlprescription6);
        statement.execute(insertSqlprescription7);
        statement.execute(insertSqlprescription8);
        statement.execute(insertSqlprescription9); 
        statement.execute(insertSqlprescription10);
        statement.execute(insertSqlprescription11);
        statement.execute(insertSqlprescription12); 
        statement.execute(insertSqlprescription13);
        statement.execute(insertSqlprescription14);
        statement.execute(insertSqlprescription15); 
        
        statement.execute(insertSqlnote1);
        statement.execute(insertSqlnote2);
        statement.execute(insertSqlnote3);
        statement.execute(insertSqlnote4);
        statement.execute(insertSqlnote5);
        statement.execute(insertSqlnote6);
        statement.execute(insertSqlnote7);
        statement.execute(insertSqlnote8);
        statement.execute(insertSqlnote9); 
        statement.execute(insertSqlnote10);
        statement.execute(insertSqlnote11);
        statement.execute(insertSqlnote12); 
        statement.execute(insertSqlnote13);
        statement.execute(insertSqlnote14);
        statement.execute(insertSqlnote15); 
        
        statement.execute(insertSqlpatient1);
        statement.execute(insertSqlpatient2);
        statement.execute(insertSqlpatient3);
        statement.execute(insertSqlpatient4);
        statement.execute(insertSqlpatient5);
        statement.execute(insertSqlpatient6);
        statement.execute(insertSqlpatient7);
        statement.execute(insertSqlpatient8);
        statement.execute(insertSqlpatient9); 
        statement.execute(insertSqlpatient10);
        statement.execute(insertSqlpatient11);
        statement.execute(insertSqlpatient12); 
        statement.execute(insertSqlpatient13);
        statement.execute(insertSqlpatient14);
        statement.execute(insertSqlpatient15);
        
        
        statement.execute(insertSqlmedhist1);
        statement.execute(insertSqlmedhist2);
        statement.execute(insertSqlmedhist3);
        statement.execute(insertSqlmedhist4);
        statement.execute(insertSqlmedhist5);
        statement.execute(insertSqlmedhist6);
        statement.execute(insertSqlmedhist7);
        statement.execute(insertSqlmedhist8);
        statement.execute(insertSqlmedhist9); 
        statement.execute(insertSqlmedhist10);
        statement.execute(insertSqlmedhist11);
        statement.execute(insertSqlmedhist12); 
        statement.execute(insertSqlmedhist13);
        statement.execute(insertSqlmedhist14);
        statement.execute(insertSqlmedhist15);
        
        
        statement.execute(insertSqlorder1);
        statement.execute(insertSqlorder2);
        statement.execute(insertSqlorder3);
        statement.execute(insertSqlorder4);
        statement.execute(insertSqlorder5);
        statement.execute(insertSqlorder6);
        statement.execute(insertSqlorder7);
        statement.execute(insertSqlorder8);
        statement.execute(insertSqlorder9); 
        statement.execute(insertSqlorder10);
        statement.execute(insertSqlorder11);
        statement.execute(insertSqlorder12); 
        statement.execute(insertSqlorder13);
        statement.execute(insertSqlorder14);
        statement.execute(insertSqlorder15);
        
        
        statement.execute(insertSqlcreateapp1);
        statement.execute(insertSqlcreateapp2);
        statement.execute(insertSqlcreateapp3);
        statement.execute(insertSqlcreateapp4);
        statement.execute(insertSqlcreateapp5);
        statement.execute(insertSqlcreateapp6);
        statement.execute(insertSqlcreateapp7);
        statement.execute(insertSqlcreateapp8);
        statement.execute(insertSqlcreateapp9); 
        statement.execute(insertSqlcreateapp10);
        statement.execute(insertSqlcreateapp11);
        statement.execute(insertSqlcreateapp12); 
        statement.execute(insertSqlcreateapp13);
        statement.execute(insertSqlcreateapp14);
        statement.execute(insertSqlcreateapp15);
        
        
        statement.execute(insertSqlpatientapp1);
        statement.execute(insertSqlpatientapp2);
        statement.execute(insertSqlpatientapp3);
        statement.execute(insertSqlpatientapp4);
        statement.execute(insertSqlpatientapp5);
        statement.execute(insertSqlpatientapp6);
        statement.execute(insertSqlpatientapp7);
        statement.execute(insertSqlpatientapp8);
        statement.execute(insertSqlpatientapp9); 
        statement.execute(insertSqlpatientapp10);
        statement.execute(insertSqlpatientapp11);
        statement.execute(insertSqlpatientapp12); 
        statement.execute(insertSqlpatientapp13);
        statement.execute(insertSqlpatientapp14);
        statement.execute(insertSqlpatientapp15);
        
        
        statement.execute(insertSqlemppat1);
        statement.execute(insertSqlemppat2);
        statement.execute(insertSqlemppat3);
        statement.execute(insertSqlemppat4);
        statement.execute(insertSqlemppat5);
        statement.execute(insertSqlemppat6);
        statement.execute(insertSqlemppat7);
        statement.execute(insertSqlemppat8);
        statement.execute(insertSqlemppat9); 
        statement.execute(insertSqlemppat10);
        statement.execute(insertSqlemppat11);
        statement.execute(insertSqlemppat12); 
        statement.execute(insertSqlemppat13);
        statement.execute(insertSqlemppat14);
        statement.execute(insertSqlemppat15);
        
        
        statement.execute(insertSqlpatnote1);
        statement.execute(insertSqlpatnote2);
        statement.execute(insertSqlpatnote3);
        statement.execute(insertSqlpatnote4);
        statement.execute(insertSqlpatnote5);
        statement.execute(insertSqlpatnote6);
        statement.execute(insertSqlpatnote7);
        statement.execute(insertSqlpatnote8);
        statement.execute(insertSqlpatnote9); 
        statement.execute(insertSqlpatnote10);
        statement.execute(insertSqlpatnote11);
        statement.execute(insertSqlpatnote12); 
        statement.execute(insertSqlpatnote13);
        statement.execute(insertSqlpatnote14);
        statement.execute(insertSqlpatnote15);
        
        
        statement.execute(insertSqlempnote1);
        statement.execute(insertSqlempnote2);
        statement.execute(insertSqlempnote3);
        statement.execute(insertSqlempnote4);
        statement.execute(insertSqlempnote5);
        statement.execute(insertSqlempnote6);
        statement.execute(insertSqlempnote7);
        statement.execute(insertSqlempnote8);
        statement.execute(insertSqlempnote9); 
        statement.execute(insertSqlempnote10);
        statement.execute(insertSqlempnote11);
        statement.execute(insertSqlempnote12); 
        statement.execute(insertSqlempnote13);
        statement.execute(insertSqlempnote14);
        statement.execute(insertSqlempnote15);
        
        
        statement.execute(insertSqlpatpres1);
        statement.execute(insertSqlpatpres2);
        statement.execute(insertSqlpatpres3);
        statement.execute(insertSqlpatpres4);
        statement.execute(insertSqlpatpres5);
        statement.execute(insertSqlpatpres6);
        statement.execute(insertSqlpatpres7);
        statement.execute(insertSqlpatpres8);
        statement.execute(insertSqlpatpres9); 
        statement.execute(insertSqlpatpres10);
        statement.execute(insertSqlpatpres11);
        statement.execute(insertSqlpatpres12); 
        statement.execute(insertSqlpatpres13);
        statement.execute(insertSqlpatpres14);
        statement.execute(insertSqlpatpres15);
        
        
        statement.execute(insertSqlemployee1);
        statement.execute(insertSqlemployee2);
        statement.execute(insertSqlemployee3);
        statement.execute(insertSqlemployee4);
        statement.execute(insertSqlemployee5);
        statement.execute(insertSqlemployee6);
        statement.execute(insertSqlemployee7);
        statement.execute(insertSqlemployee8);
        statement.execute(insertSqlemployee9); 
        statement.execute(insertSqlemployee10);
        statement.execute(insertSqlemployee11);
        statement.execute(insertSqlemployee12); 
        statement.execute(insertSqlemployee13);
        statement.execute(insertSqlemployee14);
        statement.execute(insertSqlemployee15);
        
        
        statement.execute(insertSqlappointment1);
        statement.execute(insertSqlappointment2);
        statement.execute(insertSqlappointment3);
        statement.execute(insertSqlappointment4);
        statement.execute(insertSqlappointment5);
        statement.execute(insertSqlappointment6);
        statement.execute(insertSqlappointment7);
        statement.execute(insertSqlappointment8);
        statement.execute(insertSqlappointment9); 
        statement.execute(insertSqlappointment10);
        statement.execute(insertSqlappointment11);
        statement.execute(insertSqlappointment12); 
        statement.execute(insertSqlappointment13);
        statement.execute(insertSqlappointment14);
        statement.execute(insertSqlappointment15);
        
        
        
        statement.close();
        connection.close();
    }catch(Exception ex){
        out.println("Unable to connect to database."+ ex.getMessage());
    }
    
    %>
  </body>
</html>
