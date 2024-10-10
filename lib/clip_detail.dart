// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ClipDetailPage extends StatelessWidget {
  final int clipNumber;
  final String title;
  final String description;
  final String videoUrl;

  ClipDetailPage({
    Key? key, // เพิ่มพารามิเตอร์ key ใน constructor
    required this.clipNumber,
    required this.title,
    required this.description,
    required this.videoUrl, required String imagePath,
  }) : super(key: key); // เพิ่ม super(key)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip $clipNumber: $title'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Video Tutorial:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              HtmlWidget(
                '<iframe width="560" height="315" src="$videoUrl" frameborder="0" allowfullscreen></iframe>',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
