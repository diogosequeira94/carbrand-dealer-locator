import 'dart:io';

import 'package:car_dealer_service/providers/great_places.dart';
import 'package:car_dealer_service/widgets/image_input.dart';
import 'package:car_dealer_service/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {

  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _submitForm(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
        _titleController.text,
        _pickedImage
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 10),
                    ImageInput(this._selectImage),
                    SizedBox(height: 10),
                    LocationInput(),
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
                onPressed: (){
                  _submitForm();
                },
                icon: Icon(Icons.add),
                label: Text('Add'),
                elevation: 0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
