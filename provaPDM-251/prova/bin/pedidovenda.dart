
import 'itemPedido.dart';
import 'cliente.dart';
import 'vendedor.dart';
import 'veiculo.dart';

class PedidoVenda{
  String codigo;
  String data;
  late double valorPedido = 0.0;
  List<ItemPedido> listaItems = [];
  late Vendedor vendedor;
  late Cliente cliente;
  late Veiculo veiculo;

  PedidoVenda(this.codigo,this.data); 

 Map<String, dynamic> toJson() => {
  "codigo": codigo,
  "data": data, 
  "items": listaItems.map((item) => item.toJson()).toList(),
  "valorPedido": valorPedido,
  "vendedor": vendedor.toJson(),
  "cliente": cliente.toJson(),
  "veiculo": veiculo.toJson()
};

      void adicionarItem(List<ItemPedido>  items){
        for (var item in items) {
          listaItems.add(item);
        }
      }
      
      double calcularPedido(){
        for (var item in listaItems) {
          valorPedido+=item.valor;
        }
        return valorPedido;
      }
}