import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_event.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_rounded,color: Colors.green,size: 30,)),
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
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,)),
                        leading: Checkbox(
                          value: isCheck,
                          onChanged: (value) {
                            isCheck = value!;
                            setState(() {

                            });
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
