import 'package:flutter/material.dart';
import 'login.dart';
import 'lesson_detail.dart';
import 'menu_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SimpleLoginPage(),
    );
  }
}

class LearningHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สื่อการเรียนรู้ออนไลน์', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_4),
            onPressed: () {
              // เพิ่มฟังก์ชันเปลี่ยนธีมได้ในอนาคต
            },
          )
        ],
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 6, // จำนวนการ์ดทั้งหมด
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2, // ปรับจำนวนการ์ดตามขนาดหน้าจอ
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final lessons = [
              {'key': 'HTML', 'title': 'HTML', 'imagePath': 'images/html.png'},
              {'key': 'JavaScript', 'title': 'JavaScript', 'imagePath': 'images/javascript.png'},
              {'key': 'CSS', 'title': 'CSS', 'imagePath': 'images/css.png'},
              {'key': 'PHP', 'title': 'PHP', 'imagePath': 'images/php.png'},
              {'key': 'Python', 'title': 'Python', 'imagePath': 'images/python.png'},
              {'key': 'Flutter', 'title': 'Flutter', 'imagePath': 'images/flutter.png'},
            ];
            return _buildLessonCard(
              context,
              lessons[index]['key']!,
              lessons[index]['title']!,
              lessons[index]['imagePath']!,
            );
          },
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างการ์ดสำหรับแสดงบทเรียน
  Widget _buildLessonCard(BuildContext context, String lessonKey, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LessonDetailPage(
              title: lessonKey,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (event) => print('Hovering over $title'), // แสดงผลเมื่อผู้ใช้วางเมาส์
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.orange.withOpacity(0.3), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 3,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Text(
                        'Image not found',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
