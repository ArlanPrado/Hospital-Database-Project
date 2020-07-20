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
 

  /* String insertSql1 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
                   + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Roman', 'Ballard','1970-09-12','m',0133434830,"
                   +"'801 Pretlow St, Franklin, VA, 23851','airship@grufefse.cf',111111 ,'" + sqlDate + "')"; 
String insertSql2 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Marisela', 'Gadison','1970-09-12','m',0143434830,"
                    +"'63 Twin Peaks Ln, Sequim, WA, 98382','crimsane@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql3 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Cliff', 'Woullard','1970-09-12','m',0153434830,"
                    +"'6908 Longview Beach Rd, Jeffersonville','chrisk@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql4 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Domingo', 'Zobel','1970-09-12','m',0163434830,"
                    +"'8863 Black Point Rd, Syracuse, IN, 46567','aribaud@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql5 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Andria', 'Straley','1970-09-12','m',0153174830,"
                    +"'10318 Kk Rd, Rapid River, MI, 49878','iamcal@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql6 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Santina', 'Linker','1970-09-12','m',0163184830,"
                    +"'87 Gore Rd, Lancaster, NH, 03584','msloan@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql7 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Lucretia', 'Grissom','1970-09-12','m',0173194830,"
                    +"'150 Barren, Conshohocken, PA, 19428 ','kodeman@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql8 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Tianna', 'Nielson','1970-09-12','m',0183420830,"
                    +"'30 Northington Dr, Avon, CT, 06001 ','delpino@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql9 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Angelia', 'Sisk','1970-09-12','m',0193214830,"
                    +"'472 870th Hwy, Winnsboro, LA, 71295','arnold@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql10 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Sheilah', 'Rueb','1970-09-12','m',0203224830,"
                    +"'625 E Plum St, Vineland, NJ, 08360','portele@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql11 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Mafalda', 'Call','1970-09-12','m',0213234830,"
                    +"'234 E Black Point Rd, Syracuse, IN, 46567 ','presoff@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql12 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
                    + "VALUES ('Lilia', 'Thorsen','1970-09-12','m',0222434830,"
                    +"'23 Gore st, Lancaster, NH, 03584','vsprintf@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql13 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
        + "VALUES ('Mafalda', 'Thorsen','1970-09-12','m',0092434830,"
        +"'77 Gore st, hamilton, NH, 03584','Mafalda@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql14 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
        + "VALUES ('Lilia', 'Sheilah','1970-09-12','m',0222434830,"
        +"'567 Gore st, Lancaster, NH, 03584','Lilia45@grufefse.cf',111111 ,'" + sqlDate + "')";

String insertSql15 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
        + "phoneNumber, address, email, password, CREATED_DATE) "
        + "VALUES ('Angelia', 'Thorsen','1970-09-12','m',0792434830,"
        +"'568 Gore st, Lancaster, NH, 03584','Angelia56@grufefse.cf',111111 ,'" + sqlDate + "')"; 

  */
