// import 'package:favorite_places/data/dummy_screens.dart';
// import 'package:favorite_places/data/dummy_screens.dart';
import 'package:favorite_places/models/new_place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaceNotifier extends StateNotifier<List<Place>> {
  FavoritePlaceNotifier() : super([]);

  //Adding favorite place
  void onAddingPlace(Place newPlace) {
    state = [...state, newPlace];
  }
}

final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<Place>>((ref) {
  return FavoritePlaceNotifier();
});
