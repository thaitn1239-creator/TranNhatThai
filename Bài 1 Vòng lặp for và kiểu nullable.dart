import 'package:flutter/material.dart';

// 1. Tạo class Student gồm name, email, phone
class Student {
  String name;
  String? email;
  String? phone;

  Student({required this.name, this.email, this.phone});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập về nhà',
      home: const StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Tạo list 5 sinh viên, có người thiếu email hoặc số điện thoại (null)
    final List<Student> students = [
      Student(name: 'Trần Nhật Thái', email: 'thaitn1239@ut.edu.vn', phone: '0918 519 603'),
      Student(name: 'Nguyễn Minh Trường', email: null, phone: '0912 888 999'),
      Student(name: 'Nguyễn Ngọc Hồng Vy', email: 'chi@sv.edu.vn', phone: null),
      Student(name: 'Lê Phan Quang Vinh', email: null, phone: null),
      Student(name: 'Nguyễn Dức Trung', email: 'em@sv.edu.vn', phone: '0933 111 222'),
    ];

    // 5. Dùng vòng lặp for để đếm số sinh viên thiếu email
    int missingEmailCount = 0;
    for (var student in students) {
      if (student.email == null) {
        missingEmailCount++;
      }
    }

    // 3. Dùng vòng lặp for để tạo danh sách các thẻ sinh viên
    List<Widget> studentCards = [];
    for (var student in students) {
      studentCards.add(
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              // 4. Nếu trường bị null thì hiện chữ "Chưa cập nhật", dùng toán tử ??
              Text(
                'Email: ${student.email ?? 'Chưa cập nhật'}',
                style: TextStyle(
                  color: student.email == null ? Colors.red : Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'SĐT: ${student.phone ?? 'Chưa cập nhật'}',
                style: TextStyle(
                  color: student.phone == null ? Colors.red : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A), // Màu xanh đậm giống hình
        title: const Text('Danh sách sinh viên', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Hiển thị danh sách các thẻ sinh viên cuộn được
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: studentCards,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Phần thống kê ở chân trang
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng: ${students.length} sinh viên',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Thiếu email: $missingEmailCount',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}