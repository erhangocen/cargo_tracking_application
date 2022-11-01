import 'package:flutter/material.dart';
import 'package:flutter_application_hello_world/models/Cargo.dart';
import 'package:flutter_application_hello_world/screens/cargo_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /* theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue), */
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Cargo> cargos = [
    Cargo.withId(1, "909287876453", "Istanbul", "Bolu", "Ankara", 3),
    Cargo.withId(2, "852988726475", "Berlin", "New York", "New York", 0),
    Cargo.withId(3, "634295476425", "Tokyo", "Bagdat", "Istanbul", 9)
  ];

  Cargo selectedCargo = Cargo("sssss", "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Cargo Tracking System"),
      ),
      body: buildBody(),
      bottomNavigationBar: bottomNavigator(),
    );
  }

  Widget buildBody() {
    return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cargos.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  minLeadingWidth: 50,
                  minVerticalPadding: 15,
                  horizontalTitleGap: 25,
                  title: Text(cargos[index].trackingCode.toString()),
                  subtitle: Padding(padding: EdgeInsets.fromLTRB(5,0,0,0),
                  child: Text("Destination: " + cargos[index].startCity.toString() + " - " + cargos[index].destinationCity.toString() + "\n " + cargos[index].getStatus),),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pinimg.com/474x/ed/e9/1a/ede91a9940f1773c786ffe603c46d58c.jpg"),
                  ),
                  trailing: buildStatusIcon(cargos[index].getStatus),
                  onTap: (){
                    setState(() {
                      this.selectedCargo = cargos[index];
                    });
                    print(this.selectedCargo.trackingCode);
                  },
                );
              },
            ),
          ),
          Text(selectedCargo.trackingCode.toString()),
          Padding(padding:  EdgeInsets.fromLTRB(0,10,0,10),
            child:  Row(
                children: <Widget>[
                  SizedBox(width: 15),
                  generateButton(Colors.blue, Icons.add, "Add", ()=>(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CargoAdd(cargos)));
                  }),
                  SizedBox(width: 15),
                  generateButton(Colors.green, Icons.update, "Update", ()=>(){print("update");}),
                  SizedBox(width: 15),
                  generateButton(Colors.red, Icons.delete, "Delete", ()=>(){print("delete");}),
                  SizedBox(width: 15),
                ]
            ),
          )
        ],
      );
  }
}

Widget buildStatusIcon(String status){
  if(status == "Kargo Ulasti"){
    return Icon(Icons.done);
  }
  else{
    return Icon(Icons.clear);
  }
}

Widget generateButton(MaterialColor color, IconData icon, String text, f()){
  return Flexible(
    fit: FlexFit.tight,
    flex: 2,
    child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => color)),
        child: Row(
          children: <Widget> [
            Icon(icon),
            SizedBox(width: 5),
            Text(text)
          ],
        ),
        onPressed: f()),
  );
}


Widget bottomNavigator(){

  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home_max),
    Icon(Icons.menu),
    Icon(Icons.person)
  ];
  
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.menu)),
      ],
    );
}

