import 'package:flutter/material.dart';
import 'package:causeways_live/util/app_constants.dart';
import 'package:causeways_live/util/color_resources.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorResources.COLOR_BLACK),
      title: Text(
        this.title != null ? this.title! : AppConstants.APP_NAME,
        style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorResources.COLOR_BLACK),
      ),
      backgroundColor: ColorResources.COLOR_WHITE,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.notifications_none),
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(55);
}
