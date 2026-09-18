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

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final branchController = TextEditingController();

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

  void addStudent() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        students.add(
          Student(
            name: nameController.text,
            rollNumber: rollController.text,
            branch: branchController.text,
          ),
        );
      });

      nameController.clear();
      rollController.clear();
      branchController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student added successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Attendance App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
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

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),

            const SizedBox(height: 15),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Roll Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter roll number';
                  }
                  return null;
                },
              ),

            const SizedBox(height: 15),

              TextFormField(
                controller: branchController,
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          student.isPresent ? 'Present' : 'Absent',
                        ),
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
                  ),
                ),
              ),

              const SizedBox(height: 20),

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
              subtitle: Text(
                '${student.rollNumber} • ${student.branch}',
              ),
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