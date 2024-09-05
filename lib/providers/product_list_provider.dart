import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopro/models/data_model.dart';

final productProvider = FutureProvider<List<Product>>((ref) async {
  String? api = dotenv.env['API'];
  final Uri url = Uri.parse(api!);
  try {
    final response = await http.get(url).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['products'];
      List<Product> result =
          (data).map((productJson) => Product.fromJson(productJson)).toList();
      return result; // Return the fetched data
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  } on SocketException catch (_) {
    throw Exception('No internet connection');
  } on HttpException catch (e) {
    throw Exception('HTTP Exception: $e');
  } catch (e) {
    throw Exception('Error: $e');
  }
});
