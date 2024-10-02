import 'package:expedito_app/models/collection_item_model.dart';

class DataService {
  // Simulate fetching collection data
  List<CollectionItem> getCollectionData() {
    return [
      CollectionItem(
        title: 'Gas Giants',
        progress: 0.75,
        bronzeIcon: 'assets/images/bronze_icon.png',
        silverIcon: 'assets/images/silver_icon.png',
        goldIcon: 'assets/images/gold_icon.png',
      ),
      CollectionItem(
        title: 'Eccentric Orbits',
        progress: 1.0,
        bronzeIcon: 'assets/images/bronze_icon.png',
        silverIcon: 'assets/images/silver_icon.png',
        goldIcon: 'assets/images/gold_icon.png',
      ),
      CollectionItem(
        title: 'Super-Earths',
        progress: 0.24,
        bronzeIcon: 'assets/images/bronze_icon.png',
        silverIcon: 'assets/images/silver_icon.png',
        goldIcon: 'assets/images/gold_icon.png',
      ),
    ];
  }
}
