import 'dart:io';
import 'dart:math';

import 'package:car_dealer_service/models/place.dart';
import 'package:car_dealer_service/repository/db_repository.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image){
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );

    _items.add(newPlace);
    DbRepository.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
    notifyListeners();
  }

  Future<void> loadPlaces() async {
    final dataList = await DbRepository.getData('places');
    _items = dataList.map(
          (item) => Place(
        id: item['id'],
        title: item['title'],
        location: null,
        image: File(item['image']),
      ),
    ).toList();
    notifyListeners();
  }
}