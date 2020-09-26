import 'package:book_store/utils/size_config.dart';
import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class MainBtn extends StatelessWidget {
  const MainBtn({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultSize * 1)),
      padding: EdgeInsets.symmetric(vertical: defaultSize * 1.7),
      color: kMainColor,
      onPressed: () {},
      child: TextHolder(
        title: title,
        color: Color(0xFFd0b5d7),
      ),
    );
  }
}
