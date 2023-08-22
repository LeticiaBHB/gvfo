import 'package:dados/model/card_detail.dart';
import 'package:dados/paginas_dentrologin/card_detail_page.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  var cardDetail = CardDetail(
    1,
    'Novidades',
    'https://th.bing.com/th/id/OIG.yvvaiXdCsLBt9uTzYLAE?pid=ImgGn',
    'Quisque imperdiet accumsan nisl ac efficitur. Cras massa nulg. Donec us eu maximus eget, consequat sit amet purus. Nunc dapibun auctor. Nunc ultrices, mauris eleifend ultrices vehicula, ante purus placerat odio magna porta varius sollicitudin sit amet lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer faucibus, orci eget conc.',
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardDetailPage(
                    cardDetail: cardDetail,
                  )));
            },
            child: Hero(
              tag: cardDetail.id,
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
                            Image.network(cardDetail.url,
                                height: 20, fit: BoxFit.contain),
                            SizedBox(width: 8),
                            Text(
                              cardDetail.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          cardDetail.text,
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
