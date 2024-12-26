import 'package:equatable/equatable.dart';

class favoriteAppModal extends Equatable {
  final String id;
  final String value;
  final bool deleted;
  final bool isWishList;
  const favoriteAppModal({
    required this.id,
    required this.value,
    this.deleted = false,
    this.isWishList = false,
  });

  favoriteAppModal coyWith(
      {String? id, String? value, bool? deleted, bool? isWishList}) {
    return favoriteAppModal(
        id: id ?? this.id,
        value: value ?? this.value,
        isWishList: isWishList ?? this.isWishList,
        deleted: deleted ?? this.deleted);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, deleted, isWishList];
}
