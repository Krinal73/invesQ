import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invesq/utils/logger_utils.dart';

class BlocProviderObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    LoggerUtils().getLogger.i(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    LoggerUtils().getLogger.i(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    LoggerUtils().getLogger.i(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    LoggerUtils().getLogger.e(stackTrace.toString());
    super.onError(bloc, error, stackTrace);
  }
}
