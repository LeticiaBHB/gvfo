import 'package:dados/model/card_detail.dart';
import 'package:dados/paginas_dentrologin/card_detail_page.dart';
import 'package:dados/repositories/card_detail_repository.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get(); // Use a variável de instância
    setState(() {});
  }

@override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: cardDetail == null ? LinearProgressIndicator() : InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardDetailPage(
                            cardDetail: cardDetail!,
                          )));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                elevation: 16,
                shadowColor: Colors.amberAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(cardDetail!.url,
                                height: 20, fit: BoxFit.contain),
                            SizedBox(width: 8),
                            Text(
                              cardDetail!.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          cardDetail!.text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ler mais',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
