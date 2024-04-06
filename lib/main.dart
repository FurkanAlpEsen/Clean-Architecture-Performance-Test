import 'package:flutter/material.dart';
import 'package:myapp/deneme_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      home: MyHomePage(title: 'dsad'),
    );
  }
}

// class Deneme extends StatefulWidget {
//   const Deneme({super.key});

//   @override
//   State<Deneme> createState() => _DenemeState();
// }

// class _DenemeState extends State<Deneme> {
//   // var controller;

//   var controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     // ..setBackgroundColor(const Color(0x00000000))
//     // ..setNavigationDelegate(
//     //   NavigationDelegate(
//     //     onProgress: (int progress) {
//     //       // Update loading bar.
//     //     },
//     //     onPageStarted: (String url) {},
//     //     onPageFinished: (String url) {},
//     //     onWebResourceError: (WebResourceError error) {},
//     //     onNavigationRequest: (NavigationRequest request) {
//     //       if (request.url.startsWith('https://www.youtube.com/')) {
//     //         return NavigationDecision.prevent;
//     //       }
//     //       return NavigationDecision.navigate;
//     //     },
//     //   ),
//     // )
//     ..loadRequest(Uri.parse(
//         'https://co-nurse.com.tr/odeme/order-pay/1294/?key=wc_order_l6T7NEx7GCpRY'));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter Simple Example')),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _showDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('sdadasdsad'),
          title: Text('dsdsd'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ddsd')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DenemeScreen();
                    },
                  ));
                },
                child: Text('eweew')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
