import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/features/bloc/instagram_feed/model/instagram_feed_response.dart';
import 'package:bloc_flutter/features/bloc/instagram_feed/services/provider.dart';
import 'package:meta/meta.dart';
part 'instagram_feed_event.dart';
part 'instagram_feed_state.dart';

class InstagramFeedBloc extends Bloc<InstagramFeedEvent, InstagramFeedState> {
  InstagramFeedBloc() : super(InstagramFeedInitial()) {
    on<FetchFeeds>((event, emit) async {
      emit(InstagramFeedState(
          instagramFeedResponse: InstagramFeedResponse(), isEmpty: false, isError: false, isLoading: true));
      Map<String, dynamic> response = await ApiProvider().FetchApiList(event.queryParams);
      InstagramFeedResponse feedResponse = InstagramFeedResponse.fromJson(response);
      if (feedResponse.photos!.isNotEmpty) {
        emit(InstagramFeedState(instagramFeedResponse: feedResponse, isEmpty: false, isError: false, isLoading: false));
      } else {
        emit(InstagramFeedState(
            instagramFeedResponse: InstagramFeedResponse(), isEmpty: true, isError: false, isLoading: false));
      }
    });
  }
}
