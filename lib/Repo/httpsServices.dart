
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Model/todomodel.dart';
import '../Network/apicall.dart';

/// form this class we are calling the api request for todo

class TodoHttpServices{
  // but first we need the instance of api class
  API _api=API();

  Future<List<TodoModel>> fetchdata()async{

    try{
      Response response=await _api.todorequest.get("/todos");
      if(response.statusCode==200){
        List<dynamic>todolist=response.data;
        return todolist.map((Element) =>TodoModel.fromJson(Element) ).toList();
      }
      else{
        return [];
      }

      
    }catch(error){
      throw error;

    }


  }
}