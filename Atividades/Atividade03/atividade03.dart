import 'dart:io';
import 'dart:async';
import 'dart:isolate';

void main() async {
  print('victoria'); // <-- Substitua pelo seu nome

  final receivePort = ReceivePort();
  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  // Enquanto isso, o isolate principal continua
  print('Iniciando outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Continuando outras tarefas...');

  final result = await receivePort.first;
  print('\Resultado recebido do isolate:');
  print(result);
}

void doAsyncOperation(SendPort sendPort) async {
  final file = File('./arquivo.txt');

  if (await file.exists()) {
    final content = await file.readAsString();
    sendPort.send(content);
  } else {
    sendPort.send(' Arquivo não encontrado.');
  }
}
