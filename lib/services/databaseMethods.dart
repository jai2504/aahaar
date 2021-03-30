import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethos {
  adduser({String email, String name, String phone, int donation}) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
        'phone': phone,
        'donations': donation
      });
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  getUserbyemail(String email) async {
    try {
      return await FirebaseFirestore.instance
          .collection('users')
          .where("email", isEqualTo: email)
          .get();
    } catch (e) {
      print(e.toString());
    }
  }
}
