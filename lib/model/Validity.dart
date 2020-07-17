class Validity{
  String id;
  String days;
  String message;
  Validity({this.id,this.days,this.message});
  factory Validity.fromJSON(Map<String,dynamic> jsonMap){
    return Validity(
      // id: jsonMap["id"].toString(),
      days: jsonMap["days"].toString(),
      message: jsonMap["message"]
    );
  }

}