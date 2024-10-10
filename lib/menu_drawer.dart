import 'package:api/UserProfilePage.dart';
import 'package:api/login.dart';
import 'package:flutter/material.dart';
import 'clip_detail.dart';
import 'lesson_data.dart';
import 'english_lessons.dart';
import 'business_lessons.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange.shade50, // สีพื้นหลังของ Drawer
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(), // Header ของเมนู
            _buildMainLessonTile(context), // เมนูหลัก
            _buildEnglishLessonTile(context), // สื่อการสอนภาษาอังกฤษ
            _buildBusinessLessonTile(context), // เทคนิคการทำธุรกิจ
            Divider(color: Colors.orange.shade300),
            _buildUserProfileTile(context), // เมนู User Profile & Settings
            _buildLogoutButton(context), // ปุ่ม Logout
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างหัวเมนู Drawer พร้อมการตกแต่งพื้นหลังและข้อความ
  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade300, Colors.orange.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/cbc1/live/74fe8e20-5170-11ed-ac87-630245663c6a.png.webp',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, User!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างเมนูสำหรับ "พื้นฐานการเขียนโค้ด"
  Widget _buildMainLessonTile(BuildContext context) {
    return _buildCustomExpansionTile(
      context,
      'พื้นฐานการเขียนโค้ด',
      Icons.menu_book,
      Colors.orange,
      lessonsClips.keys.toList(),
      lessonsClips,
    );
  }

  // ฟังก์ชันสร้างเมนูหลักสำหรับ "สื่อการสอนภาษาอังกฤษ"
  Widget _buildEnglishLessonTile(BuildContext context) {
    return _buildCustomExpansionTile(
      context,
      'สื่อการสอนภาษาอังกฤษ',
      Icons.language,
      Colors.deepOrange,
      englishLessons.keys.toList(),
      englishLessons,
    );
  }

  // ฟังก์ชันสร้างเมนูหลักสำหรับ "เทคนิคการทำธุรกิจ"
  Widget _buildBusinessLessonTile(BuildContext context) {
    return _buildCustomExpansionTile(
      context,
      'เทคนิคการทำธุรกิจ',
      Icons.business_center,
      Colors.orange,
      businessLessons.keys.toList(),
      businessLessons,
    );
  }

  // ฟังก์ชันสร้าง Custom ExpansionTile ที่มีการตกแต่งสวยงาม
  Widget _buildCustomExpansionTile(BuildContext context, String title, IconData icon, Color iconColor, List<String> lessonTitles, Map<String, List<Map<String, String>>> lessons) {
    return ExpansionTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade800),
      ),
      backgroundColor: Colors.orange.shade50,
      childrenPadding: EdgeInsets.only(left: 15),
      collapsedBackgroundColor: Colors.orange.shade100,
      textColor: Colors.orange.shade800,
      iconColor: Colors.orange,
      children: lessonTitles.map((lessonTitle) {
        return _buildLessonTileItem(context, lessonTitle, lessons[lessonTitle]!, iconColor);
      }).toList(),
    );
  }

  // ฟังก์ชันสร้างรายการย่อยของบทเรียน
  Widget _buildLessonTileItem(BuildContext context, String lessonTitle, List<Map<String, String>> clips, Color iconColor) {
    return ExpansionTile(
      leading: Icon(Icons.video_library, color: iconColor),
      title: Text(lessonTitle),
      backgroundColor: Colors.orange.shade50.withOpacity(0.2),
      collapsedBackgroundColor: Colors.orange.shade50,
      textColor: Colors.orange.shade800,
      children: clips.map((clip) {
        return ListTile(
          leading: Icon(Icons.play_arrow, color: iconColor),
          title: Text(
            clip['title']!,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(clip['description']!),
          tileColor: Colors.white,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClipDetailPage(
                  clipNumber: clips.indexOf(clip) + 1,
                  title: clip['title']!,
                  description: clip['description']!,
                  videoUrl: clip['videoUrl']!,
                  imagePath: '',
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // ฟังก์ชันสร้างปุ่ม Logout ที่มีการตกแต่งเพิ่มเติม
  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.redAccent),
      title: Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SimpleLoginPage()),
        );
      },
      tileColor: Colors.red.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  // ฟังก์ชันสร้างเมนู User Profile & Settings
  Widget _buildUserProfileTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person, color: Colors.deepOrange),
      title: Text('User Profile & Settings'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfilePage()),
        );
      },
    );
  }
}
