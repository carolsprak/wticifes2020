import 'dart:async';

mixin Validador {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.length > 0)
      sink.add(username);
    else
      sink.addError("Digite o nome do usuário");
  });

  teste() => "validators";

  final validateSenha = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 0)
      sink.add(password);
    else
      sink.addError("Digite a sua senha");
  });
}
