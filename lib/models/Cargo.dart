class Cargo{
  int?  id;
  String? trackingCode;
  String? startCity;
  String? currentCity;
  String? destinationCity;
  int? predictionArriveDay;
  String? status;
  
  Cargo(String trackingCode, String startCity, String destinationCity, int predictionArriveDay){
    this.trackingCode = trackingCode;
    this.startCity = startCity;
    this.currentCity = startCity;
    this.destinationCity = destinationCity;
    this.predictionArriveDay = predictionArriveDay;
  }

  Cargo.withId(int id, String trackingCode, String startCity, String currentCity, String destinationCity, int predictionArriveDay){
    this.id = id;
    this.trackingCode = trackingCode;
    this.startCity = startCity;
    this.currentCity = currentCity;
    this.destinationCity = destinationCity;
    this.predictionArriveDay = predictionArriveDay;
  }

  String get getStatus{
    String message = "";
    if(this.currentCity == this.destinationCity){
      message = "Kargo Ulasti";
    }
    else{
      message = "Tahmini varis suresi " + this.predictionArriveDay.toString();
    }
    return message;
  }

}