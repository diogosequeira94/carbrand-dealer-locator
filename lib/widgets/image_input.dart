import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: Text('No Image'),
        ),
        SizedBox(height: 10),
        Expanded(
          child: FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.camera),
              textColor: Theme.of(context).primaryColor,
              label: Text('Take picture')
          ),
        ),
      ],
    );
  }
}
