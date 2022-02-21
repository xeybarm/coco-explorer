import 'package:flutter/widgets.dart';
import '../models/images_entity.dart';
import '../models/instances_entity.dart';

class ExplorerModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  int searchIndex = 0;

  List<ImagesEntity?>? imageList = [];
  List<InstancesEntity?>? insatnceList = [];
  List<List<int?>> categoryList = [[], [], [], [], []];
  List<List<dynamic>> categorySegList = [[], [], [], [], []];

  bool isImagesLoading = false;

  void updateSearchIndex(int index) {
    searchIndex = index;
    notifyListeners();
  }

  void updateLoadingState(bool state) {
    isImagesLoading = state;
    notifyListeners();
  }

  void updateImageList(List<ImagesEntity?>? newImageList) {
    imageList = newImageList;
    notifyListeners();
  }

  void updateInstanceList(List<InstancesEntity?>? newInstanceList) {
    insatnceList = newInstanceList;
    notifyListeners();
  }

  void clearCategoryList() {
    categoryList[0].clear();
    categoryList[1].clear();
    categoryList[2].clear();
    categoryList[3].clear();
    categoryList[4].clear();
    notifyListeners();
  }

  void assignCategory(int imageIndex, int categoryId) {
    categoryList[imageIndex].add(categoryId);
    notifyListeners();
  }

  void assignSegmentation(int imageIndex, List<dynamic> catSegList) {
    categorySegList[imageIndex].add(catSegList);
    notifyListeners();
  }

  void updateSearchText(String text) {
    searchController.text = text;
    notifyListeners();
  }
}
