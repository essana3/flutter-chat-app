import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Messenger'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/78xyY881ousdIiW5vsOk/messages')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(documents[index]['text']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/78xyY881ousdIiW5vsOk/messages')
              .add({'text': 'New message added!'});
        },
      ),
    );
  }
}
