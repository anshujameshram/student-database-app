import 'package:db_demo/modals/student.dart';
import 'package:db_demo/services/student_operations.dart';
import 'package:flutter/material.dart';

class EditStudent extends StatelessWidget {
  final Student student;

  EditStudent({this.student});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = student.name;
    branchController.text = student.branch;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
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
            child: Text('edit student'),
            onPressed: () async {
              String name = nameController.text;
              String branch = branchController.text;

              Student s = Student(id: student.id, name: name, branch: branch);

              await StudentOperations.instance.editStudent(s);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
