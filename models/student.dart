import 'Gradebook.dart';

class Student {
  String _Name;
  Gradebook _Gradebook;
  int _Course = 1;
  double _AverageGrade = 0;

  Student(this._Name, this._Gradebook, this._Course){
    _validateName(_Name);
    _validateCourse(_Course);
    _AverageGrade = _Gradebook.GetAverageGrade();
  }
  
  String get name => _Name;

  _validateName(String name){
    if (name.isEmpty || RegExp(r'\d').hasMatch(name)) {
      throw FormatException('Name cannot be empty or contain numbers');}
  }

  _validateCourse(int course){
    if(course != null && (course < 1 || course > 5)){
      throw ArgumentError('Course number must be in a 1-5 range.');
    }
  }

  void GradeDescipline(String discipline, int value)
  {
    this._Gradebook.SetGrade(discipline, value);
  }

  String GetGrade(String discipline){
    return (this._Gradebook.GetGrade(discipline)).toString();
  }

  String ShowGrades(){
    return this._Gradebook.toString();
  }

  List<int> compareStudents(Student otherStudent) {
    return _Gradebook.compareGrades(otherStudent._Gradebook);
  }

  @override
  String toString(){
    return 'Name: $_Name, Course: $_Course, Average grade: ${_Gradebook.GetAverageGrade()}';
  }
}