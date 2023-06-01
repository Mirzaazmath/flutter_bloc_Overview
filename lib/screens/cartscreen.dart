import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartbloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartstates.dart';
import 'package:flutter_bloc_example/bloc/placeorderbloc/orderstates.dart';
import 'package:flutter_bloc_example/bloc/placeorderbloc/placeorderbloc.dart';
import 'package:flutter_bloc_example/data/fruitsdata.dart';
class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:const  Text("My Cart",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body:
      BlocBuilder<AddtoCartBLoc,AddtoCartStates>(builder: (context,state) {
        if(state is AddtoCartInitalState){
          return Center(child:
          Image.asset("assets/empty.png",));
        }else if(addtocartlist.isEmpty){
       return    Center(child:
          Image.asset("assets/empty.png",));

        }
        else{
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics:const  ClampingScrollPhysics(),
                  padding:const  EdgeInsets.symmetric(horizontal: 10),
                    itemCount: addtocartlist.length,
                    itemBuilder: (context,index){
                    return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),

                          height: 100,
                          width: double.infinity,
                          // color:const  Color(0xfffcfbff),
                          // color: Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(addtocartlist.elementAt(index).image),fit: BoxFit.fill
                                      )
                                  )
                              ),
                              const SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(addtocartlist.elementAt(index).name,style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Price: ',
                                        style: DefaultTextStyle.of(context).style,
                                        children:  <TextSpan>[
                                          TextSpan(text: "\$${addtocartlist.elementAt(index).price}", style: TextStyle(fontWeight: FontWeight.bold)),

                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              BlocBuilder<AddtoCartBLoc,AddtoCartStates>(
                                  builder: (context,state){

                                    return   Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '\$',
                                            style: TextStyle(color: Theme.of(context).primaryColor),
                                            children:  <TextSpan>[
                                              TextSpan(text: "${ double.parse( (addtocartlist.elementAt(index).units!*addtocartlist.elementAt(index).price).toStringAsFixed(2))}", style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),

                                            ],
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                context.read<AddtoCartBLoc>().decrement(addtocartlist.elementAt(index));
                                              },
                                              child: Container(

                                                height: 20,width: 20,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context).primaryColor,
                                                    borderRadius: BorderRadius.circular(4)

                                                ),
                                                child:const  Icon(Icons.remove,size: 20,color: Colors.white,),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 20,width: 30,
                                              decoration: BoxDecoration(
                                                //color: Theme.of(context).primaryColor,
                                                  borderRadius: BorderRadius.circular(4)

                                              ),
                                              child:  Text(addtocartlist.elementAt(index).units.toString(),style:const  TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                context.read<AddtoCartBLoc>().increament(addtocartlist.elementAt(index));
                                              },

                                              child: Container(
                                                height: 20,width: 20,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context).primaryColor,
                                                    borderRadius: BorderRadius.circular(4)

                                                ),
                                                child:const  Icon(Icons.add,size: 20,color: Colors.white,),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    );





                                  })

                            ],
                          ),

                        ),
                      );

                    }),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:const  BorderRadius.only(topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset:const  Offset(-5,-5),
                      blurRadius: 20
                    )
                  ]
                ),

                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,


                      children: [
                       const  Text("Items Select",style: TextStyle(fontWeight: FontWeight.bold),),


                        Text("${addtocartlist.length}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const   Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        RichText(
                          text: TextSpan(
                            text: '\$',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                            children:  <TextSpan>[
                              TextSpan(text: getAmountValue(), style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),

                            ],
                          ),
                        ),




                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        showLoader(context);
                        context.read<PlaceOrderBloc>().placeOrder();
                        },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            offset:const  Offset(5,5),
                            blurRadius: 10
                          ),
                            BoxShadow(
                                color: Theme.of(context).primaryColor.withOpacity(0.3),
                                offset: const Offset(-2,-2),
                                blurRadius: 10
                            )
                          ]
                        ),
                        child: const Text("Order Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                    )

                  ],

                ),

              )
            ],
          );
        }


      }
      ),

    );
  }
  String getAmountValue(){
    List<double>totalamount=[];
    for(int i=0;i<addtocartlist.length;i++){
      totalamount.add(addtocartlist.elementAt(i).units!*addtocartlist.elementAt(i).price);
    }

    return "${ double.parse( totalamount.sum.toStringAsFixed(2))}";



  }

}
void showLoader(BuildContext ctx,) {

    showDialog(
        context: ctx,
        builder: (ctx) {
          return BlocBuilder<PlaceOrderBloc,PlaceOrderStates>(
            builder: (context,state) {
              if(state is PlaceOrderLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
              }else{
              return  AlertDialog(
                title: const Text('Order Placed'),
                content: SizedBox(
                  height: 100,
                    width: 100,
                    child: Image.asset("assets/check-circle.gif")),
                actions: <Widget>[
                  GestureDetector(
                    onTap: (){
                      context.read<AddtoCartBLoc>().ordered();

                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:const  Text("Okay",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  )
                  // TextButton(

                ],
              );
              }

            }
          );
        });
  }
