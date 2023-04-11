import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/cubit/PostCubit/postStates.dart';
import 'package:flutter_bloc_example/cubit/PostCubit/todocubit.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Bloc Api Handling"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: BlocConsumer<TodoCubit,TodoState>(
            listener: (context,state){
              if( state is TodoErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                  backgroundColor: Colors.red,

                  content:Text("Something Went Wrong"), ));
              }
              if( state is TodoLoadedState){
                ScaffoldMessenger.of(context).showSnackBar(
                  const
                    SnackBar(
                    backgroundColor: Colors.green,
                      content:Text("Date Fectched") ));
              }
            },
            builder: (context,state){
              if (state is TodoLoadingState){
                return  const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(state is TodoLoadedState ){
                return GridView.builder(
                  shrinkWrap: true,
                    itemCount: state.datalist.length,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 18,
                        crossAxisSpacing: 18,

                        crossAxisCount: 2



                ), itemBuilder: (context,index){
                  return  Stack(
                    children: [
                       Container(
                         padding:const  EdgeInsets.all(5),
                          width: 300,
                          height: 150,
                         decoration: BoxDecoration(
                           color: Colors.purple[900],
                           borderRadius: BorderRadius.circular(20)
                         ),
                          child: Container(
                            padding:const  EdgeInsets.all(15),
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.shade400,
                                  spreadRadius: 0,
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(child: Text(
                                    state.datalist[index].title.toString(),style: TextStyle(color: Colors.white),)),
                                
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child:state.datalist[index].completed!?const  Icon(Icons.done,color: Colors.green,size: 30,):const Icon(Icons.pending_actions,color: Colors.red,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),


                    ],
                  );

                  //   Container(
                  //   padding:const  EdgeInsets.all(19),
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //
                  //     color: Colors.amber
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       Text(state.datalist[index].title.toString())
                  //     ],
                  //   ),
                  // );
                });
              }else{
                return  const Center(
                  child: Text("An Error Occured"),
                );
              }


            },

          ) ,
        ),
      ),
    );
  }
}
