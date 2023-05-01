import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The application that contains datagrid on it.

/// The home page of the application which hosts the datagrid.
class OwnerRecords extends StatefulWidget {
  /// Creates the home page.
  OwnerRecords({Key? key}) : super(key: key);

  @override
  _OwnerRecordsState createState() => _OwnerRecordsState();
}

class _OwnerRecordsState extends State<OwnerRecords> {
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
              columnName: 'store',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Store Name'))),
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
          GridColumn(
              columnName: 'status',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Status'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("fwdKaleem@gmail.com", 'James', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Active"),
      Employee("fwdKaleem@gmail.com", 'Kathryn', "Al Bakra Store",
          '+9238952355', "245 B Eden Garden", "Active"),
      Employee("fwdKaleem@gmail.com", 'Lara', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Pending"),
      Employee("fwdKaleem@gmail.com", 'Michael', "Al Bakra Store",
          '+9238952355', "245 B Eden Garden", "Rejected"),
      Employee("fwdKaleem@gmail.com", 'Martin', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Rejected"),
      Employee("fwdKaleem@gmail.com", 'Newberry', "Al Bakra Store",
          '+9238952355', "245 B Eden Garden", "Pending"),
      Employee("fwdKaleem@gmail.com", 'Balnc', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Active"),
      Employee("fwdKaleem@gmail.com", 'Perry', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Active"),
      Employee("fwdKaleem@gmail.com", 'Gable', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Active"),
      Employee("fwdKaleem@gmail.com", 'Grimes', "Al Bakra Store", '+9238952355',
          "245 B Eden Garden", "Rejected")
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.email, this.name, this.store, this.designation, this.salary,
      this.status);

  /// Id of an employee.
  final String email;

  /// Name of an employee.
  final String name;
  final String store;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String salary;
  final String status;
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
              DataGridCell<String>(columnName: 'store', value: e.store),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'salary', value: e.salary),
              DataGridCell<String>(columnName: 'status', value: e.status),
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
