import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:causeways_live/data/model/response/base/api_response.dart';
import 'package:causeways_live/data/model/response/onboarding_model.dart';
import 'package:causeways_live/data/repository/onboarding_repo.dart';

class OnBoardingProvider with ChangeNotifier {
  final OnBoardingRepo onboardingRepo;

  OnBoardingProvider({required this.onboardingRepo});

  List<OnboardingModal> _cameraLists = [];
  List<OnboardingModal> _tuasList = [];
  List<OnboardingModal> _woodLandList = [];
  double _rate = 0.0;

  List<OnboardingModal> get onBoardingList => _cameraLists;
  List<OnboardingModal> get tuasList => _tuasList;
  List<OnboardingModal> get woodLandList => _woodLandList;
  double get rate => _rate;

  List<int> whiteList = [4712, 4713, 4703, 2701, 2702, 2704];

  void initBoardingList(BuildContext context) async {
    ApiResponse apiResponse = await onboardingRepo.getSGTrafficCamera(context);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      List<OnboardingModal> list = apiResponse
          .response!.data['items'][0]['cameras']
          .map<OnboardingModal>((camera) => OnboardingModal.fromJson(camera))
          .toList();
      _cameraLists.clear();
      _woodLandList.clear();
      _tuasList.clear();
      List<OnboardingModal> newList = [];
      List<OnboardingModal> tList = [];
      List<OnboardingModal> wList = [];
      list.forEach((camera) {
        if (whiteList.contains(int.parse(camera.id))) {
          DateTime date =
              DateFormat("yyyy-M-dTHH:mm:ss").parse(camera.timestamp);
          camera.timestamp = DateFormat("yyyy-M-d HH:mm").format(date);
          if (camera.id == '4712') {
            camera.title = 'After Tuas West Road';
            tList.add(camera);
          }

          if (camera.id == '4713') {
            camera.title = 'Tuas Checkpoint';
            tList.add(camera);
          }

          if (camera.id == '4703') {
            camera.title = 'Tuas Second Link';
            tList.add(camera);
          }

          if (camera.id == '2701') {
            camera.title = 'Woodland Causeway - Towards Johor';
            wList.add(camera);
          }

          if (camera.id == '2702') {
            camera.title = 'Woodland Checkpoint - Towards BKE';
            wList.add(camera);
          }

          if (camera.id == '2704') {
            camera.title = 'Woodlands Flyover - Towards Checkpoint';
            wList.add(camera);
          }

          newList.add(camera);
        }
      });
      // tList.add(OnboardingModal(
      //     id: '0001',
      //     title: 'CIQ Entry From JB',
      //     image:
      //         'http://www.checkpoint.sg/camera/ciq1/3b8f4e121abf620605c22cd20b7a02010426a6315fcc391db2afbceb857a47f8/b4272408b96b25f31f2125785ac1571f3e775e0d10fe8c1661be0d42e5b46869',
      //     timestamp: ''));
      // tList.add(new OnboardingModal(
      //     id: '0002',
      //     title: 'CIQ Entry From SG',
      //     image:
      //         'http://www.checkpoint.sg/camera/ciq2/7ef201845efec460e16c3c4fb1511812b4f400e832b1f01a40192a7b7130dc54/78b8958aeca05f8305d21fef34b1b28fdff28475f28cf5950efeff227e196b24',
      //     timestamp: ''));
      _woodLandList.addAll(wList);
      _tuasList.addAll(tList);
      _cameraLists.addAll(newList);
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }

  void getCurrencyData(BuildContext context) async {
    ApiResponse apiResponse = await onboardingRepo.getCurrenyRate(context);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      double result = apiResponse.response!.data['conversion_rates']['MYR'];
      _rate = result;
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }
}