//more user
 /*  String insertSql1 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
                  + "phoneNumber, address, email, password, CREATED_DATE) "
                  + "VALUES ('Ballard','Roman', '1970-09-12','m',0133434830,"
                  +"'801 Pretlow St, Franklin, VA, 23851','rrirship@grufefse.cf',111111 ,'" + sqlDate + "')"; 
String insertSql2 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Gadison','Marisela', '1970-09-12','m',0143434830,"
                   +"'63 Twin Peaks Ln, Sequim, WA, 98382','hgimsane@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql3 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Woullard','Cliff', '1970-09-12','m',0153434830,"
                   +"'6908 Longview Beach Rd, Jeffersonville','jfrisk@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql4 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Zobel','Domingo', '1970-09-12','m',0163434830,"
                   +"'8863 Black Point Rd, Syracuse, IN, 46567','mjibaud@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql5 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Straley','Andria', '1970-09-12','m',0153174830,"
                   +"'10318 Kk Rd, Rapid River, MI, 49878','rsmcal@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql6 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Linker','Santina', '1970-09-12','m',0163184830,"
                   +"'87 Gore Rd, Lancaster, NH, 03584','wfloan@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql7 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Grissom','Lucretia', '1970-09-12','m',0173194830,"
                   +"'150 Barren, Conshohocken, PA, 19428 ','kudeman@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql8 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Nielson','Tianna', '1970-09-12','m',0183420830,"
                   +"'30 Northington Dr, Avon, CT, 06001 ','whlpino@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql9 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Sisk','Angelia', '1970-09-12','m',0193214830,"
                   +"'472 870th Hwy, Winnsboro, LA, 71295','ulnold@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql10 ="INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Rueb','Sheilah', '1970-09-12','m',0203224830,"
                   +"'625 E Plum St, Vineland, NJ, 08360','qdrtele@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql11 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Call','Mafalda', '1970-09-12','m',0213234830,"
                   +"'234 E Black Point Rd, Syracuse, IN, 46567 ','whgsoff@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql12 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
                   + "VALUES ('Thorsen','Lilia', '1970-09-12','m',0222434830,"
                   +"'23 Gore st, Lancaster, NH, 03584','typrintf@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql13 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
       + "VALUES ('Thorsen','Mafalda', '1970-09-12','m',0092434830,"
       +"'77 Gore st, hamilton, NH, 03584','enfalda@grufefse.cf',111111 ,'" + sqlDate + "')";
String insertSql14 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
       + "VALUES ('Sheilah','Lilia', '1970-09-12','m',0222434830,"
       +"'567 Gore st, Lancaster, NH, 03584','oplia45@grufefse.cf',111111 ,'" + sqlDate + "')";

String insertSql15 = "INSERT INTO user (firstName,lastName,dateOfBirth,gender,"
       + "phoneNumber, address, email, password, CREATED_DATE) "
       + "VALUES ('Angelia', 'Thorsen','1970-09-12','m',0792434830,"
       +"'568 Gore st, Lancaster, NH, 03584','qrgelia56@grufefse.cf',111111 ,'" + sqlDate + "')"; 

  */
    
 /* String insertSql1 = "INSERT INTO prescription (medicationName,totalAmount,receivedByPatient,"
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
          + "VALUES ('naproxen', '1000 mg',true,'800 mg','1 times' , '" + sqlDate + "')"; 
 */
    
   
  /* String insertSql1 = "INSERT INTO note (detail, date, CREATED_DATE) "
          + "VALUES ('Blood pressure is lower. Feet are inspected and there are no callouses, no compromised skin. No vision complaints.','1920-09-12', '" + sqlDate + "')";
  String insertSql2 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('Oral cavity and pharynx normal. No inflammation, swelling, exudate, or lesions. Teeth and gingiva in good general condition.','1920-09-12', '" + sqlDate + "')";
  String insertSql3 = "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('External auditory canals and tympanic membranes clear, hearing ','1920-09-12', '" + sqlDate + "')";
  String insertSql4 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('Neck supple, non-tender without lymphadenopathy, masses or thyromegaly.','1920-09-12', '" + sqlDate + "')";
  String insertSql5 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('No inflammation, swelling, exudate, or lesions. Teeth and gingiva in good general condition.','1920-09-12', '" + sqlDate + "')";
  String insertSql6 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('No significant deformity or joint abnormality. No edema. Peripheral pulses intact. No varicosities.','1920-09-12', '" + sqlDate + "')";
  String insertSql7 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('The head is normocephalic and atraumatic.  The head and neck are nontender without thyromegaly or adenopathy.  ','1920-09-12', '" + sqlDate + "')";
  String insertSql8 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('LUNGS:  Clear to auscultation. ABDOMEN:  Soft and nontender.', '1920-09-12','" + sqlDate + "')";
  String insertSql9 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('EXTREMITIES:  No cyanosis, clubbing or edema in the extremities.', '1920-09-12','" + sqlDate + "')";
  String insertSql10 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('The patient is pleasant, appears her stated age.  Body habitus is mesomorphic.','1920-09-12', '" + sqlDate + "')";
  String insertSql11 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('VITAL SIGNS:  Currently stable.  The patient is afebrile.', '1920-09-12','" + sqlDate + "')";
  String insertSql12 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('SKIN AND EXTREMITIES:  No skin rashes or lesions are noted.  No cyanosis, clubbing or edema of the extremities.','1920-09-12', '" + sqlDate + "')";
  String insertSql13 =  "INSERT INTO note (detail,date, CREATED_DATE) "
          + "VALUES ('HEART:  Regular rate and rhythm.LUNGS:  Clear to auscultation.','1920-09-12', '" + sqlDate + "')";
  String insertSql14 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('GENERAL:  The patient is a well-developed, well-nourished male in no acute distress, oriented x3.','1920-09-12', '" + sqlDate + "')";
  String insertSql15 =  "INSERT INTO note (detail, date,CREATED_DATE) "
          + "VALUES ('LUNGS:  Clear to auscultation bilaterally. No wheezes, rales or rhonchi.','1920-09-12', '" + sqlDate + "')";
     
     */
     
    /* String insertSql1 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (62,'Latex Allergy ', 101,'1970-09-12','1970-09-18','" + sqlDate + "')";
   String insertSql2 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (63,'Cold & Flu' ,104,'1972-09-3','1972-09-14','" + sqlDate + "')";
   String insertSql3 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (64,'Cholesterol',105 ,'1973-09-13','1973-09-16','" + sqlDate + "')";
   String insertSql4 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (65,'HIV/AIDS',106 ,'1974-09-15','1974-11-16','" + sqlDate + "')";
   String insertSql5 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (66,'Infectious Disease',107 ,'1975-01-11','1975-04-11','" + sqlDate + "')";
   String insertSql6 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (67,'Lung Conditions',108,'1976-09-10','1976-09-23','" + sqlDate + "')";
   String insertSql7 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (68,'Cancer',109 ,'1977-09-01','1977-09-14','" + sqlDate + "')";
   String insertSql8 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (69,'Tuberculosisa',110 ,'1978-09-01','1978-09-17','" + sqlDate + "')";
   String insertSql9 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (70,'Measlesa',111 ,'1979-09-01','1979-09-19','" + sqlDate + "')";
   String insertSql10 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (71,'Lung cancer',112 ,'1979-09-01','1979-09-20','" + sqlDate + "')";
   String insertSql11 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (82,'Stomach cancer',113 ,'1970-08-01','1970-08-24','" + sqlDate + "')";
   String insertSql12 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (83,'Depression',114 ,'1977-12-01','1977-12-26','" + sqlDate + "')";
   String insertSql13 = "INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (84,'Bipolar disorder',114 ,'1969-10-01','1969-10-18','" + sqlDate + "')";
   String insertSql14 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (85,'Glaucoma',117 ,'2012-01-2','2012-01-20','" + sqlDate + "')";
   String insertSql15 ="INSERT INTO patient (patientID,diagnosis,room,admissionDate,dischargeDate, CREATED_DATE) "
           + "VALUES (86,'Epilepsy',119 ,'2013-02-13','2013-02-23','" + sqlDate + "')";  
       */
    
  /*   
    String insertSql1 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
         + "diseases,symptoms,familyHistory, CREATED_DATE) "
         + "VALUES (62,'Clindamycin', 'Latex Allergy','Asthma',"
         +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql2 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (63,'Ibuprofen', 'Food Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
    
   String insertSql3 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (64,'Adderall', 'Mold Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql4 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (65,'Amlodipine', 'Pet Allergy','none',"
           +"'breathlessness, Muscle aches','none','" + sqlDate + "')";
   String insertSql5 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (66,'Omeprazole', 'Pollen Allergy','Asthma',"
           +"'Fever','none','" + sqlDate + "')";
   String insertSql6 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (67,'Amoxicillin', 'Food Allergy','none',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql7 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (68,'Loratadine', 'Pollen Allergy','hemochromatosis',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql8 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (69,'Trazodone', 'Food Allergy','Asthma',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";
   String insertSql9 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (70,'Ozempic', 'Pet Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql10 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (71,'Benzonatate', 'Drug Allergy','none',"
           +"'breathlessness, Muscle aches','none','" + sqlDate + "')";
   String insertSql11 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (82,'Kevzara', 'Insect Allergy','Asthma',"
           +"'breathlessness, chest tightness','none','" + sqlDate + "')";
   String insertSql12 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (83,'Lisinopril', 'Drug Allergy','none',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')";
    
   String insertSql13 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (84,'Benzonatate', 'Drug Allergy','none',"
           +"'chest tightness','none','" + sqlDate + "')";
    
   String insertSql14 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (85,'Ozempic', 'none','none',"
           +"'Coughing','none','" + sqlDate + "')";
    
   String insertSql15 = "INSERT INTO patientMedicalHistory (patientID,medications,allergies,"
           + "diseases,symptoms,familyHistory, CREATED_DATE) "
           + "VALUES (86,'Trazodone', 'Insect Allergy','none',"
           +"'Coughing, chest tightness','none','" + sqlDate + "')"; 
      */
    



     
    /* String insertSql1 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
          + "VALUES (16,57, '" + sqlDate + "')";
    String insertSql2 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (17,81, '" + sqlDate + "')";
    String insertSql3 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (18,59, '" + sqlDate + "')";
    String insertSql4 ="INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (19,60, '" + sqlDate + "')";
    String insertSql5 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (20,72, '" + sqlDate + "')";
    String insertSql6 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (21,76, '" + sqlDate + "')";
    String insertSql7 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (22,78, '" + sqlDate + "')";
    String insertSql8 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (23,80, '" + sqlDate + "')";
    String insertSql9 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (24,81, '" + sqlDate + "')";
    String insertSql10 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (25,57, '" + sqlDate + "')";
    String insertSql11 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (26,59, '" + sqlDate + "')";
    String insertSql12 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (27,60, '" + sqlDate + "')";
    String insertSql13 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (28,72, '" + sqlDate + "')";
    String insertSql14 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (29,76, '" + sqlDate + "')";
    String insertSql15 = "INSERT INTO EmployeeOrdersPrescription (prescriptionID,employeeID, CREATED_DATE) "
            + "VALUES (30,78, '" + sqlDate + "')";
 */
   
   
 
   
    /*   
   String insertSql1 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
         + "VALUES (16,58, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (17,61, '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (18,73, '" + sqlDate + "')";
   String insertSql4 ="INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (19,76, '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (20,58, '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (21,61, '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (22,73, '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (23,76, '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (24,58, '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (25,61, '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (26,73, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (27,76, '" + sqlDate + "')";
   String insertSql13 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (28,58, '" + sqlDate + "')";
   String insertSql14 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (29,73, '" + sqlDate + "')";
   String insertSql15 = "INSERT INTO EmployeeCreateAppointment (appointmentID,employeeID, CREATED_DATE) "
           + "VALUES (30,73, '" + sqlDate + "')";

  
  */
 
 /* String insertSql1 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
      + "VALUES (62,16, '" + sqlDate + "')";
String insertSql2 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (63,17, '" + sqlDate + "')";
String insertSql3 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (64,18, '" + sqlDate + "')";
String insertSql4 ="INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (65,19, '" + sqlDate + "')";
String insertSql5 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (66,20, '" + sqlDate + "')";
String insertSql6 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (67,21, '" + sqlDate + "')";
String insertSql7 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (68,22, '" + sqlDate + "')";
String insertSql8 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (86,23, '" + sqlDate + "')";
String insertSql9 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (69,24, '" + sqlDate + "')";
String insertSql10 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (70,25, '" + sqlDate + "')";
String insertSql11 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (71,26, '" + sqlDate + "')";
String insertSql12 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (82,27, '" + sqlDate + "')";
String insertSql13 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (83,28, '" + sqlDate + "')";
String insertSql14 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (84,29, '" + sqlDate + "')";
String insertSql15 = "INSERT INTO PatientHasAppointment (patientID,appointmentID, CREATED_DATE) "
        + "VALUES (85,30, '" + sqlDate + "')";
 */

  

 /* String insertSql1 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
         + "VALUES (62,57, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (63,58, '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (64,59, '" + sqlDate + "')";
   String insertSql4 ="INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (65,60, '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (66,61, '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (67,72,'" + sqlDate + "')";
   String insertSql7 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (68,73, '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (69,74, '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (71,75, '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (82,76, '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (83,77, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (84,78, '" + sqlDate + "')";
   String insertSql13 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (85,79, '" + sqlDate + "')";
   String insertSql14 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (70,80, '" + sqlDate + "')";
   String insertSql15 = "INSERT INTO employeeHasPatients (patientID,employeeID, CREATED_DATE) "
           + "VALUES (86,81, '" + sqlDate + "')";
 */

