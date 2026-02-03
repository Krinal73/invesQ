part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object?> get props => [];
}

class OnTapBottomNavigationItemEvent extends BaseEvent {
  const OnTapBottomNavigationItemEvent({required this.baseScreenType});

  final BaseScreenType baseScreenType;
}
