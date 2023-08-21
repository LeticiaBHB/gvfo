import 'package:dados/shared/widgets/video_alert.dart';
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
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showVideoAlert() {
    showDialog(
      context: context,
      builder: (context) => VideoAlert(_videoController),
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
                onTap: _showVideoAlert, // Mostra o AlertDialog com o vídeo
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
