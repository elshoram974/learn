import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagrba/controller.dart';
import 'package:tagrba/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHomeController>(
        init: MyHomeController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
              appBar: AppBar(title: const Text("List")),
              body: ListView.builder(
                itemCount: controller.modelList.length,
                itemBuilder: (context, index) {
                  MyModelName modelName = controller.modelList[index];
                  return ListTile(
                    onTap: () => controller.onTap(index),
                    onLongPress: () => controller.onLongPress(index),
                    leading: Text(modelName.id.toString()),
                    title: Text(modelName.name),
                    subtitle: Text(modelName.note.toString()),
                    trailing: Text(modelName.dateTime!.year.toString()),
                  );
                },
              ),
            ),
          );
        });
  }
}
