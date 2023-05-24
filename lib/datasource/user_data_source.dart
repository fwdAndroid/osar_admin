import 'package:flutter/material.dart';
import 'package:osar_admin/models/user_models.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UserDataSource extends DataGridSource {
  UserDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<UserModel> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'address', value: e.address),
              DataGridCell<String>(
                  columnName: 'phoneNumber', value: e.phoneNumber),
              DataGridCell<String>(columnName: 'dob', value: e.dob),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumnsBusinesss {
  return <GridColumn>[
    GridColumn(
        columnName: 'email',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Email'))),
    GridColumn(
        columnName: 'name',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Name',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'address',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Address'))),
    GridColumn(
        columnName: 'phoneNumber ',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Phone Number'))),
    GridColumn(
        columnName: 'dob',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Date of Birth')))
  ];
}
