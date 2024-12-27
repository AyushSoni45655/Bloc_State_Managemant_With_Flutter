// part of 'favorite_bloc.dart';
//
// @immutable
// sealed class FavoriteState {}
//
// final class FavoriteInitial extends FavoriteState {
//
// }
import 'package:equatable/equatable.dart';

import '../../modal/favorite_app_modal.dart';
enum ListStatus {SUCCESS,LOADING,ERROR}
class FavoriteItemState extends Equatable{
  final ListStatus listStatus;
    List<favoriteAppModal> favoriteItem;
    List<favoriteAppModal> selectTempList;
   FavoriteItemState({
     this.selectTempList = const [],
     this.favoriteItem = const[],
     this.listStatus = ListStatus.LOADING
   });
   FavoriteItemState copyWith({ListStatus ?listStatus,List<favoriteAppModal>?favoriteItems,List<favoriteAppModal>?selectTempList}){
     return FavoriteItemState(
       selectTempList: selectTempList??this.selectTempList,
     listStatus: listStatus??this.listStatus,
       favoriteItem: favoriteItems??this.favoriteItem
     );
}
  @override
  // TODO: implement props
  List<Object?> get props =>  [favoriteItem,listStatus,selectTempList];

}

