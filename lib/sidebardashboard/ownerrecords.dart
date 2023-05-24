import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:osar_admin/datasource/store_owner_datasource.dart';
import 'package:osar_admin/models/store_owner_models.dart';
import 'package:osar_admin/widgets/sidebar.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OwnerRecords extends StatefulWidget {
  const OwnerRecords({super.key});

  @override
  State<OwnerRecords> createState() => _OwnerRecordsState();
}

class _OwnerRecordsState extends State<OwnerRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 670,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: _buildDataGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late StoreOwnerDataSource employeeDataSource;
  List<StoreModel> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('storeowners').snapshots();
  Widget _buildDataGrid() {
    return StreamBuilder(
      stream: getDataFromFireStore,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: Colors.blue, size: 200));
        }
        if (snapshot.hasData) {
          if (employeeData.isNotEmpty) {
            getDataGridRowFromDataBase(DocumentChange<Object?> data) {
              return DataGridRow(cells: [
                DataGridCell<String>(
                    columnName: 'name', value: data.doc['name']),
                DataGridCell<String>(
                    columnName: 'email', value: data.doc['email']),
                DataGridCell<String>(
                    columnName: 'address', value: data.doc['address']),
                DataGridCell<String>(
                    columnName: 'type', value: data.doc['type']),
                DataGridCell<String>(
                    columnName: 'verified', value: data.doc['verified']),
              ]);
            }

            for (var data in snapshot.data!.docChanges) {
              if (data.type == DocumentChangeType.modified) {
                if (data.oldIndex == data.newIndex) {
                  employeeDataSource.dataGridRows[data.oldIndex] =
                      getDataGridRowFromDataBase(data);
                }
                employeeDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.added) {
                employeeDataSource.dataGridRows
                    .add(getDataGridRowFromDataBase(data));
                employeeDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.removed) {
                employeeDataSource.dataGridRows.removeAt(data.oldIndex);
                employeeDataSource.updateDataGridSource();
              }
            }
          } else {
            for (var data in snapshot.data!.docs) {
              employeeData.add(StoreModel(
                address: data['address'],
                uid: data['uid'],
                verified: data['verified'],
                phoneNumber: data['phoneNumber'],
                name: data['name'],
                email: data['email'],
                photoUrl: data['photoUrl'],
                type: data['type'],
              ));
            }
            employeeDataSource = StoreOwnerDataSource(employeeData);
          }

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SfDataGrid(
              allowFiltering: true,
              allowSwiping: true,
              source: employeeDataSource,
              columns: getColumnsBusiness,
              columnWidthMode: ColumnWidthMode.fill,
              onCellTap: (details) {
                if (details.rowColumnIndex.rowIndex != 0) {
                  final DataGridRow row = employeeDataSource
                      .effectiveRows[details.rowColumnIndex.rowIndex - 1];
                  int index = employeeDataSource.dataGridRows.indexOf(row);
                  var data = snapshot.data!.docs[index];
                  _showMyDialog(data);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => BusinessView(data: data)));
                }
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> _showMyDialog(QueryDocumentSnapshot<Object?> data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Store Owner Records"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(data.get("email")),
                Divider(),
                Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(data.get("name")),
                Divider(),
                Text(
                  "Date of Birth",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(data.get("dob")),
                Divider(),
                Text(
                  "Address",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(data.get("address")),
                Divider(),
                Text(
                  "Dp you want to Approve the Store Owner to use our app",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("storeowners")
                    .doc(data.get("uid"))
                    .update({"verified": true}).then((value) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => SideDrawer())),
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Account is Verified")))
                        });
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
