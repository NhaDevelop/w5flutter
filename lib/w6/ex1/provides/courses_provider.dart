import 'package:flutter/material.dart';
import 'package:untitled1/w6/ex1/model/course.dart';
import 'package:untitled1/w6/ex1/repository/courses_mock_repository.dart';
import 'package:untitled1/w6/ex1/repository/courses_repositoy.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesRepository _coursesRepository = CoursesMockRepository();
  List<Course> _allCourses = [];
  Course? _selectedCourse;

  List<Course> get allCourses => _allCourses;
  Course? get selectedCourse => _selectedCourse;

  CoursesProvider() {
    loadCourses();
  }

  Future<void> loadCourses() async {
    _allCourses = await _coursesRepository.getCourses();
    notifyListeners();
  }

  Future<void> setSelectedCourse(String courseName) async{
    _selectedCourse = await _coursesRepository.getCourseFor(courseName);
    notifyListeners();
  }

  Future<void> addScore(String courseName, CourseScore score) async {
    await _coursesRepository.addScore(courseName, score);
    _selectedCourse = await _coursesRepository.getCourseFor(courseName);
    notifyListeners();
  }
}