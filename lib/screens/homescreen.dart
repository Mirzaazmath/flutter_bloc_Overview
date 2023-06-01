import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartbloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartstates.dart';
import 'package:flutter_bloc_example/bloc/navbarcubit.dart';
import 'package:flutter_bloc_example/data/fruitsdata.dart';
import 'package:flutter_bloc_example/screens/cartscreen.dart';
import 'package:flutter_bloc_example/screens/locationscreen.dart';
import 'package:flutter_bloc_example/screens/product/productscreen.dart';
import 'package:flutter_bloc_example/screens/product/searchscreen.dart';
import 'package:flutter_bloc_example/screens/profilescreen.dart';

import '../data/bottomnavbardata.dart';




class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List<Widget>screens=const  [
    ProductScreen(),
    // CartScreen(),
    SearchScreen(),
    Locationscreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 1,
        leading: const Padding(
          padding:  EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/person.jpeg"),
          ),
        ),
        centerTitle: false,
        backgroundColor:Colors.white,
  
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Dev_73arner",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            Text("Good Morning",style: TextStyle(color: Theme.of(context).indicatorColor,fontWeight: FontWeight.normal,fontSize: 15),),

          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Theme.of(context).primaryColor,)),
          Stack(
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
              }, icon: Icon(Icons.shopping_bag,color: Theme.of(context).primaryColor,)),
              Positioned(
                  right: 10,
                  top: 10,
                  child:  BlocBuilder<AddtoCartBLoc,AddtoCartStates>(

                      builder: (context,state) {
                        if (state is AddtoCartUpdatedState){
                          return addtocartlist.length==0?Container():  CircleAvatar(radius: 6,
                            backgroundColor : const Color(0xfffb982b),
                            child: Text(addtocartlist.length.toString(),style: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                          );
                        }else{
                          return Container();
                        }

                      }
                  ))
            ],
          ),



        ],
      ),
      body: BlocBuilder<NavbarCubit,int>(
        builder: (context,state){
          return Padding(
            padding: const  EdgeInsets.only(left: 10,right: 10,top: 10),
            child: screens[state],
          );
        },
      ),



      bottomNavigationBar: Container(
        padding:const  EdgeInsets.symmetric(vertical: 13,horizontal: 15),
        decoration:const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
          topRight: Radius.circular(25), )
        ),
       
        height: 70,
        child: BlocBuilder<NavbarCubit,int>(
          builder: (context,state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(int i=0;i<navbarlist.length;i++)...[
                  GestureDetector(
                    onTap: (){
                      context.read<NavbarCubit>().updatenavbar(i);

                    },
                    child: Column(
                      children: [
                        Icon(navbarlist[i].icon,color:state==i?Theme.of(context).primaryColor: Theme.of(context).indicatorColor,),
                        const  SizedBox(height: 2,),
                      Text(navbarlist[i].title,style: TextStyle(color:state==i?Theme.of(context).primaryColor: Theme.of(context).indicatorColor),)
                      ],
                    ),
                  )
                ]
              ],
            );
          }
        ),
      ),

    );
  }
}
