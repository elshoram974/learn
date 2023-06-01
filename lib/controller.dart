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
    print("on tap aaaaaaaaaa");
    super.onTap(selectedIndex);
  }

  @override
  void onLongPress(int selectedIndex) {
    print("on long tap aaaaaaaaaa");
    super.onLongPress(selectedIndex);
  }
}
