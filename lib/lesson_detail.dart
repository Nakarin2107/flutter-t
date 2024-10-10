import 'package:flutter/material.dart';
import 'lesson_clip_page.dart';
import 'lesson_data.dart'; 

class LessonDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;

  LessonDetailPage({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลคลิปสำหรับบทเรียนที่เกี่ยวข้อง
    final clips = lessonsClips[title];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ตกแต่งการแสดงภาพให้นุ่มนวล
              Center(
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Colors.orangeAccent.withOpacity(0.6), Colors.orange.shade100],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // หัวข้อ Lesson Overview พร้อมการตกแต่งใหม่
              Text(
                'Lesson Overview',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent.shade700,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),

              // กล่องข้อความบทเรียน พร้อมการตกแต่งใหม่
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orangeAccent, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  'ในบทเรียนนี้คุณจะได้เรียนรู้เกี่ยวกับ $title โดยเนื้อหาจะครอบคลุมตั้งแต่พื้นฐานจนถึงการใช้งานจริงในโปรเจกต์ของคุณ...',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.orange.shade800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (clips != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonClipPage(
                            lessonTitle: title,
                            clips: clips,
                          ),
                        ),
                      );
                    } else {
                      // แสดงข้อความแจ้งเตือนเมื่อไม่มีคลิปในบทเรียนนี้
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('No clips available for this lesson.'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5, // ใช้สีส้มสำหรับพื้นหลังปุ่ม
                    shadowColor: Colors.orangeAccent.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Start Learning',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
