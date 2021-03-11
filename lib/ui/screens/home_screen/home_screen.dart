import 'package:flutter/material.dart';
import 'package:flutter_app/data/dto/unsplash.dart';
import 'package:flutter_app/data/repository/unsplash_repository.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:flutter_app/ui/screens/detail_screen/detail_screen.dart';
import 'package:flutter_app/ui/widget/custom_text_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_screen_cubit.dart';


class HomeScreen extends StatelessWidget {
  final HomeScreenCubit _cubit = HomeScreenCubit(UnsplashRepository());

  HomeScreen() {
    _cubit.getUnsplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
      cubit: _cubit,
      builder: (context, state) {
        if (state is HomeScreenLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HomeScreenSuccess) {
          final Unsplash unsplash = state.unsplashlist;
          final List<Results> unsplashList = unsplash.results.map((e) => e).toList();

          return Center(
            child: listViewImageCard(unsplashList),
          );
        }
        return (Container());
      },
      listener: (context, state) {
        if (state is HomeScreenError) {
          _showSnackBarError(context);
        }
      },
    ));
  }

  _goToDetailScreen(BuildContext context, Results results) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(detailProp: results)));
  }

  _showSnackBarError(BuildContext context) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error', style: TextStyle(color: Colors.red))));

  ListView listViewImageCard(List<Results> unsplashList) {
    return ListView.builder(
        itemCount: unsplashList.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => _goToDetailScreen(context, unsplashList[i]),
            child: Hero(
              tag: '${unsplashList[i].id}',
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(unsplashList[i].urls.thumb),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: column(unsplashList, i) // color: Colors.green, child: Text(unsplashList[i].id)
                  ),
            ),
          );
        });
  }

  Column column(List<Results> unsplashList, int i) {
    return Column(
                  children: [
                    CustomTextCard(
                      value: author,
                      textValue: unsplashList[i].user.name,
                    ),
                    CustomTextCard(
                      value: pictureTitle,
                      textValue: unsplashList[i].altDescription,
                    )
                  ],
                );
  }
}
