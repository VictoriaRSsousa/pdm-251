class Cliente {
  int codigo;
  String nome;
  int tipoClente;

  Cliente(this.codigo,this.nome,this.tipoClente);
  
    Map toJson() => {"codigo": codigo, "nome": nome, "tipoCliente": tipoClente};

}