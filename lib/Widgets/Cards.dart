import 'package:flutter/material.dart';

class CardItem {
  final String name;
  final double percentage;
  final String category;

  CardItem(this.name, this.percentage, this.category);
}

class Cards extends StatelessWidget {
  final List<CardItem> cardItems;

  Cards(this.cardItems);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cardItems.length,
      itemBuilder: (context, index) {
        return CardItemWidget(cardItems[index]);
      },
    );
  }
}

class CardItemWidget extends StatelessWidget {
  final CardItem cardItem;

  CardItemWidget(this.cardItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        title: Text(cardItem.name),
        subtitle: Text('Porcentaje: ${cardItem.percentage}%'),
        trailing: Text(cardItem.category),
      ),
    );
  }
}