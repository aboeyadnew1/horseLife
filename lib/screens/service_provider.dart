import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderUsers extends StatefulWidget {
  const ProviderUsers({Key? key}) : super(key: key);

  @override
  _ProviderUsersState createState() => _ProviderUsersState();
}

class _ProviderUsersState extends State<ProviderUsers> {
  var firebase = FirebaseFirestore.instance.collection('users');
  QuerySnapshot? users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    users = await firebase.where('visable', isEqualTo: true).get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        elevation: 0,
        foregroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(),
          ],
        ),
      ),
      body: SafeArea(
        child: users == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: users!.docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  الاسم : '),
                                Text(
                                  (users!.docs[index].data()
                                      as Map)['name'],
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  رقم الجوال : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['phone'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  العنوان : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['address'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(' البريد الالكتروني : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['email'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  رقم السجل : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['recordNumber'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  رقم الهوية : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['personalIdentity'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  العنوان : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['address'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                                Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  نوع الخدمة الرئيسية : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['mainServiceType'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                                Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('  نوع الخدمة الفرعية : '),
                                Text(
                                  (users!.docs[index].data()
                                          as Map)['subServiceType'] ??
                                      "empty",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 22),
                                ),
                              ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                var doc = users!.docs[index].data()
                                    as Map<String, dynamic>;
                                doc['approved'] = true;
                                doc['visable'] = false;
                                firebase
                                    .doc(users!.docs[index].id)
                                    .update(doc);
                                getData();
                              },
                              child: Text('أقبل')),
                          ElevatedButton(
                              onPressed: () {
                                var doc = users!.docs[index];
                                firebase.doc(doc.id).delete();
                                getData();
                              },
                              child: Text('أرفض')),
                        ],
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
