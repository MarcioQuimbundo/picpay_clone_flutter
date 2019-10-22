import 'dart:async';

class MyHomePageBloc {
  double saldo = 50.00;

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

}