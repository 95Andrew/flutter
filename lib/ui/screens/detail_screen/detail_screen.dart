import 'package:flutter/material.dart';
import 'package:flutter_app/data/dto/unsplash.dart';


class DetailScreen extends StatelessWidget {
  final Results detailProp;
  const DetailScreen({Key key, this.detailProp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: '${detailProp.id}',
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(detailProp.urls.thumb),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
