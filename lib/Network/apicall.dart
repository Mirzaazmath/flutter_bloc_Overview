import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// here we are Creating the Api Class only once so we can access it in entire project
class API{

  // here we are Initailizing the Dio Package into a private varaible "_dio"
  Dio _dio=  Dio();


  // Here we are creating the constructor of our Api Class
  API(){

    // Dio Provide Many Option within it
    // So Here we are assiging the base url of our project

    _dio.options.baseUrl="https://jsonplaceholder.typicode.com";

    // This help to print the request and response "PrettyDioLogger" is another package console logger
    _dio.interceptors.add(PrettyDioLogger());
  }

  /*
  * Note that we have created the _private varaible for our class to
  * get access to it now we are creating the getter */

  // syntax==== Type get fatArrow Variable

Dio get todorequest=>_dio;



}