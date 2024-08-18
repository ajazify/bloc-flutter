import 'package:shimmer/shimmer.dart';
import 'package:bloc_flutter/features/bloc/instagram_feed/instagram_feed_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstagramFeed extends StatelessWidget {
  const InstagramFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var searchTXT = TextEditingController();
    context.read<InstagramFeedBloc>().add(FetchFeeds(queryParams: 'city'));
    return BlocBuilder<InstagramFeedBloc, InstagramFeedState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false, 
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Search',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),

                            //! User TextForm Field
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'I cannot search nothing!';
                                  }
                                  return null;
                                },
                                controller: searchTXT,
                                decoration: InputDecoration(
                                  isDense: false,
                                  hintText: 'Type here..',
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(90),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[600],
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (_formKey.currentState!.validate()) {
                                              context
                                                  .read<InstagramFeedBloc>()
                                                  .add(FetchFeeds(queryParams: searchTXT.text));
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Searching..')),
                                              );
                                              searchTXT.clear();
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text('Search', style: TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                autofocus: true, //! Open keyboard
                              ),
                            ),
                          ],
                        ),
                      ));
            },
            child: Icon(Icons.search),
          ),
          appBar: AppBar(
            title: Text(
              'PexelBay',
              style: TextStyle(color: Colors.blueGrey.shade700),
            ),
          ),
          body: SafeArea(
            child: state.isEmpty
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.square(dimension: 100, child: Image.asset('images/empty-box.png')),
                      Text(
                        'Nothing to be fetched!',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ))
                : state.isLoading
                    ? ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => FeedTileShimmer(),
                      )
                    : ListView.builder(
                        itemCount: state.instagramFeedResponse.photos?.length,
                        itemBuilder: (BuildContext context, int index) {
                          var raw = state.instagramFeedResponse.photos![index];
                          return FeedTile(
                            avatarUrl: raw.src!.tiny ?? '',
                            caption: raw.alt ?? '',
                            imageUrl: raw.src!.original ?? '',
                            username: raw.photographer ?? '',
                          );
                        },
                      ),
          ),
        );
      },
    );
  }
}

class FeedTile extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String imageUrl;
  final String caption;

  const FeedTile({
    Key? key,
    required this.avatarUrl,
    required this.username,
    required this.imageUrl,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User avatar and username
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 20,
              ),
              const SizedBox(width: 8),
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Image
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: (context, url) => Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            height: 300,
            width: double.infinity,
            color: const Color.fromARGB(255, 11, 7, 7),
            child: const Icon(Icons.error, color: Colors.red),
          ),
        ),
        // Icons (like, comment, share)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: '$username ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FeedTileShimmer extends StatelessWidget {
  const FeedTileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User avatar and username with shimmer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 20,
                ),
              ),
              const SizedBox(width: 8),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey.shade200,
                  width: 100,
                  height: 20,
                ),
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        // Image with shimmer
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
        ),
        // Icons (like, comment, share) with shimmer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Icon(Icons.favorite_border),
              ),
              const SizedBox(width: 16),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Icon(Icons.comment_outlined),
              ),
              const SizedBox(width: 16),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Icon(Icons.send),
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Icon(Icons.bookmark_border),
              ),
            ],
          ),
        ),
        // Caption with shimmer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.grey.shade200,
              height: 20,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
