import 'dart:io';
import '../models/student.dart';
import '../models/Gradebook.dart';

class ui {
  final List<Student> _students = [];

  void Run() {
    while(true){
      ClearScreen();
      ShowMenu();
      bool closeApp = ProcessInput();

      if (closeApp) {
        break;
      }
    }
  } 

  bool ProcessInput() {
    stdout.write('Choose an option:');
    String? input = stdin.readLineSync();
    bool closeApp = false;

    switch(input){
      case '1':
        CreateStudent();
        break;
      case '2':
        DisplayAllStudents();
        break;
      case '3':
        ShowStudentInfo();
        break;
      case '4':
        ShowStudentGrade();
        break;
      case '5':
        SetGrade();
        break;
      case '6':
        CompareTwoStudents();
        break;
      case '7':
        closeApp = true;
        break;
      default:
        print('$input is an invalid option, try again');
        WaitForUser();
        break;
    }
    return closeApp;
  }

  void ShowMenu() {
    print('1 - Create new student');
    print('2 - Display all students');
    print('3 - Show student info');
    print('4 - Show student`s grade');
    print('5 - Set grade');
    print('6 - Compare two students');
    print('7 - Exit');
  }

  void ClearScreen() {
    stdout.write(Platform.isWindows ? '\x1B[2J\x1B[0f' : '\x1B[2J\x1B[3J\x1B[H');
  }

  String PromptInput(String message) {
    stdout.write('$message');
    return stdin.readLineSync() ?? '';
  }

  void WaitForUser() {
    print('Press any key to return to the main menu:');
    stdin.readLineSync();
  }

////////////////////////////////////////////////////////////////////////////

  void CreateStudent() {
    ClearScreen();
    String name = PromptInput('Enter student name: ');
    String course = PromptInput('Enter student`s course: ');
    String gradebookNumber = PromptInput('Enter gradebook number: ');

    try{
      Gradebook gradebook = Gradebook(int.parse(gradebookNumber));
      var student = Student(name, gradebook, int.parse(course));
      _students.add(student);
    }
    catch(e){
      print('Error: ${e.toString()}');
    }
    WaitForUser();
  }

  void DisplayAllStudents() {
    ClearScreen();
    if (_students.isEmpty) {
      print('No students created yet');
    } else {
      print('Students:');
      for(var student in _students)
      {
        print(student.toString());
      }
      //_students.forEach((student) => print('$student'));
    }
    WaitForUser();
  }

  void ShowStudentInfo(){
    ClearScreen();
    String name = PromptInput('Enter student name: ');
    for (Student student in _students) {
    if (student.name.toLowerCase() == name.toLowerCase()) {
      print(student.toString());
      print(student.ShowGrades());
    }
  }
  WaitForUser();
  }

  void ShowStudentGrade(){
    ClearScreen();
    String name = PromptInput('Enter student name: ');
    String discipline = PromptInput('Enter discipline name: ');
    for (Student student in _students) {
    if (student.name.toLowerCase() == name.toLowerCase()) {
      print(student.GetGrade(discipline));
    }
  }
  WaitForUser();
  }

  void SetGrade() {
    ClearScreen();
    String name = PromptInput('Enter student name: ');
    for (Student student in _students) {
    if (student.name.toLowerCase() == name.toLowerCase()) {
      String discipline = PromptInput('Enter discipline: ');
      String value = PromptInput('Enter a grade: ');
      student.GradeDescipline(discipline, int.parse(value));
    }
  }
  WaitForUser();
  }

  Student? findStudentByName(List<Student> students, String name) {
  for (Student student in students) {
    if (student.name.toLowerCase() == name.toLowerCase()) {
      return student;
    }
  }
  return null; // Return null if no student with the specified name is found
}

  void CompareTwoStudents(){
    ClearScreen();
    String firstStudent = PromptInput('Enter the name of the 1st student: ');
    String secondStudent = PromptInput('Enter the name of the 2nd student: ');
    
    var student = findStudentByName(_students, firstStudent);
    var otherStudent = findStudentByName(_students, secondStudent);

    if (student != null && otherStudent != null) {
      List<int> gradeDifferences = student.compareStudents(otherStudent);
      print("Grade differences for ${student.name} and ${otherStudent.name}: $gradeDifferences");
      WaitForUser();
    } 
    else {
      print("One or both students were not found.");
      WaitForUser();
    }
  }
}