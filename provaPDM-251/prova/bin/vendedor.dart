class Vendedor {
  int codigo;
  String nome;
  double comissao;

  Vendedor(this.codigo,this.nome,this.comissao);
  
    Map toJson() => {"codigo": codigo, "nome": nome, "comissao": comissao};
    
}