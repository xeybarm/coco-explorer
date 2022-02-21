import 'package:coco_app/presentation/widgets/appbar/main_appbar.dart';
import 'package:coco_app/presentation/widgets/explorer/categories.dart';
import 'package:coco_app/presentation/widgets/explorer/search_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/explorer/image_results.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          Categories(),
          const SearchBar(),
          const ImageResults(),
        ],
      ),
    );
  }
}
