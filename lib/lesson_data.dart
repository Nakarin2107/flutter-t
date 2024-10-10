// lib/lesson_data.dart
import 'package:flutter/material.dart';
import 'clip_detail.dart';

// ข้อมูลคลิปสำหรับแต่ละบทเรียน
final Map<String, List<Map<String, String>>> lessonsClips = {
  'HTML': [
    {
      'title': 'Clip 1: Introduction to HTML',
      'description': 'Learn the basic structure and elements of HTML.',
      'videoUrl': 'https://www.youtube.com/embed/qz0aGYrrlhU'
    },
    {
      'title': 'Clip 2: HTML Tags and Attributes',
      'description': 'Understand how to use HTML tags and attributes.',
      'videoUrl': 'https://www.youtube.com/embed/w5T3C99x9P4'
    },
    {
      'title': 'Clip 3: Creating Your First Webpage',
      'description': 'Step-by-step guide to creating your first webpage using HTML.',
      'videoUrl': 'https://www.youtube.com/embed/kUMe1FH4CHE'
    },
  ],
  'JavaScript': [
    {
      'title': 'Clip 1: JavaScript Basics',
      'description': 'Introduction to JavaScript syntax and basic programming concepts.',
      'videoUrl': 'https://www.youtube.com/embed/W6NZfCO5SIk'
    },
    {
      'title': 'Clip 2: JavaScript Variables and Data Types',
      'description': 'Learn how to declare and use variables and understand data types in JavaScript.',
      'videoUrl': 'https://www.youtube.com/embed/OwGmM4yt_2E'
    },
    {
      'title': 'Clip 3: Functions and Events in JavaScript',
      'description': 'Creating functions and handling user events in JavaScript.',
      'videoUrl': 'https://www.youtube.com/embed/riDzcEQbX6k'
    },
  ],
  'CSS': [
    {
      'title': 'Clip 1: Introduction to CSS',
      'description': 'Learn the fundamentals of CSS for styling web pages.',
      'videoUrl': 'https://www.youtube.com/embed/1PnVor36_40'
    },
    {
      'title': 'Clip 2: CSS Box Model',
      'description': 'Understanding the box model and CSS positioning.',
      'videoUrl': 'https://www.youtube.com/embed/0xMQfnTU6oo'
    },
    {
      'title': 'Clip 3: Flexbox and Grid Layout',
      'description': 'Advanced layout techniques using CSS Flexbox and Grid.',
      'videoUrl': 'https://www.youtube.com/embed/JJSoEo8JSnc'
    },
  ],
  'PHP': [
    {
      'title': 'Clip 1: PHP Basics',
      'description': 'Learn the basic syntax and usage of PHP.',
      'videoUrl': 'https://www.youtube.com/embed/OK_JCtrrv-c'
    },
    {
      'title': 'Clip 2: Working with PHP Forms',
      'description': 'How to handle form data using PHP.',
      'videoUrl': 'https://www.youtube.com/embed/4jrO9p_c1FI'
    },
    {
      'title': 'Clip 3: PHP Sessions and Cookies',
      'description': 'Manage sessions and cookies in PHP for state management.',
      'videoUrl': 'https://www.youtube.com/embed/2PK8k-KUoqg'
    },
  ],
  'Python': [
    {
      'title': 'Clip 1: Introduction to Python',
      'description': 'Learn the basics of Python programming.',
      'videoUrl': 'https://www.youtube.com/embed/_uQrJ0TkZlc'
    },
    {
      'title': 'Clip 2: Python Data Structures',
      'description': 'Understanding Python data structures such as lists and dictionaries.',
      'videoUrl': 'https://www.youtube.com/embed/rfscVS0vtbw'
    },
    {
      'title': 'Clip 3: Python Functions and Loops',
      'description': 'Creating functions and using loops in Python.',
      'videoUrl': 'https://www.youtube.com/embed/4mrE5zgEvtE'
    },
  ],
  'Flutter': [
    {
      'title': 'Clip 1: Getting Started with Flutter',
      'description': 'Introduction to building apps using Flutter.',
      'videoUrl': 'https://www.youtube.com/embed/x0uinJvhNxI'
    },
    {
      'title': 'Clip 2: Flutter Layouts and Widgets',
      'description': 'Learn about Flutter widgets and layout techniques.',
      'videoUrl': 'https://www.youtube.com/embed/RnLQp7AAvjc'
    },
    {
      'title': 'Clip 3: State Management in Flutter',
      'description': 'Understand state management in Flutter using Provider.',
      'videoUrl': 'https://www.youtube.com/embed/RS36gBEp8OI'
    },
  ],
};


// ฟังก์ชันสร้างรายการของแต่ละคลิปในบทเรียน
Widget buildClipItem(BuildContext context, int clipNumber, String title, String description, String videoUrl) {
  return ListTile(
    leading: Icon(Icons.video_library),
    title: Text(title),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClipDetailPage(
            clipNumber: clipNumber,
            title: title,
            description: description,
            videoUrl: videoUrl, imagePath: '',
          ),
        ),
      );
    },
  );
}

// ฟังก์ชันสร้าง ExpansionTile สำหรับบทเรียน
Widget buildExpansionTile(BuildContext context, String title, List<Widget> children) {
  return ExpansionTile(
    leading: Icon(Icons.book),
    title: Text(title),
    children: children,
  );
}

// ฟังก์ชันสร้าง ExpansionTile สำหรับเมนูทั้งหมด
List<Widget> buildLessonMenu(BuildContext context) {
  return lessonsClips.entries.map((entry) {
    final lessonTitle = entry.key;
    final clips = entry.value;
    final clipWidgets = clips
        .asMap()
        .entries
        .map((clip) => buildClipItem(
              context,
              clip.key + 1,
              clip.value['title']!,
              clip.value['description']!,
              clip.value['videoUrl']!,
            ))
        .toList();

    return buildExpansionTile(context, lessonTitle, clipWidgets);
  }).toList();
}
