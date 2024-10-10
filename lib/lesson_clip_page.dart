import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class LessonClipPage extends StatelessWidget {
  final String lessonTitle;
  final List<Map<String, String>> clips;

  LessonClipPage({required this.lessonTitle, required this.clips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clips for $lessonTitle'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: clips.length,
        itemBuilder: (context, index) {
          final clip = clips[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.play_circle_outline, color: Colors.blueAccent),
              title: Text(clip['title'] ?? ''),
              subtitle: Text(clip['description'] ?? ''),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClipDetailPage(
                      clipNumber: index + 1,
                      title: clip['title'] ?? '',
                      description: clip['description'] ?? '',
                      videoUrl: clip['videoUrl'] ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// คลาส ClipDetailPage (ถ้าไม่มีไฟล์แยก)
class ClipDetailPage extends StatelessWidget {
  final int clipNumber;
  final String title;
  final String description;
  final String videoUrl;

  ClipDetailPage({
    required this.clipNumber,
    required this.title,
    required this.description,
    required this.videoUrl,
  });

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
