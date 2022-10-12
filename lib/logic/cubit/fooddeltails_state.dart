part of 'fooddeltails_cubit.dart';

abstract class FooddeltailsState extends Equatable {
  const FooddeltailsState();

  @override
  List<Object> get props => [];
}

class FoodLoading extends FooddeltailsState {}

class ProductdeltailsLoaded extends FooddeltailsState { 
 List<Products> product ;
  ProductdeltailsLoaded({
    required this.product,

  });
  @override
  List<Object> get props => [product];
}
