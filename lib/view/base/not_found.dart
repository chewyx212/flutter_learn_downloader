import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ResponsiveHelper.isDesktop(context)
      //     ? PreferredSize(
      //         child: WebAppBar(), preferredSize: Size.fromHeight(100))
      //     : null,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          duration: Duration(seconds: 2),
          tween: Tween<double>(begin: 12.0, end: 30.0),
          builder: (BuildContext context, double value, Widget? child) {
            return Text('Page not found',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: value));
          },
        ),
      ),
    );
  }
}
