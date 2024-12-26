import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class fetchFavoriteItem extends FavoriteEvent{}