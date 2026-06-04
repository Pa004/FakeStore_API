import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/store_model.dart';

class StoreApiDataSource {
  // Usamos Fake Store API
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<List<StoreModel>> fetchStore(int limit, int offset) async {
    final url = Uri.parse(limit > 0 ? "$baseUrl?limit=$limit" : baseUrl);
    final resp = await http.get(url);

    //validaciones
    if (resp.statusCode != 200) {
      throw Exception("Error al obtener los productos");
    }
    //jsonDecode
    //jsonEncode
    final data = jsonDecode(resp.body);
    // La API de Fake Store retorna una lista directa
    final List results = data as List;
    return results.map((e) => StoreModel.fromJson(e)).toList();
  }
}