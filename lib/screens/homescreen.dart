import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/updatecubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("State");
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Row(
          children: [
            for(int i=0;i<=4;i++)...[GestureDetector(
              onTap: (){
                context.read<UpdateCubit>().updatevalue(i);
              },
              child: BlocBuilder<UpdateCubit,int>(
                builder: (context,state) {

                  return Container(
                    margin:const  EdgeInsets.all(10),
                    height: 50,width: 50,color:state==i?Colors.white: Colors.teal,
                    alignment: Alignment.center,
                    child: Text("$i",style:  TextStyle(fontSize: 20,color:state==i?Colors.black: Colors.white),),
                  );
                }
              ),
            )]
          ],
        ),
      ),

    );
  }
}
