import 'package:flutter/material.dart';
import 'package:flutter_animation/animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Animation")),
        body: const MyHomePage(title: 'Flutter Animation'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var to change color
  bool selected = false;

  // var to change padding
  double padValue = 0.0;

  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  // var to change img
  bool crossFade = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              height: selected ? 100.0 : 300.0,
              color: Colors.pink.shade50,
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              duration: const Duration(seconds: 1),
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 50, maxHeight: 300),
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis ante nec ligula vestibulum, et auctor nisl congue. Maecenas at neque at tellus fringilla fringilla. Nulla laoreet quam nibh, ac hendrerit augue ultricies sit amet. Integer vel velit gravida, blandit nulla ultricies, dapibus turpis. Praesent facilisis purus sed dignissim dapibus. Curabitur ornare ligula sed consectetur ullamcorper. Aliquam lacinia metus non ante ullamcorper, ultrices rhoncus mi fringilla.")),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _updatePadding(padValue == 0.0 ? 50.0 : 0.0);
              });
            },
            child: AnimatedPadding(
              padding: EdgeInsets.fromLTRB(padValue, padValue, padValue, 0),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.pink.shade400,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Animated Padding"),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    crossFade = !crossFade;
                  });
                },
                child: AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  firstChild: const FlutterLogo(
                      style: FlutterLogoStyle.horizontal, size: 100.0),
                  secondChild: const FlutterLogo(
                      style: FlutterLogoStyle.stacked, size: 100.0),
                  crossFadeState: crossFade
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              const MyAnimation(),
            ],
          ),
        ],
      ),
    );
  }
}
