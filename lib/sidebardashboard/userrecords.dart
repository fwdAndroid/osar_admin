import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The application that contains datagrid on it.

/// The home page of the application which hosts the datagrid.
class UserRecords extends StatefulWidget {
  /// Creates the home page.
  UserRecords({Key? key}) : super(key: key);

  @override
  _UserRecordsState createState() => _UserRecordsState();
}

class _UserRecordsState extends State<UserRecords> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGrid(
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Email',
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Phone Number',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Location'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(
          "fwdKaleem@gmail.com", 'James', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Kathryn', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Lara', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Michael', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Martin', '+9238952355', "245 B Eden Garden"),
      Employee("fwdKaleem@gmail.com", 'Newberry', '+9238952355',
          "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Balnc', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Perry', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Gable', '+9238952355', "245 B Eden Garden"),
      Employee(
          "fwdKaleem@gmail.com", 'Grimes', '+9238952355', "245 B Eden Garden")
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.email, this.name, this.designation, this.salary);

  /// Id of an employee.
  final String email;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
