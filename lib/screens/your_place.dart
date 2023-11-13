import 'package:favorite_places/models/new_place_model.dart';
import 'package:flutter/material.dart';

class YourPlace extends StatelessWidget {
  const YourPlace({
    super.key,
    required this.place,
  });
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
