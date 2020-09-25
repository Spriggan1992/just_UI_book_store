import 'book.dart';

final String description3 =
    'Getting ready for sleep is tons of fun in this Sandra Boynton classic. The sun has set not long ago. Now everybody goes below to take a bath in one big tub with soap all over--SCRUB SCRUB SCRUB This classic bedtime story is just right for winding down the day as a joyful, silly group of animals scrub scrub scrub in the tub, brush and brush and brush their teeth, and finally rock and rock and rock to sleep.';

class Books extends Book {
  final List<Book> books = [
    Book(
        title: 'The Great Gatsby',
        autor: ' F. Scott Fitzgerald',
        description: description3,
        imgUrl: 'assets/images/gatsby.jpg'),
    Book(
        title: 'ART UNLEASHED',
        autor: ' W. Haden Blackman',
        description: description3,
        imgUrl: 'assets/images/star_wars.jpg'),
    Book(
        title: 'The Going to Bed Book',
        autor: 'Sandra Boynton',
        description: description3,
        imgUrl: 'assets/images/to_bed.jpg'),
  ];
}
