import 'package:book_net/dto/book/book_dto.dart';
import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/dto/news/comment_dto.dart';
import 'package:book_net/dto/news/guild_news_dto.dart';
import 'package:book_net/dto/news/post_news_dto.dart';
import 'package:book_net/dto/news/reply_comment_dto.dart';
import 'package:book_net/dto/news/review_news_dto.dart';
import 'package:book_net/dto/user/user_dto.dart';

class BaseNewsDto {
  BaseNewsDto({
    required this.id,
    required this.user,
    required this.type,
    required this.caption,
    required this.likeUserIdList,
    required this.commentList,
    required this.createDate,
  });

  String id;
  UserDto user;
  int type;
  String caption;
  List<String> likeUserIdList;
  List<CommentDto> commentList;
  int createDate;

  int get totalComment => (commentList.isEmpty)
      ? 0
      : commentList.fold<int>(
          0,
          (previousValue, element) =>
              previousValue += element.replyList.length + 1);

  int get totalLike => likeUserIdList.length;
  String get userAlias => user.alias;
  String? get userImageUrl => user.imageUrl;
}

enum NewsType {
  post(1),
  guild(2),
  review(3);

  const NewsType(this.value);
  final int value;

  static NewsType? fromInt(int value) {
    for (NewsType type in NewsType.values) {
      if (type.value == value) {
        return type;
      }
    }
    return null;
  }
}

// Use for UI testing
// PostNewsDto

final List<BaseNewsDto> newsListTest = [];

final List<BaseNewsDto> newsGuildTest = [
  guildNewsTestModel,
];

final UserDto userTestModel = UserDto(
  id: 'id',
  imageUrl: null,
  name: 'Trung Hieu',
  alias: 'trunnghieu',
  gender: 2,
  dob: '01/01/1999',
  bookShelf: ['bookShelf'],
  following: [],
  followers: [],
  guildList: ['guildList'],
  currentPoint: 100,
  highestPoint: 1000,
  createDate: 1654925791410,
  email: 'work.trunghieu.0107@gmail.com',
);

final UserDto user2TestModel = UserDto(
  id: 'id',
  imageUrl:
      'https://scontent.fhan4-3.fna.fbcdn.net/v/t39.30808-1/280775285_2818069184997713_1474989986263643790_n.jpg?stp=dst-jpg_p480x480&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_ohc=t6smf3NJEeUAX91xtfg&_nc_ht=scontent.fhan4-3.fna&oh=00_AT_DYXQBMusi5jpF-8rcXnJwUm49Z86nzflhqkrXe3anyg&oe=62B8B2FA',
  name: 'Y???n Nhi',
  alias: 'yennhi',
  gender: 2,
  dob: '01/01/1999',
  bookShelf: ['bookShelf'],
  following: [],
  followers: [],
  guildList: ['guildList'],
  currentPoint: 100,
  highestPoint: 1000,
  createDate: 1654925791410,
  email: 'work.trunghieu.0107@gmail.com',
);

final List<CommentDto> commentListTestModel = [];

late var createDate;

final commentTestModel = CommentDto(
    id: 'id',
    content: 'Commment',
    commentUser: userTestModel,
    replyList: [],
    createDate: createDate);

final replyCommentTestModel = ReplyCommentDto(
    id: 'id',
    content: 'Reply',
    commentUser: userTestModel,
    createDate: createDate);

final PostNewsDto postNewsTestModel = PostNewsDto(
    id: 'id',
    user: userTestModel,
    type: NewsType.post.value,
    caption: 'Post caption',
    likeUserIdList: [],
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/booknet-2edba.appspot.com/o/newsImages%2Ftrunnghieu%2F2022-06-23%2014%3A25?alt=media&token=c7f60ec2-529a-48d3-b487-7b50fb93d543',
    commentList: commentListTestModel,
    createDate: createDate);

// ReviewNewsDto
final ReviewNewsDto reviewNewsTestModel = ReviewNewsDto(
    id: 'id',
    user: userTestModel,
    type: NewsType.review.value,
    caption: 'Caption review',
    likeUserIdList: [],
    commentList: commentListTestModel,
    createDate: createDate,
    book: bookTestModel);

// Guild
const GuildDto guildTestModel = GuildDto(
    id: 'id',
    imageUrl:
        'https://scontent.fsgn2-5.fna.fbcdn.net/v/t1.6435-9/87220350_3114466355253620_8717576024990154752_n.jpg?stp=dst-jpg_s2048x2048&_nc_cat=102&ccb=1-7&_nc_sid=e3f864&_nc_ohc=jxQsnB6ejhgAX-Ce8gl&_nc_ht=scontent.fsgn2-5.fna&oh=00_AT-eTbC5-7_rUX24aTaaFo1xZAp5wnn4FcVgdTCP_9pyWA&oe=62BFF3EA',
    name: 'WeBook',
    description: '?????o m??o descrition',
    memberList: ['memberList']);

