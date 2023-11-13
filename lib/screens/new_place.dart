import 'dart:io';

import 'package:favorite_places/models/new_place_model.dart';
import 'package:favorite_places/provider/favorite_place_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    if (titleController.text.isEmpty ||
        titleController.text.trim().length > 50 ||
        _selectedImage == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                'Make sure that the title is entered and not more than 50 words.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            );
          });
    } else {
      setState(() {
        ref.read(favoritePlaceProvider.notifier).onAddingPlace(
              Place(
                title: titleController.text,
                image: _selectedImage!,
              ),
            );
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              decoration: InputDecoration(
                label: const Text('Title'),
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              maxLength: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            ImageInput(
              onAddImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const LocationInput(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _savePlace,
                  child: const Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Add Place'),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
