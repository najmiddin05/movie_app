import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:movie_app/features/home/presentation/bloc/movie_bloc.dart";
import "package:movie_app/features/main/presentation/bloc/main_bloc.dart";
import "package:movie_app/injector_container.dart";
import "package:movie_app/router/app_routes.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
          BlocProvider<MovieBloc>(create: (_) => sl<MovieBloc>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(useMaterial3: true),
        ),
      );
}
