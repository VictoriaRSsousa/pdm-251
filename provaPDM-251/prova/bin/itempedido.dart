class ItemPedido{
  int sequencial;
  String descricao;
  int quantidade;
  double valor;

  ItemPedido(this.sequencial,this.descricao,this.quantidade,this.valor);
  
    Map toJson() => {"sequencial": sequencial, "descricao": descricao, "quantidade": quantidade, "valor":valor};
}