/* 
   String insertSql1 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
         + "VALUES (62,41, '" + sqlDate + "')";
   String insertSql2 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (63,42, '" + sqlDate + "')";
   String insertSql3 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (64,43, '" + sqlDate + "')";
   String insertSql4 ="INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (65,44, '" + sqlDate + "')";
   String insertSql5 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (66,45, '" + sqlDate + "')";
   String insertSql6 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (67,46, '" + sqlDate + "')";
   String insertSql7 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (68,47, '" + sqlDate + "')";
   String insertSql8 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (69,48, '" + sqlDate + "')";
   String insertSql9 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (70,49, '" + sqlDate + "')";
   String insertSql10 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (71,50, '" + sqlDate + "')";
   String insertSql11 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (82,51, '" + sqlDate + "')";
   String insertSql12 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (83,52, '" + sqlDate + "')";
   String insertSql13 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (84,53, '" + sqlDate + "')";
   String insertSql14 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (85,54, '" + sqlDate + "')";
   String insertSql15 = "INSERT INTO patientsHasNote (patientID,noteID, CREATED_DATE) "
           + "VALUES (86,55, '" + sqlDate + "')";

  */
   
   
  /* 
     String insertSql1 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
           + "VALUES (57,41, '" + sqlDate + "')";
     String insertSql2 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (58,42, '" + sqlDate + "')";
     String insertSql3 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (59,43, '" + sqlDate + "')";
     String insertSql4 ="INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (60,44, '" + sqlDate + "')";
     String insertSql5 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (61,45, '" + sqlDate + "')";
     String insertSql6 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (72,46, '" + sqlDate + "')";
     String insertSql7 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (73,47, '" + sqlDate + "')";
     String insertSql8 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (74,48, '" + sqlDate + "')";
     String insertSql9 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (75,49, '" + sqlDate + "')";
     String insertSql10 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (76,50, '" + sqlDate + "')";
     String insertSql11 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (77,51, '" + sqlDate + "')";
     String insertSql12 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (78,52, '" + sqlDate + "')";
     String insertSql13 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (79,53, '" + sqlDate + "')";
     String insertSql14 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (80,54, '" + sqlDate + "')";
     String insertSql15 = "INSERT INTO employeeWritesNote (employeeID,noteID, CREATED_DATE) "
             + "VALUES (81,55, '" + sqlDate + "')";
 */
    
 
 /* 
 String insertSql1 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
       + "VALUES (62,16, '" + sqlDate + "')";
 String insertSql2 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (63,17, '" + sqlDate + "')";
 String insertSql3 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (64,18, '" + sqlDate + "')";
 String insertSql4 ="INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (65,19, '" + sqlDate + "')";
 String insertSql5 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (66,20, '" + sqlDate + "')";
 String insertSql6 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (67,21, '" + sqlDate + "')";
 String insertSql7 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (68,22, '" + sqlDate + "')";
 String insertSql8 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (69,23, '" + sqlDate + "')";
 String insertSql9 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (70,24, '" + sqlDate + "')";
 String insertSql10 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (71,25, '" + sqlDate + "')";
 String insertSql11 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (82,26, '" + sqlDate + "')";
 String insertSql12 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (83,27, '" + sqlDate + "')";
 String insertSql13 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (84,28, '" + sqlDate + "')";
 String insertSql14 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (85,29, '" + sqlDate + "')";
 String insertSql15 = "INSERT INTO PatientHasPrescription (patientID,prescriptionID, CREATED_DATE) "
         + "VALUES (86,30, '" + sqlDate + "')";
 */
 
