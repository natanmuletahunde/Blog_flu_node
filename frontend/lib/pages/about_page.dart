import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This is a simple blog app built with Flutter and Node.js. '
          'It allows users to sign in, sign up, view blog posts, and upload new posts with images.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}