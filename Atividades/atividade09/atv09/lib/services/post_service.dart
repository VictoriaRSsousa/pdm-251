import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    try { // Adicione um try-catch para capturar erros de rede
      print('DEBUG: Iniciando requisição para $_baseUrl/posts');
      final response = await http.get(Uri.parse('$_baseUrl/posts'));
      print('DEBUG: Resposta recebida. Status Code: ${response.statusCode}');
      print('DEBUG: Corpo da Resposta: ${response.body.substring(0, response.body.length > 500 ? 500 : response.body.length)}...'); // Limita o print para não sobrecarregar

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        print('DEBUG: JSON decodificado. Número de itens: ${jsonList.length}');
        List<Post> posts = jsonList.map((json) => Post.fromJson(json)).toList();
        print('DEBUG: ${posts.length} posts convertidos com sucesso.');
        return posts;
      } else {
        print('ERROR: Falha na requisição com status: ${response.statusCode}. Corpo: ${response.body}');
        throw Exception('Falha ao carregar posts. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR: Exceção na requisição ou processamento: $e');
      throw Exception('Erro de conexão ou processamento: $e');
    }
  }
}