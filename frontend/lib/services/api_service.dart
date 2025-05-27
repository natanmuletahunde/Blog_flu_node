import 'dart:convert';
  import 'package:http/http.dart' as http;
  import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource, XFile;
  import 'package:flutter/foundation.dart' show kIsWeb;
  import '../models/post.dart';

  class ApiService {
    static const String baseUrl = 'http://localhost:5000/api';

    Future<List<Post>> fetchPosts() async {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    }

    Future<Post> uploadPost(String name, String description, String imagePath) async {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload'));
      request.fields['name'] = name;
      request.fields['description'] = description;

      if (kIsWeb) {
        // On web, use XFile to handle the file
        final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          request.files.add(await http.MultipartFile.fromBytes(
            'image',
            await pickedFile.readAsBytes(),
            filename: pickedFile.name,
          ));
        }
      } else {
        request.files.add(await http.MultipartFile.fromPath('image', imagePath));
      }

      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      print('Upload response: ${response.statusCode} - $responseBody');
      if (response.statusCode != 201) {
        throw Exception('Failed to upload post: ${response.statusCode} - $responseBody');
      }
      final responseData = jsonDecode(responseBody);
      return Post.fromJson(responseData['post']);
    }
  }