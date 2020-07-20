import 'package:db_demo/modals/student.dart';
import 'package:db_demo/services/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class StudentOperations {
  //private constructor
  StudentOperations._();

  static final StudentOperations instance = StudentOperations._();

  Future<int> addStudent(Student student) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<int> deleteStudent(Student student) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.delete('students', where: 'id=?', whereArgs: [student.id]);
  }

  Future<int> editStudent(Student student)async{
    Database db=await DataBaseHelper.instance.database;
    return await db.update('students',student.toMap(),
     where: 'id=?',whereArgs:[ student.id]);
  }

  Future<List<Student>> getAllStudents()async{
    Database db=await DataBaseHelper.instance.database;
    List<Map> maps=await db.query('students');

    List<Student> students=[];

    for(int i=0;i<maps.length;i++){
      students.add(Student.fromMap(maps[i]));
    }

    return students;
  } 

}
