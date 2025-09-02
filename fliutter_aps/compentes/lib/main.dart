import 'package:compentes/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {'/': (context) => const HomeScreen()},
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         title: const Text('Home'),
//         centerTitle: false,
//       ),
//       body: Center(child: Text('Hola Mundo: ${counter == 0 ? '' : counter}')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             counter++;
//           });
//         },
//         child: Icon(Icons.plus_one_rounded),
//       ),
//     );
//   }
// }