// GuildNewsDto
final GuildNewsDto guildNewsTestModel = GuildNewsDto(
    id: 'id',
    user: user2TestModel,
    type: NewsType.guild.value,
    caption: 'Caption guild',
    likeUserIdList: [],
    commentList: commentListTestModel,
    createDate: createDate,
    guild: guildTestModel,
    imageUrl:
        'https://images.pexels.com/photos/4581325/pexels-photo-4581325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

final List<BookDto> listBook = [
  const BookDto(
    id: '2767052-the-hunger-games',
    imageUrl:
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586722975l/2767052.jpg',
    author: 'Suzanne Collins',
    name: 'The Hunger Games',
    descrition:
        "WINNING MEANS FAME AND FORTUNE.LOSING MEANS CERTAIN DEATH.THE HUNGER GAMES HAVE BEGUN. . . .In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and once girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV.Sixteen-year-old Katniss Everdeen regards it as a death sentence when she steps forward to take her sister's place in the Games. But Katniss has been close to dead before???and survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weight survival against humanity and life against love.",
    numberOfPages: 374,
    rate: 4.33,
    numberOfRating: 6376780,
    numberOfDownloads: 12,
    reviewList: [],
  ),
  const BookDto(
    id: '2.Harry_Potter_and_the_Order_of_the_Phoenix',
    imageUrl:
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546910265l/2.jpg',
    author: 'J.K. Rowling, Mary GrandPr?? (Illustrator)',
    name: 'Harry Potter and the Order of the Phoenix',
    descrition:
        "There is a door at the end of a silent corridor. And it???s haunting Harry Pottter???s dreams. Why else would he be waking in the middle of the night, screaming in terror?Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defense Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. But all these things pale next to the growing threat of He-Who-Must-Not-Be-Named - a threat that neither the magical government nor the authorities at Hogwarts can stop.As the grasp of darkness tightens, Harry must discover the true depth and strength of his friends, the importance of boundless loyalty, and the shocking price of unbearable sacrifice.His fate depends on them all.",
    numberOfPages: 870,
    rate: 4.50,
    numberOfRating: 2507623,
    numberOfDownloads: 10,
    reviewList: [],
  ),
  const BookDto(
    id: '2657.To_Kill_a_Mockingbird',
    imageUrl:
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553383690l/2657.jpg',
    author: 'Harper Lee)',
    name: 'To Kill a Mockingbird',
    descrition:
        "There is a door at the end of a silent corridor. And it???s haunting Harry Pottter???s dreams. Why else would he be waking in the middle of the night, screaming in terror?Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defense Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. But all these things pale next to the growing threat of He-Who-Must-Not-Be-Named - a threat that neither the magical government nor the authorities at Hogwarts can stop.As the grasp of darkness tightens, Harry must discover the true depth and strength of his friends, the importance of boundless loyalty, and the shocking price of unbearable sacrifice.His fate depends on them all.",
    numberOfPages: 95,
    rate: 4.28,
    numberOfRating: 4501075,
    numberOfDownloads: 15,
    reviewList: [],
  )
];

final List<GuildDto> listGuild = [
  const GuildDto(
    id: 'guild-001',
    imageUrl:
        'https://i.pinimg.com/564x/d5/b2/31/d5b2314b8ef86b8a7949c3b209e0aaba.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-002',
    imageUrl:
        'https://i.pinimg.com/564x/94/3b/3e/943b3e7ff25ee56fa87a1bf8e62aaafe.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-003',
    imageUrl:
        'https://i.pinimg.com/564x/74/3c/13/743c13f3dd1bd7531c41526c14e4582b.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-004',
    imageUrl:
        'https://i.pinimg.com/564x/fb/2d/de/fb2ddecaf549827a2cbb8565d1102c60.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-005',
    imageUrl:
        'https://i.pinimg.com/564x/ee/8e/90/ee8e90420e2c5120ba63e81f419da1cb.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-003',
    imageUrl:
        'https://i.pinimg.com/564x/74/3c/13/743c13f3dd1bd7531c41526c14e4582b.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-004',
    imageUrl:
        'https://i.pinimg.com/564x/fb/2d/de/fb2ddecaf549827a2cbb8565d1102c60.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-005',
    imageUrl:
        'https://i.pinimg.com/564x/ee/8e/90/ee8e90420e2c5120ba63e81f419da1cb.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-003',
    imageUrl:
        'https://i.pinimg.com/564x/74/3c/13/743c13f3dd1bd7531c41526c14e4582b.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-004',
    imageUrl:
        'https://i.pinimg.com/564x/fb/2d/de/fb2ddecaf549827a2cbb8565d1102c60.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-005',
    imageUrl:
        'https://i.pinimg.com/564x/ee/8e/90/ee8e90420e2c5120ba63e81f419da1cb.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-003',
    imageUrl:
        'https://i.pinimg.com/564x/74/3c/13/743c13f3dd1bd7531c41526c14e4582b.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-004',
    imageUrl:
        'https://i.pinimg.com/564x/fb/2d/de/fb2ddecaf549827a2cbb8565d1102c60.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
  const GuildDto(
    id: 'guild-005',
    imageUrl:
        'https://i.pinimg.com/564x/ee/8e/90/ee8e90420e2c5120ba63e81f419da1cb.jpg',
    name: 'This is Guild 001',
    description: "This is desscription, this is desscription.",
    memberList: [],
  ),
];
List listTitle = [
  'I am newbie',
  'The explore',
  'This is legend',
  'The father of truth',
  'Chicken book',
  'Apolo in this book',
  'Smart girl',
  'Smart boy'
];
List listPoint = [
  100,
  200,
  500,
  1000,
  900,
  800,
  300,
  300,
];
List listSelect = [
  false,
  true,
  false,
  false,
  false,
  false,
  false,
  false,
];

List listMusic = [
  'Play date',
  'Dont break my heart',
  'Lalisa',
  'Love',
  'Summer vibe',
  '10 reasons',
  'Impossible',
  'Blackjack'
];

List listMusicAuthor = [
  'Nickki',
  'Andie',
  'Lisa BLACKPINK',
  'Elysha',
  'Tom Cruise',
  'Jaykii',
  'Demi Lovato',
  'Soobin Hoang Son',
];

List listUser = [
  userTestModel,
  userTestModel,
  userTestModel,
  userTestModel,
  userTestModel,
  userTestModel,
  userTestModel,
  userTestModel,
];
