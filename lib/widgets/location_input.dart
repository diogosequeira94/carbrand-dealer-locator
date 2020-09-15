import 'package:flutter/material.dart';
import 'package:location/location.dart';


class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _imageUrlPreview;

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey,
            ),
          ),
          child: _imageUrlPreview == null
              ? Text('Location not Informed')
              : Image.network(
            _imageUrlPreview,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () => _getCurrentLocation(),
                textColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.location_on),
                label: Text('Current Location'),
            ),
            FlatButton.icon(
              onPressed: (){},
              textColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
            )
          ],
        )
      ],
    );
  }
}
