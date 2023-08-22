import '../model/card_detail.dart';

class CardDetailRepository{
  Future<CardDetail> get() async{
   await Future.delayed(Duration(seconds: 3));
    return CardDetail(
      1,
      'Novidades',
      'https://th.bing.com/th/id/OIG.yvvaiXdCsLBt9uTzYLAE?pid=ImgGn',
      'Quisque imperdiet accumsan nisl ac efficitur. Cras massa nulg. Donec us eu maximus eget, consequat sit amet purus. Nunc dapibun auctor. Nunc ultrices, mauris eleifend ultrices vehicula, ante purus placerat odio magna porta varius sollicitudin sit amet lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer faucibus, orci eget conc.',
    );
  }
}