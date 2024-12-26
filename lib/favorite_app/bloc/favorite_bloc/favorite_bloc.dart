import 'package:bloc/bloc.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_event.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_state.dart';

import '../../modal/favorite_app_modal.dart';
import '../../repo/favorite_repositry.dart';

class FavoriteBloc extends Bloc<FavoriteEvent,FavoriteItemState>{
  List<favoriteAppModal> favorietList = [];
  FavoriteRepositry favoriteRepositry;
   FavoriteBloc(this.favoriteRepositry):super(FavoriteItemState()) {
    on<fetchFavoriteItem>(fetchList);
  }
 void fetchList(fetchFavoriteItem event , Emitter<FavoriteItemState>emit)async{
     favorietList = await favoriteRepositry.fetchListProducts();
    emit(state.copyWith(favoriteItems: List.from(favorietList),listStatus: ListStatus.SUCCESS));
  }
}