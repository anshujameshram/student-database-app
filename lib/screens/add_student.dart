import 'package:db_demo/modals/student.dart';
import 'package:db_demo/services/student_operations.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          SizedBox(height: 8),
          TextField(
            controller: branchController,
            decoration: InputDecoration(hintText: 'Branch'),
          ),
          SizedBox(height: 8),
          RaisedButton(
            child: Text('add student'),
            onPressed: () async {
              String name = nameController.text;
              String branch = branchController.text;

              Student s = Student(name: name, branch: branch);

              await StudentOperations.instance.addStudent(s);

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
