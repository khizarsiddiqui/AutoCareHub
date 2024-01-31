import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../autoshow/auto_show.dart';
import '../../../size_config.dart';


class SpecialOffers extends StatefulWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  int _currentSlide = 0; // Track the current carousel index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: getProportionateScreenWidth(158),
            viewportFraction: 0.95,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 600),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index; // Update the current index
              });
            },
          ),
          items: [
            "assets/images/auto show 1.jpg",
          ].map((image) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      if (_currentSlide == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AutoShow(),
                          ),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF343434).withOpacity(0.4),
                                  Color(0xFF343434).withOpacity(0.15),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 8), // Add spacing between carousel and dots
      ],
    );
  }
}
