import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/book.dart';
import '../utils/size_config.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(top: defaultSize * 6),
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 58,
              color: Color(0xFFf3e7dd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF878686),
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: Offset(1.5, 1.5))
                        ],
                        image: DecorationImage(
                            image: AssetImage(book.imgUrl), fit: BoxFit.cover),
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(defaultSize * 1)),
                    margin: EdgeInsets.only(
                      bottom: defaultSize * 2,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultSize * 2,
                    ),
                    width: defaultSize * 13,
                    height: defaultSize * 19,
                  ),
                  TextHolder(
                    title: book.title,
                    fontSize: defaultSize * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: defaultSize * 1.1),
                  TextHolder(
                      title: book.autor,
                      color: kAditionalColor,
                      fontSize: defaultSize * 1.2),
                  SizedBox(height: defaultSize * 1.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          5,
                          (index) => index < value
                              ? Icon(Icons.star, color: Color(0xFF413b89))
                              : Icon(Icons.star_border))
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: defaultSize * 3,
                        right: defaultSize * 1.5,
                        bottom: defaultSize * 2),
                    padding: EdgeInsets.only(left: defaultSize * 4),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 1.5, color: kAditionalColor))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHolder(
                          title: 'Description',
                          fontSize: defaultSize * 1.7,
                          fontWeight: FontWeight.bold,
                        ),
                        TextHolder(
                          title: book.description,
                          color: kAditionalColor,
                          height: 1.5,
                        )
                      ],
                    ),
                  ),
                  PreviewReviewBtns(
                      title: ['Preview', 'Revierw'],
                      icon: [Icons.subject, Icons.chat_bubble_outline]),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultSize * 1)),
                    padding: EdgeInsets.symmetric(vertical: defaultSize * 1.7),
                    color: kMainColor,
                    onPressed: () {},
                    child: TextHolder(
                      title: "Buy Now For \$29.67",
                      color: Color(0xFFd0b5d7),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PreviewReviewBtns extends StatelessWidget {
  const PreviewReviewBtns({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  final List<String> title;
  final List<IconData> icon;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
            2,
            (index) => Container(
                margin: EdgeInsets.only(bottom: defaultSize * 1.5),
                padding: EdgeInsets.symmetric(
                    vertical: defaultSize * 1, horizontal: defaultSize * 3.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultSize * 1),
                    border: Border.all(color: Colors.grey[300])),
                child: Row(
                  children: [
                    Icon(icon[index]),
                    SizedBox(width: defaultSize * 1),
                    TextHolder(
                        title: title[index], fontWeight: FontWeight.bold),
                  ],
                ))),
      ],
    );
  }
}
