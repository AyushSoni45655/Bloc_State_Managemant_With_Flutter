import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_event.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/favorite_app_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    context.read<FavoriteBloc>().add(fetchFavoriteItem());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<FavoriteBloc,FavoriteItemState>(
            builder: (context, state) {
              return IconButton(onPressed: (){
                context.read<FavoriteBloc>().add(deleteItem());
              }, icon: Visibility(
                visible: state.selectTempList.isNotEmpty,
                  child: const Icon(Icons.delete_rounded,color: Colors.green,size: 30,)));
            },
          ),
          const SizedBox(width: 20,)
        ],
        centerTitle: true,
        elevation: 1,
        title: Text(
          "Favorite_App",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteItemState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.LOADING:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            case ListStatus.ERROR:
              return const Center(
                child: Text("Something went wrong"),
              );
            case ListStatus.SUCCESS:
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  itemCount: state.favoriteItem.length,
                  itemBuilder: (context, index) {
                    final values = state.favoriteItem[index];
                    return Card(
                      elevation: 1,
                      child: ListTile(
                        trailing: IconButton(onPressed: (){
                          final favoriteAppModal itemModal = favoriteAppModal(
                              id: values.id, value: values.value,
                            isWishList: values.isWishList ? false : true
                          );
                          context.read<FavoriteBloc>().add(wishlistToggleProduct(favoriteItem: itemModal));
                        }, icon: Icon(
                          values.isWishList? Icons.favorite:Icons.favorite_border,
                          color: Colors.red,)
                        ),
                        leading: Checkbox(
                          value: state.selectTempList.contains(values)? true: false,
                          onChanged: (value) {
                            if(value!){
                              context.read<FavoriteBloc>().add(selectEvent(selectedItem: values));
                            }else{
                              context.read<FavoriteBloc>().add(unSelectEvent(selectedItem: values));
                            }

                          },
                        ),
                        title: Text(values.value,style:  TextStyle(
                          color: Colors.white,
                           fontSize: 22
                        ),),
                      ),
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
