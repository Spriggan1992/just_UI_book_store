import 'package:book_store/utils/size_config.dart';
import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

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
                    Icon(
                      icon[index],
                      size: defaultSize * 2,
                    ),
                    SizedBox(width: defaultSize * 1),
                    TextHolder(
                        title: title[index], fontWeight: FontWeight.bold),
                  ],
                ))),
      ],
    );
  }
}
