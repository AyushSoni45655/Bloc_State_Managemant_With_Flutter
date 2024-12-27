import 'package:equatable/equatable.dart';

import '../../modal/favorite_app_modal.dart';

abstract class FavoriteEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class fetchFavoriteItem extends FavoriteEvent{}
class wishlistToggleProduct extends FavoriteEvent{
  final favoriteAppModal favoriteItem;
  wishlistToggleProduct({required this.favoriteItem});
}
class selectEvent extends FavoriteEvent{
  final favoriteAppModal selectedItem;
  selectEvent({required this.selectedItem});
}
class unSelectEvent extends FavoriteEvent {
  final favoriteAppModal selectedItem;

  unSelectEvent({required this.selectedItem});
}
class deleteItem extends FavoriteEvent{}