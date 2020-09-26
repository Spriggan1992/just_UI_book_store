import 'package:book_store/models/book.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'main_btn.dart';
import 'preview_review_btns.dart';

class DescriptionAndBtnsContainer extends StatelessWidget {
  const DescriptionAndBtnsContainer({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Flexible(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultSize * 2,
                  right: defaultSize * 1.5,
                  bottom: defaultSize * 2),
              padding: EdgeInsets.only(left: defaultSize * 4),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 1.5, color: kAditionalColor))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHolder(
                    title: 'Description',
                    fontSize: defaultSize * 1.7,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: defaultSize * 0.5),
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
            MainBtn(title: "Buy Now For \$29.67")
          ],
        ),
      ),
    );
  }
}
