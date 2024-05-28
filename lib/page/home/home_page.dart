import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practice_ui_27/data/data_res.dart';
import 'package:practice_ui_27/data/models/categori_model.dart';
import 'package:practice_ui_27/data/models/news_model.dart';
import 'package:practice_ui_27/data/models/product_model.dart';
import 'package:practice_ui_27/page/home/widget/indicator_category.dart';
import 'package:practice_ui_27/page/home/widget/item_product.dart';
import 'package:practice_ui_27/page/home/widget/title_category.dart';
import 'package:practice_ui_27/res/widget/appbar_client.dart';
import 'package:practice_ui_27/res/widget/image_viewer.dart';
import 'package:practice_ui_27/res/widget/new_collection.dart';
import 'package:practice_ui_27/res/widget/text_custom.dart';
import 'package:practice_ui_27/utils/color.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Category> categories = DataRes().categories;
  final List<Product> products = DataRes().produces;
  final List<News> newsList = DataRes().newsList;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late CarouselController innerCarouselController;
  late CarouselController outerCarouselController;
  int innerCurrentPage = 0;
  int outerCurrentPage = 0;

  @override
  void initState() {
    innerCarouselController = CarouselController();
    outerCarouselController = CarouselController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int itemsPerPage = 8; // Số categories mỗi trang (4 x 2)
    int totalPages = (categories.length / itemsPerPage).ceil();

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(180.0), child: AppBarClient()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              IndicatorCategory(totalPages: totalPages, currentPage: _currentPage),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: totalPages,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, pageIndex) {
                    int startIndex = pageIndex * itemsPerPage;
                    int endIndex = (startIndex + itemsPerPage > categories.length)
                        ? categories.length
                        : startIndex + itemsPerPage;
                    List<String> pageCategories =
                        categories.sublist(startIndex, endIndex).cast<String>();

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: pageCategories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: dividerColor,
                              ),
                              child: Center(
                                child: Image.asset(categories[index].img),
                              ),
                            ),
                            TextCustom(
                                textTile: categories[index].title,
                                color: textColor,
                                fontSized: 12,
                                fontWeight: FontWeight.w400)
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              TitleCategory(
                image: "assets/icon/hot_deals.png",
                title: "Hot Deals",
                isShowIcon: true,
              ),
              SizedBox(height: 20),
              ItemProduct(list: products),
              SizedBox(height: 20),
              // Flash sale section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon/flash.png",
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextCustom(
                          textTile: "Flash Sale",
                          color: textColor,
                          fontSized: 16,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        width: 10,
                      ),
                      TextCustom(
                          textTile: "End in",
                          color: textColor,
                          fontSized: 10,
                          fontWeight: FontWeight.w500)
                    ],
                  ),
                  TextCustom(
                      textTile: "See All",
                      color: primaryColor,
                      fontSized: 10,
                      fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: 20),
              ItemProduct(list: products),
              SizedBox(height: 20),
              // banner section
              Container(child: _outerBannerSlider()),
              SizedBox(height: 20),
              TitleCategory(
                image: "image",
                title: "New Arrival",
                isShowIcon: false,
              ),
              SizedBox(height: 20),
              ItemProduct(list: products),
              SizedBox(height: 20),
              //banner section 2
              Container(child: _outerBannerSlider()),
              SizedBox(height: 20),
              TitleCategory(image: "image", title: "Natural Care", isShowIcon: false),
              SizedBox(height: 20),
              ItemProduct(list: products),
              SizedBox(height: 20),

              //banner section 3
              Container(child: _outerBannerSlider()),
              SizedBox(
                height: 20,
              ),
              TitleCategory(image: "image", title: "News & Articles", isShowIcon: false),
              SizedBox(
                height: 20,
              ),
              // item news section
              Container(
                height: 225,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final newsItem = newsList[index];
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                height: 120,
                                width: 160,
                                color: Colors.black,
                                child: Image.network(
                                  newsItem.imgUrl,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Container(
                                width: 160,
                                child: TextCustom(
                                    textTile: newsItem.title,
                                    color: textColor,
                                    fontSized: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: TextCustom(
                                            textTile: newsItem.date,
                                            color: textColor,
                                            fontSized: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: TextCustom(
                                            textTile: newsItem.views.toString(),
                                            color: textColor,
                                            fontSized: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20),
              TitleCategory(image: "image", title: "More from our store", isShowIcon: false),
              SizedBox(height: 20),

              // list view item more from out store
              Container(
                height: 400,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Số cột là 2
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final productItem = products[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 105,
                                width: double.infinity,
                                color: Colors.black,
                                child: Image.network(
                                  productItem.img,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: NewCollectionRibbon(),
                                ),
                                left: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextCustom(
                                textTile: productItem.title,
                                color: textColor,
                                fontSized: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SmoothStarRating(
                                  allowHalfRating: false,
                                  // onRatingChanged: (v) {
                                  //   productItem.rate = v;
                                  //   setState(() {});
                                  // },
                                  starCount: 5,
                                  rating: productItem.rate,
                                  size: 12.0,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_border,
                                  color: primaryColor,
                                  borderColor: primaryColor,
                                  spacing: 0.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, bottom: 10),
                                child: TextCustom(
                                    textTile: productItem.prices.toString(),
                                    color: primaryColor,
                                    fontSized: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _outerBannerSlider() {
    return Column(
      children: [
        CarouselSlider(
          carouselController: outerCarouselController,

          /// It's options
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            aspectRatio: 16 / 8,
            viewportFraction: .95,
            onPageChanged: (index, reason) {
              setState(() {
                outerCurrentPage = index;
              });
            },
          ),

          /// Items
          items: DataRes.outerStyleImages.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                /// Custom Image Viewer widget
                return CustomImageViewer.show(
                    context: context, url: imagePath, fit: BoxFit.fill, radius: 0);
              },
            );
          }).toList(),
        ),

        const SizedBox(
          height: 10,
        ),

        /// Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            DataRes.outerStyleImages.length,
            (index) {
              bool isSelected = outerCurrentPage == index;
              return GestureDetector(
                onTap: () {
                  outerCarouselController.animateToPage(index);
                },
                child: AnimatedContainer(
                  width: isSelected ? 30 : 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor : dividerColor,
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
