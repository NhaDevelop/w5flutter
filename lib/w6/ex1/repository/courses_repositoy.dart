import 'package:untitled1/w6/ex1/model/course.dart';


abstract class CoursesRepository {
  Future<List<Course>> getCourses();
  Future<Course?> getCourseFor(String courseName);
  Future<void> addScore(String courseName, CourseScore score);
}