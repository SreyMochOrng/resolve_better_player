import 'better_player_subtitles_source_type.dart';

class BetterPlayerSubtitlesSource {
  ///Source type
  final BetterPlayerSubtitlesSourceType type;

  ///Name of the subtitles, default value is "Default subtitles"
  final String name;

  ///Url of the subtitles, used with file or network subtitles
  final List<String> urls;

  ///Content of subtitles, used when type is memory
  final String content;

  BetterPlayerSubtitlesSource({
    this.type,
    this.name = "Default subtitles",
    this.urls,
    this.content,
  });

  factory BetterPlayerSubtitlesSource.single({
    BetterPlayerSubtitlesSourceType type,
    String name = "Default subtitles",
    String url,
    String content,
  }) =>
      BetterPlayerSubtitlesSource(
        type: type,
        name: name,
        urls: [url],
        content: content,
      );
}
