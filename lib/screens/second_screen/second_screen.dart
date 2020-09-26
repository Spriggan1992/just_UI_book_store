import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../utils/size_config.dart';
import 'widgets/book_card_container.dart';
import 'widgets/description_and_btns_container.dart';

class SecondScreen extends StatelessWidget {
  static String id = 'second_screen';
  SecondScreen({Key key, this.book}) : super(key: key);

  final Book book;
  final List<IconData> icons = [Icons.bookmark_border, Icons.more_vert];
  final double value = 4;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: defaultSize * 10,
          leading: Padding(
            padding: EdgeInsets.only(left: defaultSize * 2),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            ...List.generate(
                icons.length,
                (index) => Padding(
                      padding: EdgeInsets.only(right: defaultSize * 2.5),
                      child: Icon(
                        icons[index],
                        color: Colors.black,
                      ),
                    ))
          ],
        ),
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BookCardContainer(book: book, value: value),
          DescriptionAndBtnsContainer(book: book)
        ],
      ),
    );
  }
}
