import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String type;
  String address;
  String email;
  String name;
  String phoneNumber;
  bool blocked;
  String dob;
  String photoUrl;

  UserModel({
    required this.uid,
    required this.blocked,
    required this.email,
    required this.type,
    required this.address,
    required this.photoUrl,
    required this.name,
    required this.phoneNumber,
    required this.dob,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'name': name,
        "photoUrl": photoUrl,
        'dob': dob,
        'type': type,
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'address': address,
        'blocked': blocked,
      };

  ///
  static UserModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return UserModel(
        name: snapshot['name'],
        type: snapshot['type'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        email: snapshot['email'],
        dob: snapshot['dob'],
        phoneNumber: snapshot['phoneNumber'],
        blocked: snapshot['blocked'],
        address: snapshot['address']);
  }
}
