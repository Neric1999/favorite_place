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
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            place.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
