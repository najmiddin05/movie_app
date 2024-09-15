import "package:chuck_interceptor/chuck.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:movie_app/core/connectivity/network_info.dart";
import "package:movie_app/core/local_source/hive/local_source.dart";
import "package:movie_app/features/home/presentation/pages/detail/detail_page.dart";
import "package:movie_app/features/home/presentation/pages/home/home_page.dart";
import "package:movie_app/features/main/presentation/bloc/main_bloc.dart";
import "package:movie_app/features/main/presentation/pages/main_page.dart";
import "package:movie_app/features/others/presentation/pages/internet_connection/internet_connection_page.dart";
import "package:movie_app/features/search/presentation/pages/search_page.dart";
import "package:movie_app/features/watch_list/presentation/pages/watch_list_page.dart";
import "package:movie_app/injector_container.dart";
import "package:movie_app/router/name_routes.dart";
import "package:package_info_plus/package_info_plus.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final PackageInfo packageInfo = sl<PackageInfo>();
final NetworkInfo networkInfo = sl<NetworkInfo>();
final LocalSource localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.noInternet,
      name: Routes.noInternet,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const InternetConnectionPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (
        _,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          BlocProvider<MainBloc>(
        key: state.pageKey,
        create: (_) => sl<MainBloc>(),
        child: MainPage(
          key: state.pageKey,
          navigationShell: navigationShell,
        ),
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.home,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              name: Routes.home,
              // builder: (_, __) => const DetailPage(),
              builder: (_, __) => const HomePage(),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: Routes.detail,
                  builder: (context, state) => const DetailPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.search,
          routes: <RouteBase>[
            GoRoute(path: Routes.search, name: Routes.search, builder: (_, __) => const SearchPage(), routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: Routes.detail,
                builder: (context, state) => const DetailPage(),
              ),
            ]),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.watchList,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.watchList,
              name: Routes.watchList,
              builder: (_, __) => const WatchListPage(),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: Routes.detail,
                  builder: (context, state) => const DetailPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
