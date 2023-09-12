// ignore_for_file: unused_local_variable, unused_element
/*
------------------------------------------------------------
|               author  : shaik afrid                      |
|               github  : @afriddev                        |
|               license : MIT (shaik afrid,2023)           |
-------------------------------------------------------------
 */
/*
----------------- Post Response Format-----------------------
|            fromEmail:str | None = defaultEmail            |
|            toEmail:str                                    |  
|            title:str     | None == defaultFromTitle       |
|            subject:str   | None == defaultSubject         |
|            body:str      | None == defaultBody            |
|            passkey:str   | None == None                   |
-------------------------------------------------------------
 */

import 'package:requests/requests.dart';
class emailSender {
  

  final String server = "https://emailsender.cyclic.cloud";
  //emailAPI website url
  final String url = "https://emailsender.cyclic.cloud/sendEmail/";

  // list of error codes fromm server
  List errorCodes = [
    "wrongEmail",
    "sendEmailFailed",
    "wrongCrendentials",
    "passkeyRequired",
    "serverError"
  ];
  //var otp = Random().nextInt(999999).toString().padLeft(6,'0');

  //initalize emailSender section start
  /*
  
  */
  //initalize emailSender section end

  //check errorCode is present in errorCode section start
  checkErrorCode(message) {
    for (int i = 0; i <= errorCodes.length; i++) {
      if (message == errorCodes[i]) {
        return {"isThere": true, "errorCode": errorCodes[i]};
      } else {
        return {"isThere": false};
      }
    }
  }

  //check errorCode is present in errorCode section end

  //check serevr is running or not section start
  checkServer() async {
    var response = await Requests.get(server);

    if (response.json()["message"]["serverStatus"] == "running") {
      return true;
    } else if (response.json()["message"]["serverStatus"] ==
        "serverUnderMaintenance") {
      return false;
    } else {
      return false;
    }
  }

  //check server is running or not section end
  //details server method secion start 
  details()async{
    try{
      if(await checkServer()){
      var response = await Requests.get(server);
      return{
        "message":response.json()["message"]

      };
    }
    else{
      return{
        "message":"serverUnderMaintenance"
      };
    }
    }
    catch(e){
      return{
        "message":"somethingWrong"
      };

    }

  }
  //details server method end

  //send default crendentials to provided email section start
  send(String toEmail) async {
    try{
      if (await checkServer()) {
      if (checkEmail(toEmail)) {
        var response = await Requests.post(url, json: {"toEmail": toEmail});
        var checkErrorCodeIsPresentOrNot =
            checkErrorCode(response.json()["message"])["isThere"];
        if (response.json()["message"] == "emailSendSuccess") {
          return response.json();
        } else if (checkErrorCodeIsPresentOrNot) {
          return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
        } else {
          return {"message": "somethingWrong"};
        }
      } else {
        return {"message": "wrongEmail"};
      }
    } else {
      return {"message": "serverUnderMaintenance"};
    }
    }
    catch(e){
      return {
        "message":"somethingWrong"
      };
    }
  }
  //send default crendentials to provided email section start

  //sendOtp and all are  default crendentials to provided email section start
  sendOtp(String toEmail, int otp) async {
    try{
      if (await checkServer()) {
      if (checkEmail(toEmail)) {
        var response = await Requests.post(url, json: {
      "toEmail": toEmail,
      "body": "Your Verification Code Is " + otp.toString()
    });
        var checkErrorCodeIsPresentOrNot =
            checkErrorCode(response.json()["message"])["isThere"];
        if (response.json()["message"] == "emailSendSuccess") {
          return response.json();
        } else if (checkErrorCodeIsPresentOrNot) {
          return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
        } else {
          return {"message": "somethingWrong"};
        }
      } else {
        return {"message": "wrongEmail"};
      }
    } else {
      return {"message": "serverUnderMaintenance"};
    }

    }
    catch(e){
      return {
        "message":"somethingWrong"
      };
    }

    
  }

  //sendOtp section end
  //send Custom Email with parameters section start
  // ignore: dead_code
  sendMessage(String toEmail, String title, String subject, String body) async {
    try{
      if (await checkServer()) {
      if (checkEmail(toEmail)) {
        var response = await Requests.post(url, json: {
      "toEmail": toEmail,
      "title": title,
      "subject": subject,
      "body": body
    });
        var checkErrorCodeIsPresentOrNot =
            checkErrorCode(response.json()["message"])["isThere"];
        if (response.json()["message"] == "emailSendSuccess") {
          return response.json();
        } else if (checkErrorCodeIsPresentOrNot) {
          return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
        } else {
          return {"message": "somethingWrong"};
        }
      } else {
        return {"message": "wrongEmail"};
      }
    } else {
      return {"message": "serverUnderMaintenance"};
    }
    }
    catch (e){
      return {
        "message":"somethingWrong"
      };
    }

  }

  //send Custom Email With parameters section end

  //send custom Email With Custom Email And Passkey section start
  custom(String fromEmail, String passkey, String toEmail, String title,
      String subject, String body) async {
   try{
     if (await checkServer()) {
      if (checkEmail(toEmail)) {
        var response = await Requests.post(url,json: {
      "fromEmail": fromEmail,
      "passkey": passkey,
      "toEmail": toEmail,
      "title": title,
      "subject": subject,
      "body": body
    });
        var checkErrorCodeIsPresentOrNot =
            checkErrorCode(response.json()["message"])["isThere"];
        if (response.json()["message"] == "emailSendSuccess") {
          return response.json();
        } else if (checkErrorCodeIsPresentOrNot) {
          return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
        } else {
          return {"message": "somethingWrong"};
        }
      } else {
        return {"message": "wrongEmail"};
      }
    } else {
      return {"message": "serverUnderMaintenance"};
    }
   }
   catch(e){
    return {
"message":"somethingWrong"
    };
   }
  }
  //Send Custom Email With Custom Email And Passkey section end

  //check email is valid or not section start
  bool checkEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
  //check email is valid or not section end
}


void main()async{
  var emailsender = emailSender();
  var response = await emailsender.send("afridayan01@gmail.com");
  print(response);
}