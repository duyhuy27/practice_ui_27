import 'package:practice_ui_27/data/models/categori_model.dart';
import 'package:practice_ui_27/data/models/news_model.dart';
import 'package:practice_ui_27/data/models/product_model.dart';

class DataRes {
  final List<Category> categories = [
    Category(id: 1, title: 'Category 1', img: 'assets/icon/cate_1.png'),
    Category(id: 2, title: 'Category 2', img: 'assets/icon/cate_2.png'),
    Category(id: 3, title: 'Category 3', img: 'assets/icon/cate_3.png'),
    Category(id: 4, title: 'Category 4', img: 'assets/icon/cate_4.png'),
    Category(id: 5, title: 'Category 5', img: 'assets/icon/cate_5.png'),
    Category(id: 6, title: 'Category 6', img: 'assets/icon/cate_6.png'),
    Category(id: 7, title: 'Category 7', img: 'assets/icon/cate_7.png'),
    Category(id: 8, title: 'Category 8', img: 'assets/icon/cate_8.png'),
    Category(id: 6, title: 'Category 6', img: 'assets/icon/cate_6.png'),
    Category(id: 7, title: 'Category 7', img: 'assets/icon/cate_7.png'),
    Category(id: 8, title: 'Category 8', img: 'assets/icon/cate_8.png'),
    Category(id: 6, title: 'Category 6', img: 'assets/icon/cate_6.png'),
    Category(id: 7, title: 'Category 7', img: 'assets/icon/cate_7.png'),
    Category(id: 8, title: 'Category 8', img: 'assets/icon/cate_8.png'),
  ];

  final List<Product> produces = [
    Product(1, "Collagen Peptides", 29.99, 4.5,
        "https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/11/712427-The-6-Best-Collagen-Supplements-for-Better-Skin-1296x728-Header-81b9bf.jpg?w=1155&h=1528"),
    Product(2, "Marine Collagen", 39.99, 4.7,
        "https://www.thecollagen.co/cdn/shop/products/unflavoured-collagen-powder-210g-565722.jpg?v=1697082090"),
    Product(3, "Collagen Gummies", 19.99, 4.3,
        "https://m.media-amazon.com/images/I/611Wqg+iY8L._AC_UF894,1000_QL80_.jpg"),
    Product(4, "Collagen Protein Powder", 34.99, 4.6,
        "https://m.media-amazon.com/images/I/71EkiE6R4xL._AC_UF350,350_QL80_.jpg"),
    Product(5, "Collagen Creamer", 24.99, 4.4,
        "https://www.thecollagen.co/cdn/shop/products/fruity-radiance-bundle-355349.jpg?v=1683506365"),
    Product(6, "Hydrolyzed Collagen", 32.99, 4.5,
        "https://cdn11.bigcommerce.com/s-nrewoujwic/images/stencil/1280x1280/products/4551/8508/UNF-1_5000x-removebg-preview.png__95433.1666797641.jpg?c=2"),
    Product(7, "Collagen Capsules", 22.99, 4.2,
        "https://admirebeauty.com.au/cdn/shop/products/Strawberry-Watermelon-Loose-Powder-Collagen_5000x_4e152dc4-df98-49e7-80a7-fcafc7cb4381_1800x1800.webp?v=1654737808"),
  ];

  static final List<String> innerStyleImages = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
    'https://cdn.venngage.com/template/thumbnail/small/01b644bd-e75b-4e70-b476-3a786261f066.webp',
    'https://elements-cover-images-0.imgix.net/f67401c2-06cb-4344-979b-f3234d681768?auto=compress%2Cformat&w=900&fit=max&s=75495e228f330d5446b90794cd1319ca',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
    'https://elements-cover-images-0.imgix.net/4d1f9fd2-66a1-440c-9eaf-74bc09e949ce?auto=compress%2Cformat&w=900&fit=max&s=9cfa626fde5f76a7fdb6682aca7f9b68',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTVu6fS_l1hSojzUagIa-lwFCSSeVND1mdz-KmGh0swNZU7hIiFVJXXfzpv1YKUhlxcrc&usqp=CAU',
  ];

  static final List<String> outerStyleImages = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/new-arrival-discount-offer-on-shoes-poster-ad-design-template-20e8be063593e460ec1eadf156df2a71_screen.jpg?ts=1607504280',
    'https://www.mall499.com/wp-content/uploads/2021/12/banner-skechers-1.png',
    'https://codecanyon.img.customer.envatousercontent.com/files/352931146/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=29e647d179d8704189dced38088fac34',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/shoes-craze-sale-facebook-ad-design-template-b1d1738fd5e9e0f6e3152ec502a1c2e1_screen.jpg?ts=1567579016',
    'https://codecanyon.img.customer.envatousercontent.com/files/352468295/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=cea2b1e7878f5ef6b903f9b3625460fe',
    'https://rstatic.shoecarnival.com/domain/5265_508_20231225_Winter_Season_Store_Locator_Banner2_(1).jpg',
    'https://graphicsfamily.com/wp-content/uploads/2020/07/Shoes-Advertising-Banner-Design-Template-scaled.jpg',
  ];

  final List<News> newsList = [
    News(1, "Spring 2021 Kyoto Trip 14 Day 13 Nights", "29-04-2021", 1237,
        "https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg"),
    News(2, "Winter 2021 UK Trip", "29-04-2021", 1237,
        "https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg"),
    News(3, "Summer 2022 San Francisco Trip", "29-04-2021", 1237,
        "https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg")
  ];
}
