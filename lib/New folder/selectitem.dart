import 'package:get/get.dart';

class Model {
  bool isSelected = false;
}

abstract class ModelController extends GetxController {
  List<Model> modelList = [];
  List<Model> _selectedList = [];

  bool isSelected = false;
  bool isAllSelected = false;

  //--------------------------------onTap---------------------------------------

  void _selectOnTap(int selectedIndex) {
    modelList[selectedIndex].isSelected = !modelList[selectedIndex].isSelected;

    if (modelList[selectedIndex].isSelected) {
      _selectedList.add(modelList[selectedIndex]);
    } else {
      _selectedList.remove(modelList[selectedIndex]);
    }

    if (_selectedList.length == modelList.length) {
      selectAllOrDeselect(true);
    } else if (_selectedList.isEmpty) {
      selectAllOrDeselect(false);
    } else {
      isAllSelected = false;
    }
    update();
  }

  void onTap(int selectedIndex) {
    if (isSelected) {
      _selectOnTap(selectedIndex);
    } else {
      // Get.to(() => SemesterScreen(semester: _semesterList[selectedIndex]));
    }
    update();
  }
  //----------------------------------------------------------------------------

  //------------------onLongPress---------------------------
  void onLongPress(int selectedIndex) {
    isSelected = true;
    onTap(selectedIndex);
    update();
  }
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  //------------------selectAllOrNot---------------------------
  void selectAllOrDeselect(bool isSelectedItem) {
    isSelected = isSelectedItem;

    isAllSelected = isSelected;

    _selectedList = [];
    _selectedList.addAllIf(isSelected, modelList);

    for (Model e in modelList) {
      e.isSelected = isSelected;
    }
    update();
  }
  //----------------------------------------------------------------------------

  int get selectedLength => _selectedList.length;

  Future<bool> onWillPop() async {
    if (isSelected) {
      selectAllOrDeselect(false);
      return false;
    }
    return true;
  }
}
