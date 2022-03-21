import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hourse_life/services/shared_prefrerence_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {

  Future<bool> login(String phone,String password)async{

      var firestore = FirebaseFirestore.instance.collection('users');

      var data = await firestore
          .where('phone', isEqualTo: phone)
          .where('password', isEqualTo: password)
          .get();


      if (data.docs.isNotEmpty) {
        // set userid in shared preference
        var userDoc = data.docs.first;
        setUserId(userDoc.id);
        return true;
  }else{
    return false;
  }

}

}