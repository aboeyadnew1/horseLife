import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  var collection = FirebaseFirestore.instance.collection('provider_services');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
        future: collection.get(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(snapshot.data.docs[index]['service_name']),
                    onTap: (){
                      // collection.doc(snapshot.data.docs[index].id).delete();
                    },
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
