import 'package:flutter/material.dart';
import 'package:gitpod_flutter_quickstart/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BLoC tanpa Library'),
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
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toAmber);
              },
              backgroundColor: Colors.amberAccent),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvent.toLightBlue);
            },
            backgroundColor: Colors.lightBlueAccent,
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stateStream,
          // initialData: Colors.amberAccent,
          builder: (BuildContext context, AsyncSnapshot<Color> snapshot) =>
              AnimatedContainer(
            width: 100,
            height: 100,
            duration: const Duration(
              milliseconds: 500,
            ),
            color: snapshot.data,
          ),
        ),
      ),
    );
  }
}
