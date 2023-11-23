import 'package:af_exam_2/Helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/api_model.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: api_helper.api.getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<api_model>? apimodel = snapshot.data as List<api_model>?;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                  ),
                  itemCount: apimodel?.length,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "${apimodel?[i].thumbnail}",
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text("${apimodel?[i].title}"),
                          Text("${apimodel?[i].price} \$"),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
