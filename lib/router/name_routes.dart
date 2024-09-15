import 'package:movie_app/router/app_routes.dart';

sealed class Routes {
  Routes._();

  static String _appendToCurrentPath(String newPath) {
    final newPathUri = Uri.parse(newPath);
    final currentUri = router.routeInformationProvider.value.uri;
    Map<String, dynamic> params = Map.of(currentUri.queryParameters);
    params.addAll(newPathUri.queryParameters);
    Uri loc = Uri(path: '${currentUri.path}/${newPathUri.path}'.replaceAll('//', '/'), queryParameters: params);
    return loc.toString();
  }

  /// Home
  static const String home = "/home";
  static const String search = "/search";
  static const String detail = "detail";
  static String detailNamed() => _appendToCurrentPath(detail);
  static const String watchList = "/watch_list";

  /// internet connection
  static const String noInternet = "/no-internet";
}
