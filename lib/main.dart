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
  ];

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

  void editStudent(Student student) {
    nameController.text = student.name;
    rollController.text = student.rollNumber;
    branchController.text = student.branch;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                ),
              ),
              TextField(
                controller: rollController,
                decoration: const InputDecoration(
                  labelText: 'Roll Number',
                ),
              ),
              TextField(
                controller: branchController,
                decoration: const InputDecoration(
                  labelText: 'Branch',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  student.name = nameController.text;
                  student.rollNumber = rollController.text;
                  student.branch = branchController.text;
                });

                nameController.clear();
                rollController.clear();
                branchController.clear();

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Student updated successfully'),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
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
              const Text(
                'Add Student',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
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
                controller: rollController,
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

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: addStudent,
                child: const Text('Add Student'),
              ),

              const SizedBox(height: 25),

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
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        editStudent(student);
                      },
                    ),
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