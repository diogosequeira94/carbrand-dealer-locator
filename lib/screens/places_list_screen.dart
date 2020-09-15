import 'dart:io';

import 'package:car_dealer_service/providers/great_places.dart';
import 'package:car_dealer_service/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Car Locations'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              },)
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('No Car Dealers yet') ,
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0 ? ch :
        ListView.builder(
          itemCount: greatPlaces.itemsCount,
          itemBuilder: (ctx, i) => ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(
                greatPlaces.itemByIndex(i).image,
              ),
            ),
            title: Text(greatPlaces.itemByIndex(i).title),
            onTap: (){},
          ),
        ),
      ),
    );
  }
}
