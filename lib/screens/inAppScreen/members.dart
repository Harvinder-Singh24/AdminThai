
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Members" , style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(height: 20,),
                _fetchData()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fetchData() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context,snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(),);
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index) {
                  DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                  return  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text('${index+1}'),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    title: Text(documentSnapshot['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('email-: ${documentSnapshot['email']}'),
                        Text('number-: ${documentSnapshot['number']}')
                      ],
                    ),

                  );
                  }
              );
            }
          }
      ),
    );
  }
}
