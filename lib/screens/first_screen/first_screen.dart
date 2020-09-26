import 'package:book_store/models/book.dart';
import 'package:book_store/models/books.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../utils/size_config.dart';
import 'widgets/reusable_list_view_container.dart';

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
                          color: index == 0 ? kMainColor : kAditionalColor))
                ],
              )),
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
