import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Cubit/countercubit.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Bloc Counter"),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit,int>(
          builder: (context,state){
            return Text("$state",style:const  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
          }
        ),
      ),
      
      
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
              onPressed: (){
              context.read<CounterCubit>().increment();
              }),
        const   SizedBox(width: 100,),
          FloatingActionButton(
            backgroundColor: Colors.red,
              child: Icon(Icons.remove),
              onPressed: (){
                context.read<CounterCubit>().decrement();
              })
        ],
      ),
    );
  }
}
