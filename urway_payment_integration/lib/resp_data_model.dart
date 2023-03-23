// ignore_for_file: unnecessary_this

class RespDataModel {
  String resKey = "";
  String resValue = "";

  RespDataModel({required this.resKey, required this.resValue});

  @override
  String toString() {
    return '{ ${this.resKey}, ${this.resValue} }';
  }
}
