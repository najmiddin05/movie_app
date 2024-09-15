import "package:hive/hive.dart";
import "package:movie_app/core/constants.dart";

final class LocalSource {
  LocalSource(this.box);

  final Box<dynamic> box;

  Future<void> setAccessToken(String accessToken) async {
    await box.put(AppKeys.accessToken, accessToken);
  }

  String get accessToken => box.get(AppKeys.accessToken,
      defaultValue:
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzM1MzAxOWZmNmJlMDExODZiNGFlODk0ZjVkZGRkZCIsIm5iZiI6MTcyNjIwMzMzNS42NjY4NSwic3ViIjoiNjZlMmZkYzEwMDAwMDAwMDAwYjkzNWZmIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.iqU1eCpTGXM8XCSRTkUwJmw9pc8Kg-Cx-YFPaC2dqZg");

  Future<void> clear() async {
    await box.clear();
  }
}
