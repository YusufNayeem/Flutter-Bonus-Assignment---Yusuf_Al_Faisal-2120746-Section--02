import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_class/models/card_data_model.dart';

class TaskManagementProvider with ChangeNotifier {

  final _db = FirebaseFirestore.instance;

  List<CardDataModel> tasks = [
    CardDataModel(title: "Task 1", subtitle: "This is the first task"),
    CardDataModel(title: "Task 2", subtitle: "This is the second task", icon: Icons.abc_rounded),
    CardDataModel(title: "Task 3", subtitle: "This is the third task", icon: Icons.account_balance),
    CardDataModel(title: "Task 4", subtitle: "This is the fourth task", icon: Icons.add),
    CardDataModel(title: "Task 5", subtitle: "This is the fifth task", icon: Icons.delete),
    CardDataModel(title: "Task 6", subtitle: "Custom TASK", icon: Icons.edit),
  ];

  void addTaskExternal(CardDataModel task) async {
    final docRef = await _db.collection('tasks').add({
      'title': task.title,
      'subtitle': task.subtitle,
      'description': task.description,
      'createdAt': task.createdAt,
    });

    tasks.add(CardDataModel(
      id: docRef.id,
      title: task.title,
      subtitle: task.subtitle,
      description: task.description,
      createdAt: task.createdAt,
      icon: task.icon,
    ));

    notifyListeners();
  }

  void deleteTask(String id, int index) async {
    if (id.isNotEmpty) {
      await _db.collection('tasks').doc(id).delete();
    }
    tasks.removeAt(index);
    notifyListeners();
  }

  void printTaskCount() {
    print("Total tasks: ${tasks.length}");
  }

  void addTaskAuto() async {
    final newTask = CardDataModel(
      title: "Task ${tasks.length + 1}",
      subtitle: "This is task ${tasks.length + 1}",
      description: "Auto generated task",
      icon: Icons.auto_fix_normal,
    );

    final docRef = await _db.collection('tasks').add({
      'title': newTask.title,
      'subtitle': newTask.subtitle,
      'description': newTask.description,
      'createdAt': newTask.createdAt,
    });

    tasks.add(CardDataModel(
      id: docRef.id,
      title: newTask.title,
      subtitle: newTask.subtitle,
      description: newTask.description,
      createdAt: newTask.createdAt,
      icon: Icons.auto_fix_normal,
    ));

    print("Added Task ${tasks.length}");
    notifyListeners();
  }
}