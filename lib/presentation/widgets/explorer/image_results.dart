import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/urls.dart';
import '../../../logic/explorer_model.dart';

class ImageResults extends StatefulWidget {
  const ImageResults({Key? key}) : super(key: key);

  @override
  _ImageResultsState createState() => _ImageResultsState();
}

class _ImageResultsState extends State<ImageResults> {
  @override
  Widget build(BuildContext context) {
    String segmentations;
    List segmentationList;
    return Consumer<ExplorerModel>(builder: (context, exp, child) {
      return exp.isImagesLoading
          ? const Center(child: CircularProgressIndicator())
          : exp.imageList!.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: exp.imageList!.length,
                      itemBuilder: (context, imageIndex) {
                        return Column(
                          children: [
                            exp.categoryList[imageIndex].isEmpty
                                ? const SizedBox()
                                : SizedBox(
                                    height: 5.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          exp.categoryList[imageIndex].length,
                                      itemBuilder: (context, catIndex) {
                                        return Container(
                                          height: 5.h,
                                          width: 5.h,
                                          margin: EdgeInsets.only(right: 2.w),
                                          child: InkWell(
                                            onTap: () {
                                              segmentations =
                                                  exp.categorySegList[
                                                      imageIndex][catIndex][1];

                                              segmentationList =
                                                  jsonDecode(segmentations);
                                            },
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageBuilder:
                                                  (context, provider) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: provider,
                                                        fit: BoxFit.cover),
                                                  ),
                                                );
                                              },
                                              imageUrl: AppURLs.categoryIcon +
                                                  "${exp.categoryList[imageIndex][catIndex]}.jpg",
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            Container(
                              height: 250,
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 5.w),
                              margin: EdgeInsets.only(bottom: 3.h),
                              child:
                                  // CustomPaint(
                                  //   painter: SegmentationPainter(),
                                  //   child:
                                  CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageBuilder: (context, provider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: provider,
                                                  fit: BoxFit.cover)),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      imageUrl:
                                          exp.imageList![imageIndex]!.cocoUrl!),
                            ),
                            // ),
                          ],
                        );
                      }),
                )
              : const Text("No more images to show");
    });
  }
}
