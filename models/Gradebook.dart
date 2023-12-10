class Gradebook {
  int _Number = 1;
  static Set<int> _UsedGradebookNumbers = {};

  int _Math = 1;
  int _Physics = 1;
  int _Economics = 1;
  int _English = 1;
  int _History = 1;
  int _Biology = 1;
  int _Literature = 1;
  int _Geography = 1;
  int _Logic = 1;
  int _Art = 1;

 Gradebook(int number/*, int art, int biology, int economics, int english, int geography,
    int history, int literature, int logic, int math, int physics*/) {
    if (_UsedGradebookNumbers.contains(number)) {
      throw ArgumentError('Gradebook number $number is already assigned.');
    }
    _Number = _validateAndSetGradebookNumber(number);
    _UsedGradebookNumbers.add(number);

    /*_Art = _validateAndSetField('_Art', art);
    _Biology = _validateAndSetField('_Biology', biology);
    _Economics = _validateAndSetField('_Economics', economics);
    _English = _validateAndSetField('_English', english);
    _Geography = _validateAndSetField('_Geography', geography);
    _History = _validateAndSetField('_History', history);
    _Literature = _validateAndSetField('_Literature', literature);
    _Logic = _validateAndSetField('_Logic', logic);
    _Math = _validateAndSetField('_Math', math);
    _Physics = _validateAndSetField('_Physics', physics);*/
  }


  // Private method to validate and set a field
  int _validateAndSetField(String fieldName, int value) {
    if (value != null && (value < 1 || value > 100)) {
      throw ArgumentError('$fieldName must be between 1 and 100.');
    }
    return value;
  }

  int _validateAndSetGradebookNumber(int value) {
    if (value != null && (value < 1000 || value > 9999)) {
      throw ArgumentError('Gradebook number must be a 4-digit positive integer.');
    }
    return value;
  }

  void SetGrade(String discipline, int value) {
    switch (discipline) {
      case 'Art':
        _Art = _validateAndSetField('_Art', value);
        break;
      case 'Biology':
        _Biology = _validateAndSetField('_Biology', value);
        break;
      case 'Economics':
        _Economics = _validateAndSetField('_Economics', value);
        break;
      case 'English':
        _English = _validateAndSetField('_English', value);
        break;
      case 'Geography':
        _Geography = _validateAndSetField('_Geography', value);
        break;
      case 'History':
        _History = _validateAndSetField('_History', value);
        break;
      case 'Literature':
        _Literature = _validateAndSetField('_Literature', value);
        break;
      case 'Logic':
        _Logic = _validateAndSetField('_Logic', value);
        break;
      case 'Math':
        _Math = _validateAndSetField('_Math', value);
        break;
      case 'Physics':
        _Physics = _validateAndSetField('_Physics', value);
        break;
      default:
        throw ArgumentError('Invalid discipline: $discipline');
    }
  }

  int GetGrade(String discipline)
  {
    switch (discipline) {
      case 'Art':
        return _Art;
      case 'Biology':
        return _Biology;
      case 'Economics':
        return _Economics;
      case 'English':
        return _English;
      case 'Geography':
        return _Geography;
      case 'History':
        return _History;
      case 'Literature':
        return _Literature;
      case 'Logic':
        return _Logic;
      case 'Math':
        return _Math;
      case 'Physics':
        return _Physics;
      default:
        throw ArgumentError('Invalid discipline: $discipline');
  }
  }

  double GetAverageGrade()
  {
    double ag = (_Art + _Biology + _Economics + _English + _Geography + _History + _Literature + _Logic + _Math + _Physics) / 10;
    return ag;
  }

  List<int> compareGrades(Gradebook otherGradebook) {
    List<int> gradeDifferences = [];

    gradeDifferences.add(_Art - otherGradebook._Art);
    gradeDifferences.add(_Biology - otherGradebook._Biology);
    gradeDifferences.add(_Economics - otherGradebook._Economics);
    gradeDifferences.add(_English - otherGradebook._English);
    gradeDifferences.add(_Geography - otherGradebook._Geography);
    gradeDifferences.add(_History - otherGradebook._History);
    gradeDifferences.add(_Literature - otherGradebook._Literature);
    gradeDifferences.add(_Logic - otherGradebook._Logic);
    gradeDifferences.add(_Math - otherGradebook._Math);
    gradeDifferences.add(_Physics - otherGradebook._Physics);

    return gradeDifferences;
  }

  @override 
  String toString(){
    return 'Art: $_Art, Biology: $_Biology, Economics: $_Economics, English: $_English, Geography: $_Geography, History: $_History, Literature: $_Literature, Logic: $_Logic, Math: $_Math, Physics: $_Physics';
  }
}