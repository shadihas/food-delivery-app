import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cardcounter_state.dart';

class CardcounterCubit extends Cubit<CardcounterState> {
  CardcounterCubit() : super(CardcounterState(quantity: 0,isChanged: false));


  void increment( ){
   emit(CardcounterState(quantity: state.quantity==15?state.quantity:state.quantity! +1,isChanged:state.quantity == 15? true:false));
  }
  void decrement( ){
   emit(CardcounterState(quantity:state.quantity==0?state.quantity: state.quantity! -1,isChanged: state.quantity == 0? true:false ));
  }
 
}
