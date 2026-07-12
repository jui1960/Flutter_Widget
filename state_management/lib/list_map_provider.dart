import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];


  //event

  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }
  void deleteData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }

  void updateData(int index, Map<String, dynamic> updatedData){
    _mData[index] = updatedData;
    notifyListeners();
  }
  List<Map<String,dynamic>> getData() => _mData; //_mData private tai tare access korar jonne geetData use korsi



}