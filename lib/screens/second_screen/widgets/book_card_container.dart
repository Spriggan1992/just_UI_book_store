import 'package:book_store/models/book.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class BookCardContainer extends StatelessWidget {
  const BookCardContainer({
    Key key,
    @required this.book,
    @required this.value,
  }) : super(key: key);

  final Book book;
  final double value;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Flexible(
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
                        : Icon(Icons.star_border)),
                SizedBox(
                  width: defaultSize * 1,
                ),
                TextHolder(
                    title: '${value.toString()}', fontWeight: FontWeight.bold),
                TextHolder(title: ' / 5.0', color: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }
}
