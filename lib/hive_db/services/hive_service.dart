import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';

@lazySingleton
class HiveService {
  final _hiveInterface = locator<HiveInterface>();

  isExists({String boxName}) async {
    final openBox = await _hiveInterface.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await _hiveInterface.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = List<T>();

    final openBox = await _hiveInterface.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }

  getBoxAtIndex<T>(String boxName, int index) async {
    int length = _hiveInterface.box(boxName).length;

    if (index >= length) {
      return "INDEX_ERROR";
    }

    final openBox = await _hiveInterface.openBox(boxName);

    var result = openBox.getAt(index);

    return result as T;
  }

  updateBoxAtIndex<T>(String boxName, var newBox, int oldBoxIndex) async {
    int length = _hiveInterface.box(boxName).length;

    if (oldBoxIndex >= length) {
      return "INDEX_ERROR";
    }

    newBox = newBox as T;

    final openBox = await _hiveInterface.openBox(boxName);

    await openBox.putAt(oldBoxIndex, newBox);
  }
}
