import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

void main() {
  final db = sqlite3.open('alunos.db');

  // Criar a tabela se não existir
  db.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL
    );
  ''');

  while (true) {
    print('\n--- MENU ---');
    print('1. Inserir aluno');
    print('2. Listar alunos');
    print('3. Sair');
    stdout.write('Escolha uma opção: ');
    final opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        inserirAluno(db);
        break;
      case '2':
        listarAlunos(db);
        break;
      case '3':
        db.dispose();
        print('Encerrando o programa.');
        exit(0);
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

void inserirAluno(Database db) {
  stdout.write('Digite o nome do aluno: ');
  final nome = stdin.readLineSync();

  if (nome != null && nome.trim().isNotEmpty) {
    db.execute('INSERT INTO TB_ALUNO (nome) VALUES (?)', [nome]);
    print('Aluno inserido com sucesso!');
  } else {
    print('Nome inválido.');
  }
}

void listarAlunos(Database db) {
  final ResultSet result = db.select('SELECT * FROM TB_ALUNO');

  print('\n--- Lista de Alunos ---');
  for (final row in result) {
    print('ID: ${row['id']} | Nome: ${row['nome']}');
  }

  if (result.isEmpty) {
    print('Nenhum aluno cadastrado.');
  }
}
