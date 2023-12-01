import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class details_page extends StatefulWidget {
  const details_page({super.key});

  @override
  State<details_page> createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  @override
  CarouselController carouselController = CarouselController();
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    List img = data['images'];

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 450,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(seconds: 2),
              disableCenter: true,
            ),
            carouselController: carouselController,
            items: [
              ...data['images']
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.all(20),
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          // darker shadow on the bottom right
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 15,
                            offset: Offset(10, 10),
                          ),

                          // lighter shadow on the top left
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 15,
                            offset: Offset(-10, -10),
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(e), fit: BoxFit.cover),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
          Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("${data['title']}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "${data['brand']}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("⭐️ ${data['rating']}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
