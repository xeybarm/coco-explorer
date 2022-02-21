import 'package:coco_app/constants/assets.dart';
import 'package:coco_app/presentation/pages/explorer/explorer_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => const ExplorerPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset(AppAssets.logoName),
      ),
    );
  }
}
