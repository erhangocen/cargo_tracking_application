import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Cargo.dart';

class CargoAdd extends StatefulWidget{

  List<Cargo> cargos;
  CargoAdd(this.cargos);


  @override
  State<StatefulWidget> createState() {
    return _CargoAddState();
  }

}

class _CargoAddState extends State<CargoAdd> {

  Cargo cargo = Cargo("", "", "", 0);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Cargo")),
      body: Container(
        margin: EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildTrackingCodeField(),
              SizedBox(height: 15),
              buildStartCityField(),
              SizedBox(height: 15),
              buildDestinationCityField(),
              SizedBox(height: 15),
              buildPredictionArriveDayField(),
              SizedBox(height: 15),
              buildSubmitButton()
            ],
          ),
        ),
      )
    );
  }
}

Widget buildTrackingCodeField(){

  return TextFormField(
    decoration: InputDecoration(
      labelText: "Tracking Number",
      hintText: "00000000000",
      border: OutlineInputBorder(),
    ),
    onSaved: (String? value){
     _CargoAddState().cargo.trackingCode = value;
    },
  );
}

Widget buildStartCityField(){

  return TextFormField(
    decoration: InputDecoration(
      labelText: "Start City",
      hintText: "Paris",
      border: OutlineInputBorder(),
    ),
    onSaved: (String? value){
     _CargoAddState().cargo.startCity = value;
    },
  );
}

Widget buildDestinationCityField(){

  return TextFormField(
    decoration: InputDecoration(
      labelText: "Destination City",
      hintText: "Istanbul",
      border: OutlineInputBorder(),
    ),
    onSaved: (String? value){
     _CargoAddState().cargo.destinationCity = value;
    },
  );
}

Widget buildPredictionArriveDayField(){

  return TextFormField(
    decoration: InputDecoration(
      labelText: "Prediction Arrive Day",
      hintText: "10",
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    onSaved: (String? value){
     _CargoAddState().cargo.predictionArriveDay = int.parse(value.toString());
    },
  );
}

Widget buildSubmitButton(){
  return ElevatedButton(
      onPressed: (){
        
      },
      child: Text("Save")
  );
}