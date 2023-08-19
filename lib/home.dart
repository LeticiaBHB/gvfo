import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInSine,
  );

  late final VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/foguete.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown before playing
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final dialogHeight = screenHeight * 0.5;

        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: dialogHeight,
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          children: [
                            VideoPlayer(_videoController),
                            Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: () {
                                  if (_videoController.value.isPlaying) {
                                    _videoController.pause();
                                  } else {
                                    _videoController.play();
                                  }
                                },
                                icon: Icon(
                                  _videoController.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.black.withOpacity(0.7),
                          child: Text(
                            "Este é um Easter Egg:\nOlhe como é por dentro do foguete",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                  child: Text("Voltar"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _showAlert();
                },
                child: Center(
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizeTransition(
                      sizeFactor: _animation,
                      axis: Axis.vertical,
                      axisAlignment: -1,
                      child: Image.asset(
                        "assets/foguete.jpeg",
                        color: Colors.yellowAccent[100],
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.cover,
                        width: 400,
                        height: 600,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 400,
                  height: 100,
                  child: Transform.rotate(
                    angle: -15 * (3.141592653589793 / 180),
                    child: Center(
                      child: Text(
                        ' HBH Companhia Interestelar',
                        style: TextStyle(
                          color: Colors.yellowAccent[200],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white12,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                child: Text(
                  "login",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                child: Text(
                  "cadastre-se",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
