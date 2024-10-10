import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile & Settings'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Header Section
              _buildProfileHeader(context),
              SizedBox(height: 20),
              // Account Settings Section
              _buildSectionTitle('Account Settings'),
              _buildListTile(
                context,
                icon: Icons.person,
                title: 'Change Username',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsernamePage()));
                },
              ),
              _buildListTile(
                context,
                icon: Icons.lock,
                title: 'Change Password',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
                },
              ),
              _buildListTile(
                context,
                icon: Icons.email,
                title: 'Update Email',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateEmailPage()));
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ส่วนหัวโปรไฟล์
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/cbc1/live/74fe8e20-5170-11ed-ac87-630245663c6a.png.webp',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'user@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.orange),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างหัวข้อหมวดหมู่
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
    );
  }

  // ฟังก์ชันสร้าง ListTile สำหรับแต่ละตัวเลือก
  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required Function onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orangeAccent),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => onTap(),
      ),
    );
  }
}

// หน้าแก้ไข Username
class ChangeUsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Username'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'New Username'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // อัปเดต Username
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

// หน้าแก้ไข Password
class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // อัปเดต Password
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

// หน้าแก้ไข Email
class UpdateEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Email'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'New Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // อัปเดต Email
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

// หน้าแก้ไขการแจ้งเตือน
class NotificationSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(child: Text('Notification Settings Page')),
    );
  }
}


// หน้าแก้ไขโปรไฟล์หลัก
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(child: Text('Edit Profile Page')),
    );
  }
}
