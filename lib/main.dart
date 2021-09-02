import 'package:floating_view/overlay.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        )
      ),
      // builder: (BuildContext context, Widget? child) {
      //   return LayoutBuilder(
      //       builder: (BuildContext context, BoxConstraints constraints) {
      //     if (constraints.maxWidth > 600) {
      //       return Center(
      //         child: Container(
      //           width: 600,
      //           child: child,
      //         ),
      //       );
      //     }else{
      //       return child!;
      //     }
      //   });
      // },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go page2'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => Page2()));
          },
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            TestOverLay.show(
                context: context,
                view: Material(
                    child: OutlinedButton(
                  child: Text('悬浮窗'),
                  onPressed: () {},
                )));
          },
          icon: Icon(Icons.add)),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page2'),
      ),
    );
  }
}
