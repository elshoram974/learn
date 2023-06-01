import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagrba/model.dart';
import 'package:tagrba/selectitem.dart';

class MyHomeController extends ModelController {
  @override
  void onInit() {
    modelList = MyModelName.list;

    super.onInit();
  }

  @override
  void onTap(int selectedIndex) {
    if (!isSelected) {
      var a = modelList[selectedIndex];
      Get.bottomSheet(
        Container(
          color: Colors.red,
          child: Text(a.note.toString()),
        ),
      );
    }
    super.onTap(selectedIndex);
  }

  @override
  void onLongPress(int selectedIndex) {
    print("on long tap aaaaaaaaaa");
    super.onLongPress(selectedIndex);
  }

  void _removeOneItem(MyModelName modelName) {
    for (int i = 0; i < modelList.length; i++) {
      if (modelList[i].isEqual(modelName)) {
        modelList.removeAt(i);
        break;
      }
    }
  }

  void delete() {
    for (MyModelName e in selectedList) {
      _removeOneItem(e);
    }
    selectAllOrDeselect(false);
  }
}
