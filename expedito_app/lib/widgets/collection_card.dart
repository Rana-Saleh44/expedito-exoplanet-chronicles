import 'package:expedito_app/models/collection_item_model.dart';
import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final CollectionItem item;

  CollectionCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(item.bronzeIcon, width: 24),
            Image.asset(item.silverIcon, width: 24),
            Image.asset(item.goldIcon, width: 24),
          ],
        ),
        title: Text(item.title),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${(item.progress * 100).toInt()}%'),
            Icon(Icons.arrow_forward),
          ],
        ),
        onTap: () {
          // Navigate to the detailed screen for this collection
        },
      ),
    );
  }
}
