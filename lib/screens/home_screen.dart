// import 'package:favorite_places/data/dummy_screens.dart';
import 'package:favorite_places/models/new_place_model.dart';
import 'package:favorite_places/provider/favorite_place_provider.dart';
import 'package:favorite_places/screens/new_place.dart';
import 'package:favorite_places/screens/your_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final existingScreens = ref.watch(favoritePlaceProvider);

    void onRemovingPlace(Place place) {
      setState(() {
        existingScreens.remove(place);
      });
    }

    Widget content = ListView.builder(
        itemCount: existingScreens.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return YourPlace(place: existingScreens[index]);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Dismissible(
                key: ValueKey(existingScreens[index].id),
                onDismissed: (direction) {
                  onRemovingPlace(existingScreens[index]);
                },
                child: Text(
                  existingScreens[index].title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ),
          );
        });

    if (existingScreens.isEmpty) {
      content = Center(
        child: Text(
          'No Place Added yet',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const NewPlace();
              }));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
