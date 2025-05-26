import 'dart:convert';
import 'package:blog_app/widgets/post_card.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5000/api';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> uploadPost(String name, String description, String imagePath) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload'));
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var response = await request.send();
    if (response.statusCode != 201) {
      throw Exception('Failed to upload post');
    }
  }
}