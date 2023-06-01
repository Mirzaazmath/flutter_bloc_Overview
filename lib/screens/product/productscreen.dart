import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/productBloc/productBloc.dart';
import 'package:flutter_bloc_example/bloc/productBloc/productstates.dart';
import 'package:flutter_bloc_example/screens/product/productloadedscreen.dart';
import 'package:flutter_bloc_example/screens/product/productloadingscreen.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc,ProductStates>(
        builder: (context,state){
          if(state is ProductLoadingState ){
            return const  ProductLoadingScreen();
          }else if (state is ProductErrorState){
            return  Center(
                  child: Image.asset("assets/error.png"),
                );
          }
          else{
            return const ProductLoadedWidget();


          }


        });



      //ProductLoadingScreen();
      // ProductLoadedWidget();
  }
}



