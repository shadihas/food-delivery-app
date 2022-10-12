import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:food_delivery/data/model/food_data_model.dart';
import 'package:food_delivery/data/repositories/food_data_repo.dart';

part 'fooddeltails_state.dart';

class FooddeltailsCubit extends Cubit<FooddeltailsState> {
  FooddeltailsCubit(
   {required this.foodDataRepo,}
  ) : super(FoodLoading());

final FoodDataRepo foodDataRepo;
  Future getProductDetails()async{
    emit(ProductdeltailsLoaded(product:await foodDataRepo.getFoodDetailsList()));
  }
  Future getFoodList()async{
   
  }
}
