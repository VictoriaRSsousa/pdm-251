
import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'cliente.dart';
import 'itemPedido.dart';
import 'pedidovenda.dart';
import 'veiculo.dart';
import 'vendedor.dart';

main() async{
ItemPedido item1 =  ItemPedido(1, "bolacha", 2, 2.50);
ItemPedido item2 =  ItemPedido(2, "arroz", 5, 5.50);
ItemPedido item3 =  ItemPedido(3, "feijão", 3, 6.50);
ItemPedido item4 =  ItemPedido(4, "sabonete", 1, 2.50);
ItemPedido item5 =  ItemPedido(5, "café", 1, 20.50);
ItemPedido item6 =  ItemPedido(6, "macarrão", 8, 3.50);

Cliente cliente1 = Cliente(1, "Taveira", 1);

Vendedor vendedor = Vendedor(1, "Marcella", 10.00);

Veiculo veiculo = Veiculo(1, "descricao", 150.00);

PedidoVenda pedido = PedidoVenda('00001', '15/12/2001');


pedido.adicionarItem([item1,item2,item3,item4,item5,item6]);
pedido.cliente = cliente1;
pedido.vendedor = vendedor;
pedido.veiculo = veiculo;
pedido.valorPedido= pedido.calcularPedido();
final jsonMap = pedido.toJson();
final jsonString = jsonEncode(jsonMap);

print(jsonString);
// Parte 2 : Envio do e-mail.
final email = "victoria.regia08@aluno.ifce.edu.br";
final pass = "sxoy egqr jdlr fgrw";
final name = "Victória Régia";

final smtpServer = gmail(email, pass);
final message = Message()
..from = Address(email, name)
..recipients.add("victoria.regia08@aluno.ifce.edu.br")
..subject = "Prova Prática"
..text = jsonString;

try {
final sendReport = await send(message, smtpServer);
print("Email Enviado!:$sendReport");
} on MailerException catch (e) {
print("Erro ao enviar e-mail: ${e.toString()}");
}



}
