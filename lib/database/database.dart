import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uuid/uuid.dart';

class DatabaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // Future<String> addTeachers(
  //     {required String teachername,
  //     required String teacheremail,
  //     required String teacherpassword,
  //     required String teacherqualification,
  //     required String teachersubjects,
  //     required String assignedclass,
  //     required String cpassword,
  //     required final time,
  //     required bool blocked,
  //     required String teacherType}) async {
  //   String res = 'Some error occured';

  //   try {
  //     if (teacheremail.isNotEmpty || teacherpassword.isNotEmpty) {
  //       UserCredential cred = await _auth.createUserWithEmailAndPassword(
  //           email: teacheremail, password: teacherpassword);
  //       //Add User to the database with modal

  //       TeacherModels userModel = TeacherModels(
  //         teacher_name: teachername,
  //         teacher_class: assignedclass,
  //         teacher_qualification: teacherqualification,
  //         teacher_subjects: teachersubjects,
  //         dateTime: time,
  //         confrim_password: cpassword,
  //         teacherType: teacherType,
  //         uuid: cred.user!.uid,
  //         email: teacheremail,
  //         password: teacherpassword,
  //       );
  //       await firebaseFirestore
  //           .collection('teachers')
  //           .doc(cred.user!.uid)
  //           .set(userModel.toJson());

  //       res = 'success';
  //     }
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   return res;
  // }

  // //add Studntds
  // Future<String> addStudents(
  //     {required String parentemail,
  //     required String parentmobile,
  //     required String parentname,
  //     required String studentclass,
  //     required String studentStatus,
  //     required String studentname,
  //     required int fees,
  //     required String addressStudent,
  //     required final dateTime,
  //     required String subject}) async {
  //   String res = 'Some error occured';

  //   try {
  //     //Add User to the database with modal

  //     try {
  //       //Add User to the database with modal
  //       String postId = Uuid().v1();

  //       StudentModel userModel = StudentModel(
  //           subject: subject,
  //           dateTime: dateTime,
  //           addressStudent: addressStudent,
  //           fees: fees,
  //           studentStatus: studentStatus,
  //           studentname: studentname,
  //           parentemail: parentemail,
  //           parentmobile: parentmobile,
  //           uuid: postId,
  //           parentname: parentname,
  //           studentclass: studentclass);
  //       await FirebaseFirestore.instance
  //           .collection('students')
  //           .doc(postId)
  //           .set(userModel.toJson());

  //       res = 'success';
  //     } catch (e) {
  //       res = e.toString();
  //     }
  //     return res;
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   return res;
  // }

  // //Make DateSheet
  // Future<String> makeDateSheet(
  //     {required String date,
  //     required final day,
  //     required String studentclass,
  //     required final studentname,
  //     required final dateTime,
  //     required String subject}) async {
  //   String res = 'Some error occured';

  //   try {
  //     //Add User to the database with modal

  //     try {
  //       //Add User to the database with modal
  //       String postId = Uuid().v1();

  //       DateSheetModels userModel = DateSheetModels(
  //         subject: subject,
  //         dateTime: dateTime,
  //         className: studentclass,
  //         studentname: studentname,
  //         date: date,
  //         day: day,
  //         uuid: postId,
  //       );
  //       await FirebaseFirestore.instance
  //           .collection('datesheet')
  //           .doc(postId)
  //           .set(userModel.toJson());

  //       res = 'success';
  //     } catch (e) {
  //       res = e.toString();
  //     }
  //     return res;
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   return res;
  // }

  // //Assigned Class
  // Future<String> assinedClass(
  //     {required final teacherName,
  //     required String studentclass,
  //     required final studentname,
  //     required String teacherUid,
  //     required final dateTime,
  //     required String subject}) async {
  //   String res = 'Some error occured';

  //   try {
  //     //Add User to the database with modal

  //     try {
  //       //Add User to the database with modal
  //       String postId = Uuid().v1();

  //       ClassModels userModel = ClassModels(
  //         studentSubject: subject,
  //         dateTime: dateTime,
  //         studentClass: studentclass,
  //         studentName: studentname,
  //         teacherUid: teacherUid,
  //         teacher_name: teacherName,
  //         uuid: postId,
  //       );
  //       await FirebaseFirestore.instance
  //           .collection('assignedClass')
  //           .doc(postId)
  //           .set(userModel.toJson());

  //       res = 'success';
  //     } catch (e) {
  //       res = e.toString();
  //     }
  //     return res;
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   return res;
  // }

  // //Add Payment
  // Future<String> addPayment(
  //     {required int fees,
  //     required int reciveamount,
  //     required String studentName,
  //     required int remaingAmount,
  //     required final dateTime}) async {
  //   String res = 'Some error occured';

  //   try {
  //     //Add User to the database with modal
  //     String postId = Uuid().v1();

  //     PaymentModel userModel = PaymentModel(
  //         recievedPayment: reciveamount,
  //         remainingPayment: remaingAmount,
  //         uuid: postId,
  //         dateTime: dateTime,
  //         studentname: studentName,
  //         fees: fees);
  //     await FirebaseFirestore.instance
  //         .collection('payments')
  //         .doc(postId)
  //         .set(userModel.toJson());

  //     res = 'success';
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   return res;
  // }
}
