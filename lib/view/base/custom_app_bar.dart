import 'package:flutter/material.dart';
import 'package:flutter_learn_downloader/helper/responsive_helper.dart';
import 'package:flutter_learn_downloader/util/dimensions.dart';
import 'package:flutter_learn_downloader/util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final VoidCallback? onBackPressed;
  final BuildContext context;
  CustomAppBar(
      {required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)
        ? Center(
            child: Container(
                color: Theme.of(context).cardColor,
                width: 1170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: InkWell(
                      //   onTap: () => Navigator.pushNamed(context, Routes.getMainRoute()),
                      //   child: Provider.of<SplashProvider>(context).baseUrls != null?  Consumer<SplashProvider>(
                      //       builder:(context, splash, child) => FadeInImage.assetNetwork(
                      //         placeholder: Images.placeholder_rectangle, image:  '${splash.baseUrls.restaurantImageUrl}/${splash.configModel.restaurantLogo}',
                      //         width: 120, height: 80,
                      //         imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_rectangle, width: 120, height: 80),
                      //       )): SizedBox(),
                      // ),
                    ),
                    // MenuBar(true),
                  ],
                )),
          )
        : AppBar(
            title: Text(title,
                style: robotoMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: Theme.of(context).textTheme.bodyText1?.color)),
            centerTitle: true,
            leading: isBackButtonExist
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    onPressed: () => onBackPressed != null
                        ? onBackPressed!()
                        : Navigator.pop(context),
                  )
                : SizedBox(),
            backgroundColor: Theme.of(context).cardColor,
            elevation: 0,
          );
  }

  @override
  Size get preferredSize =>
      Size(double.maxFinite, ResponsiveHelper.isDesktop(context) ? 80 : 50);
}
