import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SMSService {

  // var baseURL;

  SMSService() {
    // this.baseURL =
    //     Uri.https('https://3ggkqj.api.infobip.com/sms/2/text/advanced');
  }

  Future<String> sendSMS(String phoneNumber, String message) async {
    try {
      http.Response response = await http.post(
          // baseURL,
          Uri.https('3ggkqj.api.infobip.com', 'sms/2/text/advanced'),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "App dd9ac27d80347a9011f7cadbf1cc359e-63264e13-e2a8-483f-b2de-31e21e2604c7"
          },
          body: json.encode({
            "messages": [
              {
                "destinations": [
                  {"to": phoneNumber}
                ],
                "from": "SNEL",
                "text": message
              },
            ]}));

      log("sendSMS:: ${response.body}");

      if (response.statusCode == 200){
        return "success";
      } else {
        return "error";
      }
    } catch(e){
      log(e.toString());
      return e.toString();
    }

  }

}