import 'package:exercicio7start/components/item_list_feed.dart';
import 'package:exercicio7start/components/item_loader.dart';
import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/network/api.dart';
import 'package:exercicio7start/utils/colors.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  static const route = '/feed';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<News> _news = <News>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  _loadData() async {
    _news = await Api.retrieveLocalNews(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'News',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: ColorUtils.toolbar,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        color: ColorUtils.backgroudPages,
        child: _news.isEmpty ? itemLoader(color: Colors.white) : ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ItemListFeed(
                news: _news[index],
              ),
            );
          },
          itemCount: _news.length,
        ),
      ),
    );
  }
}
