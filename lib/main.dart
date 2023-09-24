import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int Count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Count: ", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Count.toString(), style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: ElevatedButton(onPressed: (){
                          Count = Count + 1;

                          if (Count == 5 ) {

                            showDialog(
                                barrierDismissible: false,
                                context: context, builder: (context) {
                              return AlertDialog(

                                title: Text("Alert"),
                                content: Text("Button pressed ${Count.toString()} times."),
                                actions: [
                                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("OK")),
                                ],

                              );
                            });
                          }
                          setState(() {

                          });
                        }, child: Text("+", style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: ElevatedButton(onPressed: (){
                          if (Count > 0) Count = Count - 1;

                          if (Count == 5) {
                            showDialog(
                              barrierDismissible: false,
                                context: context, builder: (context) {
                              return AlertDialog(

                                title: Text("Alert"),
                                content: Text("Button pressed ${Count.toString()} times."),
                                actions: [
                                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("OK")),
                                ],

                              );
                            });
                          }
                          setState(() {

                          });
                        }, child: Text("-", style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        ),
                      ),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 10, left: 0),
                    child: ElevatedButton(onPressed: (){

                      Count = 0;
                      setState(() {

                      });
                    }, child: Text("Reset", style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

