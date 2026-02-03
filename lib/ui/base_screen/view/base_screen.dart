import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/base_bloc.dart';
import 'base_view.dart';

class BaseScreen extends StatefulWidget {
  static const String route = '/base';

  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with AutomaticKeepAliveClientMixin {
  late BaseBloc _baseBloc;
  // late ProfileBloc profileBloc;

  @override
  void initState() {
    // profileBloc = ProfileBloc();
    _baseBloc = BaseBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        // BlocProvider<ProfileBloc>.value(value: profileBloc),
        BlocProvider<BaseBloc>.value(value: _baseBloc),
      ],

      // BlocProvider<BaseBloc>(
      //   create: (context) => _baseBloc
      //     ..add(const GetArticlesEvent())
      //     ..add(const RequestNotificationPermissionEvent())
      //     ..add(const GetHomeUserResponseModelEvent()),
      //   // ..add(const GetUnreadNotificationCountEvent()),
      // ),
      // BlocProvider<NewsLetterSubscriptionBloc>(
      //   create: (context) => _newsLetterSubscriptionBloc,
      // ),
      child: const BaseView(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
