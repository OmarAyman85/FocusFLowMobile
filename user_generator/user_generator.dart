//Exectue this file to generate a JSON file with 50 tasks
//using the command `dart task_generator.dart`
import 'dart:convert';
import 'dart:io';
import 'dart:math';

enum UserRole { user, admin, manager }

enum UserStatus { active, inactive, suspended }

final List<Map<String, String>> names = [
  {'firstName': 'John', 'lastName': 'Doe'},
  {'firstName': 'Jane', 'lastName': 'Smith'},
  {'firstName': 'Mike', 'lastName': 'Johnson'},
  {'firstName': 'Emily', 'lastName': 'Davis'},
  {'firstName': 'Chris', 'lastName': 'Brown'},
  {'firstName': 'Jessica', 'lastName': 'Wilson'},
  {'firstName': 'David', 'lastName': 'Lee'},
  {'firstName': 'Sophia', 'lastName': 'Clark'},
  {'firstName': 'Daniel', 'lastName': 'Harris'},
  {'firstName': 'Sarah', 'lastName': 'Lewis'},
];

final List<String> avatars = [
  'https://example.com/avatar1.png',
  'https://example.com/avatar2.png',
  'https://example.com/avatar3.png',
  'https://example.com/avatar4.png',
];

String getRandomUsername(String firstName, String lastName) {
  return (firstName + lastName).toLowerCase() +
      Random().nextInt(100).toString();
}

Map<String, dynamic> generateUser(int id) {
  final random = Random();
  Map<String, String> name = names[random.nextInt(names.length)];
  return {
    'id': id,
    'username': getRandomUsername(name['firstName']!, name['lastName']!),
    'firstName': name['firstName'],
    'lastName': name['lastName'],
    'email':
        '${getRandomUsername(name['firstName']!, name['lastName']!)}@example.com',
    'phone': '+12345678${random.nextInt(999)}',
    'avatarUrl': avatars[random.nextInt(avatars.length)],
    'bio': 'This is a bio for ${name['firstName']} ${name['lastName']}.',
    'role': UserRole.values[random.nextInt(UserRole.values.length)].name,
    'status': UserStatus.values[random.nextInt(UserStatus.values.length)].name,
    'createdAt': DateTime.now().toIso8601String(),
    'updatedAt': DateTime.now().toIso8601String(),
    'socialLinks': {
      'website':
          'https://example.com/${getRandomUsername(name['firstName']!, name['lastName']!)}',
      'linkedin':
          'https://linkedin.com/in/${getRandomUsername(name['firstName']!, name['lastName']!)}',
      'github':
          'https://github.com/${getRandomUsername(name['firstName']!, name['lastName']!)}',
    },
    'address': {
      'street': '${random.nextInt(999)} Main St',
      'city': 'Metropolis',
      'state': 'NY',
      'postalCode': '10001',
      'country': 'USA',
    },
    'preferences': {
      'language': 'en',
      'theme': 'dark',
      'notifications': {
        'email': true,
        'sms': random.nextBool(),
        'push': random.nextBool(),
      },
    },
    'tasks': List.generate(5, (_) => random.nextInt(50) + 1),
    'activityLogs': [
      {
        'id': random.nextInt(1000),
        'action': 'logged_in',
        'timestamp': DateTime.now().toIso8601String(),
      },
    ],
    'settings': {
      'timezone': 'America/New_York',
      'dateFormat': 'MM/DD/YYYY',
      'timeFormat': '12h',
    },
  };
}

void main() async {
  List<Map<String, dynamic>> users = List.generate(
    10,
    (index) => generateUser(index + 1),
  );
  String jsonData = jsonEncode(users);

  final file = File('users.json');
  await file.writeAsString(jsonData);
}
