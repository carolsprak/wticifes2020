import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'validador.dart';


class LoginBloc extends BlocBase with Validador {
  final _email = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();

}
