class Veiculo{
  int codigo;
  String descricao;
  double valor;

  Veiculo(this.codigo,this.descricao,this.valor);
  
  Map toJson() => {"codigo": codigo, "descricao": descricao, "valor": valor};
}