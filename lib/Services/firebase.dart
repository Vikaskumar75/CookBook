import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireBaseServices {
  CollectionReference favourites =
      FirebaseFirestore.instance.collection('Favourites');

  Future<void> addUser({List<int> indexes, String userId}) async {
    return favourites
        .doc(userId)
        .set({'index': indexes})
        .then((value) => print('User Added'))
        .catchError((error) {
          print('Failed to add user : $error');
        });
  }

  Future<void> updateUser({List<int> indexes, String userId}) {
    return favourites
        .doc(userId)
        .update({'index': indexes})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future getData({BuildContext context, String userId}) async {
    final document = favourites.doc(userId).get();
    return document;
  }
}
