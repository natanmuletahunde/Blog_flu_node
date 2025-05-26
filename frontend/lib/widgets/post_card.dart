import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.title != null) ...[
              Text(post.title!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(post.content!),
            ],
            if (post.name != null) ...[
              Text(post.name!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(post.description!),
              const SizedBox(height: 8),
              if (post.imageUrl != null)
                Image.network('http://localhost:5000${post.imageUrl}', height: 200, fit: BoxFit.cover),
            ],
          ],
        ),
      ),
    );
  }
}