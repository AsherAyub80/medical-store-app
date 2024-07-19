class PriceModel {
  final int price;
  final int tablet;

  PriceModel({required this.price, required this.tablet});
}

class ProductModel {
  final String title;
  final String image;
  final String subtitle;
  final int orignalprice;
  final int discountprice;
  final String pricetitle;
  final List<PriceModel> pricelist;
  final String desc;
  final String ingred;
  final String expiry;
  final String brandname;
  final double rating;
  final int ratingnum;
  final int reviews;
  final List<dynamic> ratingper;
  int quantity;
  final List<dynamic> ratings;
  int selectedVariantIndex;
  final List<Map> userrew;

  ProductModel(
      {required this.title,
      required this.image,
      required this.subtitle,
      required this.orignalprice,
      required this.discountprice,
      required this.pricetitle,
      required this.pricelist,
      required this.desc,
      required this.ingred,
      required this.expiry,
      required this.brandname,
      required this.rating,
      required this.ratingnum,
      required this.reviews,
      required this.ratingper,
      required this.userrew,
      required this.ratings,
      required this.quantity,
      this.selectedVariantIndex = 0});

  int get selectedPrice => pricelist[selectedVariantIndex].price;

  int get selectedTabletCount => pricelist[selectedVariantIndex].tablet;

  void updateSelectedVariant(int newIndex) {
    if (newIndex >= 0 && newIndex < pricelist.length) {
      selectedVariantIndex = newIndex;
    }
  }
}

final List<ProductModel> dental = [
  ProductModel(
      title: 'Accu-check Active Test Strip 1',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 80,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.2,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      quantity: 1,
      image: 'images/accu.png',
      ratings: [5, 4, 3, 2, 1]),
  ProductModel(
      title: 'Accu-check Active Test Strip 2',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        75,
        10,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.4,
        }
      ],
      image: 'images/product.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check Active Test Strip 3',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 80,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.2,
      ratingnum: 989,
      reviews: 265,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      quantity: 1,
      image: 'images/accu.png',
      ratings: [5, 4, 3, 2, 1]),
  ProductModel(
      title: 'Accu-check Active Test Strip 4',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 80,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.2,
      ratingnum: 989,
      reviews: 265,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      quantity: 1,
      image: 'images/product.png',
      ratings: [5, 4, 3, 2, 1]),
];

final List<ProductModel> wellness = [
  ProductModel(
      title: 'Accu-check wellness Test Strip 1',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.7,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        80,
        10,
        3,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.8,
        }
      ],
      image: 'images/med.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check wellness Test Strip 2',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/product.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check wellness Test Strip 3',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.7,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        80,
        10,
        3,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.8,
        }
      ],
      image: 'images/med.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check wellness Test Strip 4',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.7,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        80,
        10,
        3,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.8,
        }
      ],
      image: 'images/product.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
];

final List<ProductModel> homeo = [
  ProductModel(
      title: 'Accu-check homeo Test Strip 1 ',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/accu.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check homeo Test Strip 2',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/med.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check homeo Test Strip 3',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/accu.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check homeo Test Strip 4',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/med.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1)
];
final List<ProductModel> eyeCare = [
  ProductModel(
      title: 'Accu-check eyeCare Test Strip 1',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/product.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check eyeCare Test Strip 2',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/med.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check eyeCare Test Strip 3',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/accu.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1),
  ProductModel(
      title: 'Accu-check eyeCare Test Strip 4',
      subtitle: 'Etiam mollis metus non purus ',
      orignalprice: 99,
      discountprice: 56,
      pricetitle: 'Etiam mollis ',
      pricelist: [
        PriceModel(price: 106, tablet: 100),
        PriceModel(price: 166, tablet: 150),
        PriceModel(price: 256, tablet: 180),
      ],
      desc:
          ' Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ',
      ingred:
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
      expiry: '24/06/2025',
      brandname: 'Something',
      rating: 4.5,
      ratingnum: 986,
      reviews: 255,
      ratingper: [
        65,
        20,
        8,
        5,
        2,
      ],
      userrew: [
        {
          'time': '19/07/24',
          'name': 'Erric Hoffman',
          'comment':
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
          'userrating': 4.2,
        }
      ],
      image: 'images/med.png',
      ratings: [5, 4, 3, 2, 1],
      quantity: 1)
];
