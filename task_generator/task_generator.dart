//Exectue this file to generate a JSON file with 50 tasks
//using the command `dart task_generator.dart`
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

enum TaskStatus { pending, inProgress, completed, archived }

enum TaskPriority { low, medium, high, urgent }

final random = Random();

List<String> sampleTags = [
  "flutter",
  "backend",
  "design",
  "testing",
  "learning",
  "focusflow",
  "development",
  "UI",
  "bloc",
  "authentication",
];

List<String> reminderMethods = ["notification", "email", "sms"];

String randomDate() {
  final now = DateTime.now();
  final randomDays = random.nextInt(30);
  return DateFormat('yyyy-MM-dd').format(now.add(Duration(days: randomDays)));
}

Map<String, dynamic> generateTask(int id) {
  return {
    "id": id,
    "title": "Task $id",
    "description": "Description for task $id",
    "status": TaskStatus.values[random.nextInt(TaskStatus.values.length)].name,
    "priority":
        TaskPriority.values[random.nextInt(TaskPriority.values.length)].name,
    "tags": List.generate(
      3,
      (_) => sampleTags[random.nextInt(sampleTags.length)],
    ),
    "dueDate": randomDate(),
    "createdAt": DateTime.now().toIso8601String(),
    "updatedAt": DateTime.now().toIso8601String(),
    "userId": random.nextInt(10) + 1,
    "subtasks": List.generate(
      2,
      (index) => {
        "id": id * 10 + index,
        "title": "Subtask ${id * 10 + index}",
        "completed": random.nextBool(),
      },
    ),
    "attachments": List.generate(
      2,
      (index) => {
        "id": id * 100 + index,
        "filename": "file_${id * 100 + index}.pdf",
        "url": "https://example.com/file_${id * 100 + index}.pdf",
        "uploadedAt": DateTime.now().toIso8601String(),
      },
    ),
    "comments": List.generate(
      2,
      (index) => {
        "id": id * 1000 + index,
        "userId": random.nextInt(10) + 1,
        "comment": "Comment ${id * 1000 + index}",
        "createdAt": DateTime.now().toIso8601String(),
      },
    ),
    "reminders": List.generate(
      2,
      (index) => {
        "id": id * 10000 + index,
        "reminderTime":
            DateTime.now()
                .add(Duration(days: random.nextInt(10)))
                .toIso8601String(),
        "method": reminderMethods[random.nextInt(reminderMethods.length)],
      },
    ),
    "recurrence": {
      "type": "weekly",
      "interval": random.nextInt(4) + 1,
      "daysOfWeek": [
        "Monday",
        "Wednesday",
        "Friday",
      ].sublist(0, random.nextInt(3) + 1),
    },
  };
}

void main() async {
  List<Map<String, dynamic>> tasks = List.generate(
    50,
    (index) => generateTask(index + 1),
  );
  String jsonData = jsonEncode(tasks);

  // Save to a JSON file
  final file = File('tasks.json');
  await file.writeAsString(jsonData);
}
