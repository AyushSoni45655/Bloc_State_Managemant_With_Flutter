import 'package:bloc/bloc.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_event.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_state.dart';

import '../../modal/favorite_app_modal.dart';
import '../../repo/favorite_repositry.dart';

class FavoriteBloc extends Bloc<FavoriteEvent,FavoriteItemState>{
  List<favoriteAppModal> favorietList = [];
  List<favoriteAppModal>_tempselectUnselect = [];
  //List<favoriteAppModal> tempFavoriteList = [];
  FavoriteRepositry favoriteRepositry;
   FavoriteBloc(this.favoriteRepositry):super(FavoriteItemState()) {
    on<fetchFavoriteItem>(fetchList);
    on<wishlistToggleProduct>(toggleProduct);
    on<selectEvent>(_selectEvent);
    on<deleteItem>(_deleteItem);
    on<unSelectEvent>(_unSelectEvent);
  }
 void fetchList(fetchFavoriteItem event , Emitter<FavoriteItemState>emit)async{
     favorietList = await favoriteRepositry.fetchListProducts();
    emit(state.copyWith(favoriteItems: List.from(favorietList),listStatus: ListStatus.SUCCESS));
  }
  void toggleProduct(wishlistToggleProduct event,Emitter<FavoriteItemState>emit){
     final index = favorietList.indexWhere((element) => element.id == event.favoriteItem.id);
     favorietList[index] = event.favoriteItem;
     emit(state.copyWith(favoriteItems: List.from(favorietList)));
  }
  void _selectEvent(selectEvent event , Emitter<FavoriteItemState>emit){
     _tempselectUnselect.add(event.selectedItem);
     emit(state.copyWith(selectTempList: List.from(_tempselectUnselect)));
  }
  void _unSelectEvent(unSelectEvent event , Emitter<FavoriteItemState>emit){
_tempselectUnselect.remove(event.selectedItem);
    emit(state.copyWith(selectTempList: List.from(_tempselectUnselect)));
  }
  void _deleteItem(deleteItem event ,Emitter<FavoriteItemState>emit){
     for(int i=0; i < _tempselectUnselect.length; i++){
       favorietList.remove(_tempselectUnselect[i]);
     }
     _tempselectUnselect.clear();
     emit(state.copyWith(favoriteItems: List.from(favorietList),selectTempList: List.from(_tempselectUnselect)));
  }
}