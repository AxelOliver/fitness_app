import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final String _title = "Home View";
  String get title => '$_title $_counter';

  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}