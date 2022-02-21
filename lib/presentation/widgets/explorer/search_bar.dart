import 'package:coco_app/constants/colors.dart';
import 'package:coco_app/constants/styles.dart';
import 'package:coco_app/logic/explorer_model.dart';
import 'package:coco_app/repositories/server_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExplorerModel>(builder: (context, exp, child) {
      ServerRepository _serverRepo = ServerRepository();

      return Container(
        margin: EdgeInsets.all(6.w),
        child: TextField(
          readOnly: true,
          maxLines: 1,
          style: AppStyles.searchTextStyle,
          controller: exp.searchController,
          decoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: () {
                  exp.clearCategoryList();
                  exp.updateLoadingState(true);
                  _serverRepo
                      .getImagesByCats(exp.searchIndex)
                      .then((imagesByCats) {
                    _serverRepo.getImages(imagesByCats).then((images) {
                      exp.updateImageList(images);
                      exp.updateLoadingState(false);
                    });

                    _serverRepo.getInstances(imagesByCats).then((instances) {
                      exp.updateInstanceList(instances);

                      int _image1Id = exp.imageList![0]!.id!;
                      int _image2Id = exp.imageList![1]!.id!;
                      int _image3Id = exp.imageList![2]!.id!;
                      int _image4Id = exp.imageList![3]!.id!;
                      int _image5Id = exp.imageList![4]!.id!;

                      for (int i = 0; i < exp.insatnceList!.length; i++) {
                        int imageId = exp.insatnceList![i]!.imageId!;
                        int catId = exp.insatnceList![i]!.categoryId!;
                        String seg = exp.insatnceList![i]!.segmentation;

                        if (imageId == _image1Id) {
                          if (!exp.categoryList[0].contains(catId)) {
                            exp.assignCategory(0, catId);
                            exp.assignSegmentation(0, [catId, seg]);
                          }
                        } else if (imageId == _image2Id) {
                          if (!exp.categoryList[1].contains(catId)) {
                            exp.assignCategory(1, catId);
                            exp.assignSegmentation(1, [catId, seg]);
                          }
                        } else if (imageId == _image3Id) {
                          if (!exp.categoryList[2].contains(catId)) {
                            exp.assignCategory(2, catId);
                            exp.assignSegmentation(2, [catId, seg]);
                          }
                        } else if (imageId == _image4Id) {
                          if (!exp.categoryList[3].contains(catId)) {
                            exp.assignCategory(3, catId);
                            exp.assignSegmentation(3, [catId, seg]);
                          }
                        } else if (imageId == _image5Id) {
                          if (!exp.categoryList[4].contains(catId)) {
                            exp.assignCategory(4, catId);
                            exp.assignSegmentation(4, [catId, seg]);
                          }
                        }
                      }
                    });
                  });
                },
                child: const Icon(Icons.search)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: const BorderSide(
                color: AppColors.appBarColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: const BorderSide(
                color: AppColors.appBarColor,
                width: 1,
              ),
            ),
            focusColor: AppColors.appBarColor,
            labelText: "Select icon above",
            labelStyle: AppStyles.searchTextStyle,
          ),
        ),
      );
    });
  }
}
