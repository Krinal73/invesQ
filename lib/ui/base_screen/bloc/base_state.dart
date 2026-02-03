part of 'base_bloc.dart';

class BaseState extends Equatable {
  const BaseState({
    this.baseScreenType = BaseScreenType.profile,

    this.apiStatus,
  });

  final BaseScreenType baseScreenType;

  final ApiStatus? apiStatus;

  BaseState copyWith({BaseScreenType? baseScreenType, ApiStatus? apiStatus}) {
    return BaseState(
      baseScreenType: baseScreenType ?? this.baseScreenType,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [baseScreenType, apiStatus];
}
