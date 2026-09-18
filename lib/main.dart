import 'package:flutter/material.dart';

void main() {
  runApp(const StudentAttendanceApp());
}

class Student {
  String name;
  String rollNumber;
  String branch;
  bool isPresent;

  Student({
    required this.name,
    required this.rollNumber,
    required this.branch,
    this.isPresent = false,
  });
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
  final _formKey = GlobalKey<FormState>();

  final List<Student> students = [
    Student(
      name: 'Gopi Krishna',
      rollNumber: 'CSE001',
      branch: 'CSE',
    ),
    Student(
      name: 'Rahul',
      rollNumber: 'CSE002',
      branch: 'CSE',
    ),
    Student(
      name: 'Suresh',
      rollNumber: 'CSE003',
      branch: 'CSE',
    ),
  ];

  void markAttendance(Student student, bool present) {
    setState(() {
      student.isPresent = present;
    });
  }

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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Student Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

              const SizedBox(height: 20),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Roll Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Branch',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter branch';
                  }
                  return null;
                },
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
                    onPressed: () {
                      setState(() {
                        isPresent = true;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Student marked Present'),
                        ),
                      );
                    },
                    child: const Text('Present'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPresent = false;
                      });

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Attendance'),
                            content: const Text(
                              'Student has been marked Absent.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
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

              ...students.map(
                (student) => Card(
                  child: ListTile(
                    title: Text(student.name),
                    subtitle: Text(
                      '${student.rollNumber} • ${student.branch}',
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          student.isPresent ? 'Present' : 'Absent',
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                markAttendance(student, true);
                              },
                              icon: const Icon(Icons.check),
                            ),
                            IconButton(
                              onPressed: () {
                                markAttendance(student, false);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Student details are valid'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit Student'),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceScreen(
                          students: students,
                        ),
                      ),
                    );
                  },
                  child: const Text('View Attendance'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceScreen extends StatelessWidget {
  final List<Student> students;

  const AttendanceScreen({
    super.key,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];

          return Card(
            child: ListTile(
              title: Text(student.name),
              subtitle: Text(student.rollNumber),
              trailing: Text(
                student.isPresent ? 'Present' : 'Absent',
              ),
            ),
          );
        },
      ),
    );
  }
}