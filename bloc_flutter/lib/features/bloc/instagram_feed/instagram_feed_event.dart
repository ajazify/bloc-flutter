part of 'instagram_feed_bloc.dart';

@immutable
abstract class InstagramFeedEvent {}

class FetchFeeds extends InstagramFeedEvent {
  final String queryParams;
  FetchFeeds({required this.queryParams});
}
