import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ProductLoadingScreen extends StatelessWidget {
  const ProductLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const   SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(int i=0;i<3;i++)...[

                      Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ),


                      ]
              ],
            ),
             Padding(
              padding: const  EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 20,width: 80,color: Colors.white,),
                  Container(height: 20,width: 80,color: Colors.white,),

                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding:const  EdgeInsets.all(10),
                height: 120,
                width: double.infinity,

              ),
            ),
              Padding(
              padding:  const EdgeInsets.symmetric(vertical: 10),
              child:  Container(height: 20,width: 80,color: Colors.white,)
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
                for(int i=0;i<10;i++)...[
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
                              color: Colors.white,
    ),
                        ],
                      ),
                    ),

                  ),
                ]

              ],
            )
          ],
        ),
      ),
    );


      // ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context,index){
      //     return Shimmer.fromColors(
      //       baseColor: Colors.grey.shade300,
      //       highlightColor: Colors.grey.shade100,
      //       child: Container(
      //         padding: const EdgeInsets.all(10),
      //
      //         height: 100,
      //         width: double.infinity,
      //
      //         // color: Theme.of(context).primaryColor.withOpacity(0.1),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             Container(
      //                 height: 90,
      //                 width: 90,
      //                 decoration:const BoxDecoration(
      //                   color: Colors.white,
      //
      //                 )
      //             ),
      //             const SizedBox(width: 20,),
      //             Expanded(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: [
      //                   Container(
      //                       height: 10,
      //                       width: 90,
      //                       decoration:const  BoxDecoration(
      //                         color: Colors.white,
      //
      //                       )
      //                   ),
      //                   Container(
      //                       height: 10,
      //                       width: 90,
      //                       decoration:const  BoxDecoration(
      //                         color: Colors.white,
      //
      //                       )
      //                   ),
      //
      //                 ],
      //               ),
      //             ),
      //             Container(
      //                 height: 40,
      //                 width: 70,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //
      //                   color: Colors.white,
      //
      //                 )
      //             ),
      //
      //           ],
      //         ),
      //
      //       ),
      //     );
      //
      //   });
  }
}
