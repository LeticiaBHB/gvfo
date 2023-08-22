import 'package:dados/model/card_detail.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;

  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            elevation: 16,
            shadowColor: Colors.amberAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                  Center(
                        child:Image.network(cardDetail.url, height: 200),
                  ),
                  Text(
                    cardDetail.title,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Flexible(
                      child: Text(
                        cardDetail.text,
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
