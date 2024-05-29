import 'package:flutter/material.dart';
import 'package:playx_home_launcher/playx_home_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  // باز کردن محیط انتخاب home برای انتخاب دیفالت برنامه اینم خوبه عالیه
  void _incrementCounter() async{
    // Returns current launcher package name
    // bool? isLauncherDefault = await PlayxHomeLauncher.checkIfLauncherIsDefault(packageName: 'com.example.untitled1');
    bool? isAppLauncher = await PlayxHomeLauncher.checkIfAppIsLauncher(packageName: 'com.example.untitled1');
    await PlayxHomeLauncher.openLauncherSettings();
    // PlayxHomeLauncher.showLauncherSelectionDialog();


    print(isAppLauncher);
  }



  // این پکیج برای زمانی استفاده میشه که بخواد مستقیم بره روی صفحه اصلی برنامه نصبی
  // گزینه خوب
  // void openAppSettings() async {
  //   final AndroidIntent intent = AndroidIntent(
  //     action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
  //     data: Uri.encodeFull('package:com.example.untitled1'), // جایگزین با پکیج‌نیم اپلیکیشن شما
  //     flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
  //   );
  //   try {
  //     await intent.launch();
  //   } catch (e) {
  //     print('Failed to open app settings: $e');
  //   }
  // }

  // این فقط یکبار میپرسه و دفعه بعدی دیگ کار نمیکنه
  // void resetLauncher() async {
  //   final AndroidIntent intent = AndroidIntent(
  //     action: 'android.intent.action.MAIN',
  //     category: 'android.intent.category.HOME',
  //     flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
  //   );
  //   await intent.launch();
  // }
  /*
  مشابه بالا
   void resetLauncher() async {
    // Launch intent to show the launcher chooser
    final AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: 'android.intent.category.HOME',
      flags: [Flag.FLAG_ACTIVITY_NEW_TASK, Flag.FLAG_ACTIVITY_CLEAR_TASK],
    );
    await intent.launch();
  }
   */

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
