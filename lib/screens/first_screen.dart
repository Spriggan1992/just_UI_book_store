import 'package:book_store/models/book.dart';
import 'package:book_store/models/books.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static String id = 'first_screen';
  final List<Book> books = Books().books;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: defaultSize * 2),
                child: Icon(Icons.search, color: Colors.black54),
              ),
            ],
            elevation: 0,
            leading: Icon(
              Icons.sort,
              color: Colors.black54,
            ),
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar:
              Container(color: Colors.red, height: defaultSize * 7),
          body: _buildBody(context, defaultSize)),
    );
  }

  Widget _buildBody(BuildContext context, double defaultSize) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
      child: Column(
        children: [
          SizedBox(height: defaultSize * 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: TextHolder(
                  title: 'Popular Now',
                  fontSize: defaultSize * 3,
                  fontWeight: FontWeight.bold,
                )),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.circular(defaultSize * 0.5)),
                            margin: EdgeInsets.only(
                              right: defaultSize * 2,
                              top: defaultSize * 3,
                              bottom: defaultSize * 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultSize * 2,
                            ),
                            width: defaultSize * 13,
                            height: defaultSize * 20,
                          ),
                          TextHolder(
                              title: books[index].title,
                              fontSize: defaultSize * 1.5),
                          SizedBox(height: defaultSize * 1),
                          TextHolder(
                              title: books[index].autor,
                              color: Colors.grey,
                              fontSize: defaultSize * 1.2)
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextHolder extends StatelessWidget {
  const TextHolder({
    Key key,
    @required this.title,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
