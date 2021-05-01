import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ontix/services/services.dart';
import 'package:ontix/ui/pages/pages.dart';
import 'package:provider/provider.dart';

import 'bloc/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//(_)pengganti context yang tidak digunakan
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>(create: (_) => PageBloc(onInitialPage())),
          BlocProvider<UserBloc>(create: (_) => UserBloc(UserInitial())),
          BlocProvider<ThemeBloc>(
              create: (_) => ThemeBloc(ThemeState(ThemeData()))),
          BlocProvider<MovieBloc>(
              create: (_) => MovieBloc(MovieInitial())..add(FetchMovie())),
          BlocProvider<TicketBloc>(create: (_) => TicketBloc(TicketState([]))),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}
