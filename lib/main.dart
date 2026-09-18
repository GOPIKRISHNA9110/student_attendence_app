import 'package:flutter/material.dart';

void main() {
  runApp(const StudentAttendanceApp());
}

class StudentAttendanceApp extends StatelessWidget {
  const StudentAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Attendance App',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPresent = false;

  final List<String> students = [
    'Gopi Krishna - CSE001',
    'Rahul - CSE002',
    'Suresh - CSE003',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Attendance App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Name:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Gopi Krishna',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Roll No:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'CSE001',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),

            const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Branch:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'CSE',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                isPresent
                    ? 'Attendance: Present'
                    : 'Attendance: Absent',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Present'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Absent'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Student List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(students[index]),
                      subtitle: const Text('Attendance Record'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}