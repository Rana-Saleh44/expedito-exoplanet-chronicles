import 'package:expedito_app/services/data_service.dart';
import 'package:expedito_app/widgets/collection_card.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatelessWidget {
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    final collections = _dataService.getCollectionData();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/backgrounds/home.png'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: collections.length,
          itemBuilder: (context, index) {
            return CollectionCard(item: collections[index]);
          },
        ),
      ),
    );
  }
}
