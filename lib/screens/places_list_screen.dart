import 'package:car_dealer_service/utils/app_routes.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text("No Car dealers selected yet"),
      ),
    );
  }
}
