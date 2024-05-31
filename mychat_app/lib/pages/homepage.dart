import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychat_app/pages/chat_page.dart';
import 'package:provider/provider.dart';
import 'package:mychat_app/services/auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

 // sign out user
  void signOut() {
    // get auth service
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          // Sign out button
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current logged in user

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasError) {
            return const Text('Error');
          }
          if (snapshots.connectionState == ConnectionState.waiting) {
            return const Text('Loading......');
          }

          return ListView(
              children: snapshots.data!.docs
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList());
        });
  }


  // build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all user except current user
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          // pass the clicked user's UID to the chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
              ),
            ),
          );
        },
      );
    } 
  
    else {
      return Container();
    }
  }
   
}