/* 
  String insertSql1 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
       + "VALUES (16,57, '" + sqlDate + "')";
 String insertSql2 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (17,58, '" + sqlDate + "')";
 String insertSql3 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (18,59, '" + sqlDate + "')";
 String insertSql4 ="INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (19,60, '" + sqlDate + "')";
 String insertSql5 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (20,61, '" + sqlDate + "')";
 String insertSql6 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (21,72, '" + sqlDate + "')";
 String insertSql7 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (22,73, '" + sqlDate + "')";
 String insertSql8 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (23,74, '" + sqlDate + "')";
 String insertSql9 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (24,75, '" + sqlDate + "')";
 String insertSql10 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (25,76, '" + sqlDate + "')";
 String insertSql11 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (26,77, '" + sqlDate + "')";
 String insertSql12 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (27,78, '" + sqlDate + "')";
 String insertSql13 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (28,79, '" + sqlDate + "')";
 String insertSql14 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (29,80, '" + sqlDate + "')";
 String insertSql15 = "INSERT INTO EmployeeViewsMedicalHistory (patientMedicalHistoryID,employeeID, CREATED_DATE) "
         + "VALUES (30,81, '" + sqlDate + "')";

  */
 //we dont need this table
  /* 
    String insertSql1 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
          + "VALUES (16,62, '" + sqlDate + "')";
    String insertSql2 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (17,63, '" + sqlDate + "')";
    String insertSql3 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (18,64, '" + sqlDate + "')";
    String insertSql4 ="INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (19,65, '" + sqlDate + "')";
    String insertSql5 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (20,66, '" + sqlDate + "')";
    String insertSql6 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (21,67, '" + sqlDate + "')";
    String insertSql7 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (22,68, '" + sqlDate + "')";
    String insertSql8 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (23,69, '" + sqlDate + "')";
    String insertSql9 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (24,70, '" + sqlDate + "')";
    String insertSql10 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (25,71, '" + sqlDate + "')";
    String insertSql11 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (26,72, '" + sqlDate + "')";
    String insertSql12 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (27,16, '" + sqlDate + "')";
    String insertSql13 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (28,22, '" + sqlDate + "')";
    String insertSql14 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (29,19, '" + sqlDate + "')";
    String insertSql15 = "INSERT INTO PatientHasMedicalHistory (patientMedicalHistoryID,patientID, CREATED_DATE) "
            + "VALUES (30,18, '" + sqlDate + "')";
    
  
     */
    
     
   
 
 
 /*  String insertSql1 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (57,120000,'Specialists','1970-09-12', '" + sqlDate + "')";
 String insertSql2 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (58,100000,'Nurses','1970-09-12', '" + sqlDate + "')";
 String insertSql3 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (59,150000,'Surgeons','1971-09-12', '" + sqlDate + "')";
 String insertSql4 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (60,150000,'Specialists','1972-09-12', '" + sqlDate + "')";
 String insertSql5 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (61,100000,'Nurses','1973-09-12', '" + sqlDate + "')";
 String insertSql6 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (72,160000,'Surgeons','1970-09-12', '" + sqlDate + "')";
 String insertSql7 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (73,140000,'Nurses','1970-09-01', '" + sqlDate + "')";
 String insertSql8 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (74,150000,'Pharmacists','1990-09-12', '" + sqlDate + "')";
 String insertSql9 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (75,130000,'Pharmacists','1995-09-12', '" + sqlDate + "')";
 String insertSql10 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (76,120000,'Surgeons','1995-09-12', '" + sqlDate + "')";
 String insertSql11 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (77,135000,'Pharmacists','1999-09-12', '" + sqlDate + "')";
 String insertSql12 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (78,160000,'Surgeons','2000-09-12', '" + sqlDate + "')";
 String insertSql13 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (79,136000,'Nurses','2000-09-12', '" + sqlDate + "')";
 String insertSql14 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (80,110000,'Surgeons','1970-09-12', '" + sqlDate + "')";
 String insertSql15 = "INSERT INTO employee (employeeID,salary,position,hireDate, CREATED_DATE) "
         + "VALUES (81,140000,'Specialists','1980-09-12', '" + sqlDate + "')";
   
 */
  
  /*  String insertSql1 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('2:00','2:30', '1920-08-15','" + sqlDate + "')";
  String insertSql2 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('3:00', '3:30', '1920-08-21','" + sqlDate + "')";
  String insertSql3 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ( '4:00', '4:30','1920-08-14', '" + sqlDate + "')";
  String insertSql4 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('4:30', '5:00', '1920-09-18', '" + sqlDate + "')";
  String insertSql5 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:00', '1:30', '1920-09-21', '" + sqlDate + "')";
  String insertSql6 ="INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:15', '1:45', '1920-09-5', '" + sqlDate + "')";
  String insertSql7 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('1:40', '2:00', '1920-10-7', '" + sqlDate + "')";
  String insertSql8 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('10:00', '10:30', '1920-10-8', '" + sqlDate + "')";
  String insertSql9 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('8:45', '9:20', '1920-10-17', '" + sqlDate + "')";
  String insertSql10 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('11:00', '11:45', '1920-11-16', '" + sqlDate + "')";
  String insertSql11 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('10:00', '10:30', '1920-11-12', '" + sqlDate + "')";
  String insertSql12 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('11:00', '11:30', '1920-11-12', '" + sqlDate + "')";
  String insertSql13 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ( '11:30',  '12:00', '1920-11-12','" + sqlDate + "')";
  String insertSql14 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('12:00', '12:30', '1920-11-12', '" + sqlDate + "')";
  String insertSql15 = "INSERT INTO appointment (start_time,end_time,date,CREATED_DATE) "
          + "VALUES ('12:30','1:00','1920-11-12',  '" + sqlDate + "')";
 
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