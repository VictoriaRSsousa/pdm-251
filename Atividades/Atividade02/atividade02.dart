// Agregação e Composição
import 'dart:convert';


class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
    Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
    Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
    Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  //CRIAÇÃO DE DEPENDENTES
  var dependente1 = new Dependente('dependente1');
  var dependente2 = new Dependente('dependente2');
  var dependente3 = new Dependente('dependente3');
  var dependente4 = new Dependente('dependente4');
  var dependente5 = new Dependente('dependente5');
  var dependente6 = new Dependente('dependente6');
  var dependente7 = new Dependente('dependente7');
  var dependente8 = new Dependente('dependente8');
  var dependente9 = new Dependente('dependente9');
  var dependente10 = new Dependente('dependente10');

  //CRIAÇÃO DE FUNCIONARIOS
  var funcionario1 = new Funcionario('funcionario1', [
    dependente10,
    dependente9,
  ]);

  var funcionario2 = new Funcionario('funcionario', [dependente8, dependente7]);

  var funcionario3 = new Funcionario('funcionario', [dependente6, dependente5]);

  var funcionario4 = new Funcionario('funcionario', [dependente4, dependente3]);

  var funcionario5 = new Funcionario('funcionario', [dependente2, dependente1]);

  //CRIAÇÃO DE EQUIPES

  var funcionariosList1 = [funcionario5, funcionario4];
  var funcionariosList2 = [funcionario3, funcionario2];
  var funcionariosList3 = [funcionario1];
  var equipe1 = new EquipeProjeto('nomeprojeto1', funcionariosList1);

  var equipe2 = new EquipeProjeto('nomeprojeto1', funcionariosList2);

  var equipe3 = new EquipeProjeto('nomeprojeto1', funcionariosList3);


//IMPRESSÃO DOS DADOS
  print(jsonEncode(equipe1.toJson()));
  print(jsonEncode(equipe2.toJson()));
  print(jsonEncode(equipe3.toJson()));

  // 1. Criar varios objetos Dependentes
  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  // 4. Criar uma lista de Funcionarios
  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  // 6. Printar no formato JSON o objeto Equipe Projeto.
}
