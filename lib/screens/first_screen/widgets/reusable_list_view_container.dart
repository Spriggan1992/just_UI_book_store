import 'package:book_store/models/book.dart';
import 'package:book_store/screens/second_screen/second_screen.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:book_store/widgets/text_holder.dart';
import 'package:flutter/material.dart';

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
