import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart'; // นำเข้าหน้าหลัก LearningHome
import 'SignUpPage.dart'; // นำเข้าหน้า SignUpPage สำหรับการลงทะเบียน

class SimpleLoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
  _buildLogo(), // โลโก้หรือไอคอนด้านบน
  SizedBox(height: 40),
  _buildWelcomeText(), // ข้อความต้อนรับ
  SizedBox(height: 30),
  _buildTextField(usernameController, 'Username', Icons.person, isPassword: false), // กำหนด isPassword: false สำหรับ Username
  SizedBox(height: 20),
  _buildTextField(passwordController, 'Password', Icons.lock, isPassword: true), // กำหนด isPassword: true สำหรับ Password
  SizedBox(height: 30),
  _buildLoginButton(context), // ปุ่ม Login
  SizedBox(height: 20),
  _buildSignUpLink(context), // ลิงก์ไปหน้า Sign Up
],

            ),
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างโลโก้
  Widget _buildLogo() {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Icon(Icons.lock, color: Colors.white, size: 50),
      ),
    );
  }

  // ฟังก์ชันสร้างข้อความต้อนรับ
  Widget _buildWelcomeText() {
    return Center(
      child: Text(
        'สื่อการเรียนรู้ออนไลน์',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง TextField
  Widget _buildTextField(
    TextEditingController controller, 
    String hint, 
    IconData icon, 
    {required bool isPassword}
  ) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: hint,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon, color: Colors.orangeAccent),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
    );
  }

  // ฟังก์ชันสร้างปุ่ม Login
  Widget _buildLoginButton(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? savedUsername = prefs.getString('username');
          String? savedPassword = prefs.getString('password');

          // ตรวจสอบ Username และ Password กับข้อมูลที่บันทึกไว้ใน SharedPreferences
          if (usernameController.text.trim() == savedUsername && passwordController.text.trim() == savedPassword) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LearningHome()), // นำทางไปหน้า LearningHome
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          backgroundColor: Colors.orangeAccent,
        ),
        child: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // ฟังก์ชันสร้างลิงก์ไปหน้า Sign Up
  Widget _buildSignUpLink(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ยังไม่มีบัญชี? "),
          GestureDetector(
            onTap: () {
              // นำทางไปหน้า Sign Up เมื่อกดลิงก์
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            child: Text(
              "สร้างบัญชี",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
