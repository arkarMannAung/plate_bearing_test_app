import 'package:flutter/material.dart';
import 'package:testing_tool/component/drawer.dart';
import 'package:testing_tool/component/set_reading.dart';
import 'package:testing_tool/calc/cbr_result.dart';

void main() => runApp(
  MaterialApp(
  debugShowCheckedModeBanner: false,
  home:MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SetReading reading = new SetReading();
  String result='';
  String load='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Plate Bearing Test"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CBR ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text("$result%",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("K\u2083\u2080",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text("$load lb/in\u00B2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      // Text("K\u2083\u2080= lb/in\u00B2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                reading,
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                          child: FlatButton.icon(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=> MyApp()),
                              );
                            },
                            color: Colors.blueGrey,
                            icon: Icon(Icons.autorenew),
                            label: Text('New'),
                          ),
                        )
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                          child: FlatButton.icon(
                            onPressed: () {
                              cbr_result plate_result = cbr_result(
                                  data: reading.data,
                                  plateDia: reading.plateDia,
                                  plateFactor: reading.plateFactor
                              );
                              setState(() {
                                result= plate_result.calc().toStringAsFixed(2);
                                load= plate_result.getload.toStringAsFixed(2);
                              });
                            },
                            color: Colors.amber,
                            icon: Icon(Icons.trending_up),
                            label: Text('Calculation'),
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }
}

