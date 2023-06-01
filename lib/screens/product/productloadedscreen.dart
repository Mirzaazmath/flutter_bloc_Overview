
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartbloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartstates.dart';
import 'package:flutter_bloc_example/bloc/categorybloc/cotegorybloc.dart';

import '../../data/fruitsdata.dart';

class ProductLoadedWidget extends StatelessWidget {
  const ProductLoadedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const   SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for(int i=0;i<categorylist.length;i++)...[
                BlocBuilder<CategoryCubit,int>(
                  builder: (context,state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<CategoryCubit>().updatecategory(i);
                      },

                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: state==i?Theme.of(context).primaryColor.withOpacity(0.1):Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(categorylist[i].image,),

                              Text(categorylist[i].name, style: const TextStyle(
                                  fontWeight: FontWeight.bold),)

                            ],),
                        ),
                      ),
                    );

                  }  )]
            ],
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("See all")
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding:const  EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset("assets/pome.png"),
                const   SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const   Text("Pomegranate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     const    Row(

                          children: [
                            Icon(Icons.local_fire_department,color: Colors.orange,),

                            Text("223 Calories"),
                          ],
                        ),
                        Row(

                          children: [
                            Container(
                              padding:const  EdgeInsets.all(5),
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade50
                              ),
                              child:const  Text("Unit 1",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),

                            ),
                           const  SizedBox(width: 20,),
                            RichText(
                              text: TextSpan(
                                text: '\$',
                                style: TextStyle(color: Theme.of(context).primaryColor),
                                children: const  <TextSpan>[
                                  TextSpan(text: "15.3", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),

                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const  Padding(
           padding:  EdgeInsets.symmetric(vertical: 10),
           child:   Text("Top Item",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         ),



         GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,

              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              children: <Widget>[
                for(int i=0;i<fruitlist.length;i++)...[
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          Container(
                              height: 100,
                              width: 100,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(fruitlist[i].image),fit: BoxFit.fill
                                  )
                              )
                          ),
                            Text(fruitlist[i].name,style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    RichText(
                  text: TextSpan(
                  text: 'Price: ',
                  style: DefaultTextStyle.of(context).style,
                  children:  <TextSpan>[
                   TextSpan(text: "\$${fruitlist[i].price}", style:const  TextStyle(fontWeight: FontWeight.bold)),

                   ],
                   ),),

                            BlocBuilder<AddtoCartBLoc,AddtoCartStates>(
                                builder: (context,state){
                                  if(state is AddtoCartInitalState){
                                    return

                                      GestureDetector(
                                        onTap: (){
                                          context.read<AddtoCartBLoc>().addtocartforfirsttime(fruitlist[i]);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child:const  Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),
                                      );


                                  }else{


                                    if(  addtocartlist.contains(fruitlist[i])){
                                      Fruit item=addtocartlist.firstWhere((element) => element.name==fruitlist[i].name);
                                      return   SizedBox(
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                context.read<AddtoCartBLoc>().decrement(fruitlist[i]);
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
                                              child:  Text(item.units.toString(),style:const  TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                context.read<AddtoCartBLoc>().increament(fruitlist[i]);
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
                                      );
                                    }else{
                                      return    GestureDetector(
                                        onTap: (){
                                          context.read<AddtoCartBLoc>().addtocartforfirsttime(fruitlist[i]);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child:const  Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),
                                      );



                                    }

                                  }

                                })

                          ],
                        ),
                      ),
                    
                ),
                  ]
               
              ],
            )
        ],
      ),
    );
  }
}