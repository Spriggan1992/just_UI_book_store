import 'package:book_store/models/book.dart';
import 'package:book_store/models/books.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  static String id = 'first_screen';
  final List<Book> books = Books().books;
  final List<IconData> icons = [
    Icons.home,
    Icons.bookmark,
    Icons.shopping_basket,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: defaultSize * 10,
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
          bottomNavigationBar: Container(
              height: defaultSize * 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                      icons.length,
                      (index) => Icon(icons[index],
                          color: index == 0
                              ? Color(0xFF413b89)
                              : Colors.grey[400]))
                ],
              )),
          // Container(color: Colors.red, height: defaultSize * 5),
          body: _buildBody(context, defaultSize)),
    );
  }

  Widget _buildBody(BuildContext context, double defaultSize) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: SizeConfig.blockSizeVertical * 100,
          // maxWidth: SizeConfig.blockSizeHorizontal * 80,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: defaultSize * 2,
            left: defaultSize * 2,
            top: defaultSize * 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ReusableListVieContainer(books: books, title: 'Popular Now'),
              ReusableListVieContainer(books: books, title: 'Bestsellers'),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableListVieContainer extends StatelessWidget {
  const ReusableListVieContainer({
    Key key,
    @required this.books,
    this.title,
  }) : super(key: key);

  final List<Book> books;
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHolder(
            title: title,
            fontSize: defaultSize * 3.5,
            fontWeight: FontWeight.bold,
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SecondScreen(book: books[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(books[index].imgUrl)),
                            color: Color(0xFF413b89),
                            borderRadius:
                                BorderRadius.circular(defaultSize * 1)),
                        margin: EdgeInsets.only(
                          right: defaultSize * 2,
                          top: defaultSize * 2,
                          bottom: defaultSize * 1.5,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultSize * 2,
                        ),
                        width: defaultSize * 13,
                        height: defaultSize * 16,
                      ),
                    ),
                    Flexible(
                      child: TextHolder(
                        title: books[index].title,
                        fontSize: defaultSize * 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: defaultSize * 0.5),
                    Flexible(
                      child: TextHolder(
                        title: books[index].autor,
                        color: Colors.grey,
                        fontSize: defaultSize * 1.2,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
