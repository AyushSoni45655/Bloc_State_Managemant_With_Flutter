import 'package:equatable/equatable.dart';

import '../modal/favorite_app_modal.dart';

class FavoriteRepositry{
 Future< List<favoriteAppModal>>fetchListProducts()async{
   await Future.delayed(const Duration(seconds: 3));
     return List.of(listProduct(20));
  }
  List<favoriteAppModal>listProduct(int length){
    return List.generate(length, (index) => favoriteAppModal(id: index.toString(), value: 'Item ${index+1}'));
  }

}