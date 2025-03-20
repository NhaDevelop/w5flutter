import 'package:untitled1/w6/ex1/model/course.dart';
import 'package:untitled1/w6/ex1/repository/courses_repositoy.dart';


class CoursesMockRepository implements CoursesRepository {
  final List<Course> _allCourses = [Course(name: 'HTML'), Course(name: 'JAVA')];

  @override
  Future<List<Course>> getCourses() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    return _allCourses;
  }

  @override
  Future<Course?> getCourseFor(String courseName) async {
    await Future.delayed(const Duration(seconds: 1));
    try{
      Course? course = _allCourses.firstWhere((course) => course.name == courseName);
      return course;
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<void> addScore(String courseName, CourseScore score) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    Course course = _allCourses.firstWhere((course) => course.name == courseName);
    course.addScore(score);
    print('Added score ${score.studenScore} for ${score.studentName} to ${course.name}');
  }
}