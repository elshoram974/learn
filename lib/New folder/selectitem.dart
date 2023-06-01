import 'package:get/get.dart';

class Model {
  bool isSelected = false;
}

abstract class ModelController extends GetxController {
  List<Model> modelList = [];
  List<Model> selectedList = [];

  bool isSelected = false;
  bool isAllSelected = false;

  //--------------------------------onTap---------------------------------------

  void _selectOnTap(int selectedIndex) {
    modelList[selectedIndex].isSelected = !modelList[selectedIndex].isSelected;

    if (modelList[selectedIndex].isSelected) {
      selectedList.add(modelList[selectedIndex]);
    } else {
      selectedList.remove(modelList[selectedIndex]);
    }

    if (selectedList.length == modelList.length) {
      selectAllOrDeselect(true);
    } else if (selectedList.isEmpty) {
      selectAllOrDeselect(false);
    } else {
      isAllSelected = false;
    }
    update();
  }

  void onTap(int selectedIndex) {
    if (isSelected) {
      _selectOnTap(selectedIndex);
    }
  }
  //----------------------------------------------------------------------------

  //------------------onLongPress---------------------------
  void onLongPress(int selectedIndex) {
    isSelected = true;
    onTap(selectedIndex);
  }
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  //------------------selectAllOrNot---------------------------
  void selectAllOrDeselect(bool isSelectedItem) {
    isSelected = isSelectedItem;

    isAllSelected = isSelected;

    selectedList = [];
    selectedList.addAllIf(isSelected, modelList);

    for (Model e in modelList) {
      e.isSelected = isSelected;
    }
    update();
  }
  //----------------------------------------------------------------------------

  int get selectedLength => selectedList.length;

  Future<bool> onWillPop() async {
    if (isSelected) {
      selectAllOrDeselect(false);
      return false;
    }
    return true;
  }
}
