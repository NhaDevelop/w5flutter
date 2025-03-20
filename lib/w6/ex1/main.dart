import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/w6/ex1/provides/courses_provider.dart';
import 'package:untitled1/w6/ex1/screen/course_list_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoursesProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}