import 'package:flutter/material.dart';
import 'package:pixabay_api/helper/api_helper.dart';
import 'package:pixabay_api/modal/pixabay_modal.dart';

class HomeProvider extends ChangeNotifier {
  Pixabay? pixabay;

  Future<void> fetchPhotos()
  async {
    Map json = await ApiHelper.apiHelper.fetchApiData();
    pixabay = Pixabay.fromJson(json);
    notifyListeners();
  }
  HomeProvider() {
    fetchPhotos();
  }
}