part of 'instagram_feed_bloc.dart';

class InstagramFeedState {
  bool isLoading;
  bool isEmpty;
  bool isError;
  InstagramFeedResponse instagramFeedResponse;
  InstagramFeedState(
      {required this.instagramFeedResponse, required this.isEmpty, required this.isError, required this.isLoading});
}

final class InstagramFeedInitial extends InstagramFeedState {
  InstagramFeedInitial()
      : super(
            instagramFeedResponse:
                InstagramFeedResponse(photos: [], page: 0, nextPage: '0', perPage: 0, totalResults: 0),
            isEmpty: false,
            isError: false,
            isLoading: false);
}
