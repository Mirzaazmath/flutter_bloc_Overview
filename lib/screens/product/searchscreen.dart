import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/searchbloc/searchbloc.dart';
import 'package:flutter_bloc_example/bloc/searchbloc/searchstates.dart';
import 'package:flutter_bloc_example/data/fruitsdata.dart';

import '../../bloc/addtocartbloc/addtocartbloc.dart';
import '../../bloc/addtocartbloc/addtocartstates.dart';
class SearchScreen extends StatelessWidget {
   const SearchScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:const  EdgeInsets.symmetric(horizontal: 10),

        width: double.infinity,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10),
         border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3))
       ),
          child: TextFormField(

            onChanged: (value){
            context.read<SearchBloc>().searchproduct(value);

            },
            decoration:  InputDecoration(
              hintText: "Search..",
              suffixIcon: Icon(Icons.search,color: Theme.of(context).primaryColor,),
              border: InputBorder.none
            ),
          ),
        ),
      const   SizedBox(height: 20,),
        BlocBuilder<SearchBloc,SearchStates>(
          builder: (context,state) {

            if(state is SearchInitialState){
              return Container();
            }else if(state is SearchUpdatedState){

            return Expanded(
              child:searchedlist.isEmpty?Container():  ListView.builder(
                  physics:const  ClampingScrollPhysics(),

                  itemCount: searchedlist.length,
                  itemBuilder: (context,index){
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),

                        height: 100,
                        width: double.infinity,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(searchedlist.elementAt(index).image),fit: BoxFit.fill
                                    )
                                )
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(searchedlist.elementAt(index).name,style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Price: ',
                                      style: DefaultTextStyle.of(context).style,
                                      children:  <TextSpan>[
                                        TextSpan(text: "\$${searchedlist.elementAt(index).price}", style: TextStyle(fontWeight: FontWeight.bold)),

                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),

                            BlocBuilder<AddtoCartBLoc,AddtoCartStates>(
                                builder: (context,state){
                                  if(state is AddtoCartInitalState){
                                    return

                                      GestureDetector(
                                        onTap: (){
                                          context.read<AddtoCartBLoc>().addtocartforfirsttime(fruitlist[index]);
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


                                    if(  addtocartlist.contains(searchedlist.elementAt(index))){
                                      Fruit item=addtocartlist.firstWhere((element) => element.name==searchedlist.elementAt(index).name);
                                      return   Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              context.read<AddtoCartBLoc>().decrement(searchedlist.elementAt(index));
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
                                              context.read<AddtoCartBLoc>().increament(searchedlist.elementAt(index));
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
                                      );
                                    }else{
                                      return    GestureDetector(
                                        onTap: (){
                                          context.read<AddtoCartBLoc>().addtocartforfirsttime(searchedlist.elementAt(index));
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
                    );

                  }),
            );
          }else{
              return Container();
            }}
        ),


      ],
    );
  }
}
