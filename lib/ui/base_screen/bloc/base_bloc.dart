import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/enum_utils.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseState()) {
    on<BaseEvent>(_mapEventToState);
  }
  void _mapEventToState(BaseEvent event, Emitter<BaseState> emit) {
    if (event is OnTapBottomNavigationItemEvent) {
      return _mapOnTapBottomNavigationItemEventToState(event, emit);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void _mapOnTapBottomNavigationItemEventToState(
    OnTapBottomNavigationItemEvent event,
    Emitter<BaseState> emit,
  ) async {
    emit(state.copyWith(baseScreenType: event.baseScreenType));
  }
}
