import 'package:causeways_live/util/images.dart';
import 'package:flutter/material.dart';
import 'package:causeways_live/provider/onboarding_provider.dart';
import 'package:causeways_live/util/color_resources.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.splash),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      ColorResources.COLOR_BLACK.withOpacity(.2),
                      BlendMode.darken)),
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Image(
                width: 280,
                image: AssetImage(Images.top_title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
