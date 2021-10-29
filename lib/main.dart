// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'help_screen.dart';

// import 'package:talkjs/talkjs.dart';
// import "package:universal_html/html.dart";

// void createInbox() {
//   final me = User(
//     UserOptions()
//       ..id = '12345'
//       ..name = 'George Looney'
//       ..email = 'george@looney.net'
//       ..photoUrl = 'https://talkjs.com/docs/img/george.jpg'
//       ..welcomeMessage = 'Hey there! How are you? :-)',
//   );

//   final talkSession = Session(
//     SessionOptions()
//       ..appId = '<APP_ID>'
//       ..me = me,
//   );

//   final other = User(
//     UserOptions()
//       ..id = '54321'
//       ..name = 'Ronald Raygun'
//       ..email = 'ronald@teflon.com'
//       ..photoUrl = 'https://talkjs.com/docs/img/ronald.jpg'
//       ..welcomeMessage = 'Hey there! Love to chat :-)',
//   );

//   final conversationId = TalkJs.oneOnOneId(me, other);
//   final conversation = talkSession.getOrCreateConversation(conversationId);
//   conversation.setParticipant(me);
//   conversation.setParticipant(other);

//   final inbox = TalkJsInbox(
//     talkSession.createInbox(
//       InboxOptions()..selected = conversation,
//     ),
//   );

//   final el = document.getElementById('talkjs-container');
//   if (el == null) return;

//   inbox.mount(el);
// }
main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  // addTalkJsScript();
  //final div = DivElement();
  //div.id = 'talkjs-container';
  //document.body!.append(div);
  //await TalkJs.ready;/
  //createInbox();
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
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const HelpScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const HelpScreen();
  }
}
