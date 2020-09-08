import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/pages/datail.page.dart';
import 'package:exercicio7start/utils/colors.dart';
import 'package:flutter/material.dart';

class ItemListFeed extends StatelessWidget {
  final News news;

  ItemListFeed({
    @required this.news,
  }) : assert(news != null);

  _goToDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      DetailPage.route,
      arguments: DetailPageArgs(
        news: news,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorUtils.backgroudItensFeed,
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/place_holder.png',
                    height: 200,
                    width: double.infinity,
                    image: news.image,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                child: Column(
                  children: [
                    Text(
                      news.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      news.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
