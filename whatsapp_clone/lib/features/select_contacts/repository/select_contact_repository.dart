import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/screens/screens.dart';

final selectContactRepositoryProvider = Provider(
  (ref) => SelectContactRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];

    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }

    return contacts;
  }

  void selectContact(Contact selectContact, BuildContext context) async {
    try {
      final navigator = Navigator.of(context);

      var userCollection = await firestore.collection('users').get();

      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());

        String selectedPhoneNum = selectContact.phones[0].number
            .replaceAll(' ', '')
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', '');

        if (selectedPhoneNum == userData.phoneNumber) {
          isFound = true;
          navigator.pushNamed(MobileChatScreen.routeName, arguments: {
            'name': userData.name,
            'uid': userData.uid,
          });
        }
      }

      if (!isFound) {
        showSnackBar(
          content: 'This number does not exist on this app.',
          context: context,
        );
      }
    } catch (e) {
      if (kDebugMode) print(e);
      showSnackBar(context: context, content: e.toString());
    }
  }
}
