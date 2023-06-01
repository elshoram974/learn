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
    return const GetMaterialApp(
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
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () => controller.isAllSelected
                        ? controller.selectAllOrDeselect(false)
                        : controller.selectAllOrDeselect(true),
                    icon: controller.isAllSelected
                        ? const Icon(Icons.deselect)
                        : const Icon(Icons.select_all),
                  ),
                  if (controller.isSelected)
                    IconButton(
                      onPressed: controller.delete,
                      icon: const Icon(Icons.delete),
                    ),
                  const SizedBox(width: 20)
                ],
                title: Text(
                  controller.isSelected
                      ? "${controller.selectedLength} selected item"
                      : "List",
                ),
              ),
              body: ListView.builder(
                itemCount: controller.modelList.length,
                itemBuilder: (context, index) {
                  MyModelName modelName = controller.modelList[index];
                  return ListTile(
                    selected: modelName.isSelected,
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
