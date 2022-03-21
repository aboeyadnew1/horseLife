import 'dart:convert';

import 'package:hourse_life/models/user.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  bool login(User user) {
    // if (user.phone == "012" && user.password == "123") {
    //   return true;
    // }else{
    //  return false;
    // }
  }
}


Future<void> sendNotification(String title,String subtitle,{String image,String notifBody}) async {
    Map<String, dynamic> body = {
      "to": "/topics/admins",
      'notification': {
        'title': title,
        'body': notifBody,
        "subtitle": subtitle,
      },
    };
    var response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': "key=AAAA87FW5ag:APA91bHilEsOvwFfVM3pQIYoZ80R-xUCb6SSzvmc3JNyIIRPXujPErOdCSISmJU1hsYuwzYVa3u4TU_ymSI6NjObsrGwsOfm5MYMXk4hDAk8EsN0inSMYTA518XnL4BBXbQ7q1BOrRtL"
            },
            body: json.encode(body));
  }
