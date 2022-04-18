import 'dart:ui';

import 'package:causeways_live/data/model/response/onboarding_model.dart';
import 'package:causeways_live/util/images.dart';
import 'package:causeways_live/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:causeways_live/provider/onboarding_provider.dart';
import 'package:causeways_live/util/color_resources.dart';
import 'package:provider/provider.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    getTrafficCamList();
  }

  void getTrafficCamList() {
    print('called');
    Provider.of<OnBoardingProvider>(context, listen: false)
        .initBoardingList(context);

    Provider.of<OnBoardingProvider>(context, listen: false)
        .getCurrencyData(context);
  }

  String getBannerImage() {
    DateTime now = new DateTime.now();
    if (now.hour <= 17 && now.hour >= 5) {
      return Images.day_banner;
    } else {
      return Images.night_banner;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: CustomAppBarWidget(),
        // drawer: CustomDrawer(),
        body: Provider.of<OnBoardingProvider>(context).onBoardingList.length > 0
            ? ExtendedNestedScrollView(
                // floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      pinned: false,
                      backgroundColor: ColorResources.getBlackAndWhite(context),
                      iconTheme: IconThemeData(
                          color: ColorResources.getWhiteAndBlack(context)),
                      expandedHeight: MediaQuery.of(context).size.height * .30,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height * .30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(getBannerImage()),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: ColorResources.COLOR_WHITE
                                      .withOpacity(0.1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'v1.0.1',
                                    style: robotoRegular.copyWith(
                                        color: ColorResources.COLOR_WHITE,
                                        fontSize: 10),
                                  ),
                                  Image(
                                      width: 250,
                                      height: 50,
                                      image: AssetImage(Images.top_title)),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    constraints: BoxConstraints(maxWidth: 500),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.4),
                                          Colors.white.withOpacity(0.2),
                                        ],
                                        begin: AlignmentDirectional.topStart,
                                        end: AlignmentDirectional.bottomEnd,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Image(
                                                  height: 25.0,
                                                  width: 25.0,
                                                  image: AssetImage(
                                                      Images.circle_sg_png)),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "1 ",
                                                style: robotoBold.copyWith(
                                                    color: ColorResources
                                                        .COLOR_WHITE,
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                "SGD",
                                                style: robotoRegular.copyWith(
                                                    color: ColorResources
                                                        .COLOR_WHITE,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(
                                              height: 20.0,
                                              width: 15.0,
                                              image:
                                                  AssetImage(Images.arrow_png)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Image(
                                                  height: 25.0,
                                                  width: 25.0,
                                                  image: AssetImage(
                                                      Images.circle_my_png)),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '${Provider.of<OnBoardingProvider>(context).rate} ',
                                                style: robotoBold.copyWith(
                                                    color: ColorResources
                                                        .COLOR_WHITE,
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                "MYR",
                                                style: robotoRegular.copyWith(
                                                    color: ColorResources
                                                        .COLOR_WHITE,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                onlyOneScrollInBody: true,
                body: Consumer<OnBoardingProvider>(
                    builder: (context, onBoardingList, child) {
                  return Container(
                    child: Column(
                      children: [
                        // Tab Bar
                        Container(
                          height: 45,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TabBar(
                              indicator: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelStyle: robotoRegular.copyWith(fontSize: 16),
                              labelColor:
                                  ColorResources.getBlackAndWhite(context),
                              unselectedLabelColor:
                                  ColorResources.getWhiteAndBlack(context),
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Woodland',
                                    style: robotoMedium.copyWith(fontSize: 18),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Tuas',
                                    style: robotoMedium.copyWith(fontSize: 18),
                                  ),
                                )
                              ]),
                        ),

                        // Tab Bar Content
                        Expanded(
                          child: TabBarView(children: [
                            onBoardingList.woodLandList.length > 0
                                ? SingleChildScrollView(
                                    child: Container(
                                      color: ColorResources.BACKGROUND_COLOR,
                                      width: double.infinity,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  childAspectRatio: 7 / 5,
                                                  maxCrossAxisExtent: 500,
                                                  crossAxisSpacing: 5,
                                                  mainAxisSpacing: 5),
                                          itemCount: onBoardingList
                                              .woodLandList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                                child: CameraContainer(
                                                    item: onBoardingList
                                                        .woodLandList
                                                        .elementAt(index)));
                                          }),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                        "No data found, refresh again later."),
                                  ),
                            onBoardingList.tuasList.length > 0
                                ? SingleChildScrollView(
                                    child: Container(
                                      color: ColorResources.BACKGROUND_COLOR,
                                      width: double.infinity,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          gridDelegate:
                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                                  childAspectRatio: 7 / 5,
                                                  maxCrossAxisExtent: 500,
                                                  crossAxisSpacing: 5,
                                                  mainAxisSpacing: 5),
                                          itemCount:
                                              onBoardingList.tuasList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                                child: CameraContainer(
                                                    item: onBoardingList
                                                        .tuasList
                                                        .elementAt(index)));
                                          }),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                        "No data found, refresh again later."),
                                  ),
                          ]),
                        ),
                      ],
                    ),
                  );
                }))
            : SizedBox.shrink(),
      ),
    );
  }
}

class SvgPicture {}

class CameraContainer extends StatelessWidget {
  const CameraContainer({
    Key? key,
    // required this.id,
    required this.item,
    // required this.image,
    // required this.timestamp,
  }) : super(key: key);

  // final int id;
  // final String image;
  // final String timestamp;
  final OnboardingModal item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(item.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title!,
              style: robotoMedium.copyWith(
                  color: ColorResources.COLOR_BLACK, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              item.timestamp,
              style: robotoRegular.copyWith(
                  color: ColorResources.COLOR_GRAY, fontSize: 16),
            ),
          ]),
    );
  }
}
