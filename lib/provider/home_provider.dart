import 'package:flutter/material.dart';
import 'package:pixabay_api/helper/api_helper.dart';
import 'package:pixabay_api/modal/pixabay_modal.dart';

class HomeProvider extends ChangeNotifier {
  Pixabay? pixabay;
  Pixabay? searchResults;

  Future<void> fetchSearchPhotos(String search)
  async {
    Map json = await ApiHelper.apiHelper.fetchApiDataBySearch(search);
    searchResults = Pixabay.fromJson(json);
    notifyListeners();

  }

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