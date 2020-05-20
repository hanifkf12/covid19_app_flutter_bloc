import 'package:covid19app/data_bloc/bloc.dart';
import 'package:covid19app/data_bloc/data_bloc.dart';
import 'package:covid19app/network/network_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covid19app/data_bloc/data_event.dart';
import 'package:quiver/time.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<DataBloc>(
        create: (context) => DataBloc()..add(LoadData()),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  NetworkProvider provider = NetworkProvider();


  @override
  Widget build(BuildContext context) {
//    DataBloc dataBloc = context.bloc<DataBloc>();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Image.asset("assets/header.jpg",height: 300,fit: BoxFit.cover,width: double.infinity,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Covid19 Indonesia",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Update Kasus Covid19 Indonesia",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text("Terakhir diupdate ${TimeOfDay.now().toString()}"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<DataBloc,DataState>(
            builder: (context, state){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20.0)),
                    width: MediaQuery.of(context).size.width / 3 - 20,
                    child: Column(
                      children: <Widget>[
                        Text((state is DataLoaded)? state.data[0].positif : "0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Positif",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20.0)),
                    width: MediaQuery.of(context).size.width / 3 - 20,
                    child: Column(
                      children: <Widget>[
                        Text((state is DataLoaded)? state.data[0].sembuh : "0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sembuh",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20.0)),
                    width: MediaQuery.of(context).size.width / 3 - 20,
                    child: Column(
                      children: <Widget>[
                        Text((state is DataLoaded)? state.data[0].meninggal : "0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Meninggal",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          )
        ],
      ),
    ));
  }
}
