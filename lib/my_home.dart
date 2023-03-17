// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:new_bolt/openSection.dart';
import 'package:new_bolt/switch_page.dart';
import 'package:new_bolt/models.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import 'package:new_bolt/openSection.dart';
// import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hey User 👋"),
          actions: [
            Switch(
                onChanged: (bool istrue) {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const switchPage(),
                        ));
                  });
                },
                value: isSwitched,
                activeColor: Colors.blue,
                activeTrackColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white),
          ],
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: const BodyWidget());
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late Future<List> news;
  late Future<List> articles;
  late Future<List> books;

  @override
  void initState() {
    news = fetchnews();
    articles = fetcharticles();
    books = fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Streakdash(),
        // Cats Widget
        const MainWidget(),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                height: 110,
                // width: double.infinity,
                child: FutureBuilder<List>(
                  future: news,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => openPage(
                                          response:
                                              snapshot.data as List<dynamic>,
                                          index: index)));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 200,
                              // width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: snapshot.data?[index]
                                                ['urlToImage'] !=
                                            null
                                        ? NetworkImage(
                                            snapshot.data?[index]['urlToImage'])
                                        : const NetworkImage(
                                            "https://media.giphy.com/media/rj12FejFUysTK/giphy.gif")),
                              ),
                              width: 100,
                            ),
                          );
                        }),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ))
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Articles",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                height: 110,
                // width: double.infinity,
                child: FutureBuilder<List>(
                  future: articles,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => openPage(
                                            response:
                                                snapshot.data as List<dynamic>,
                                            index: index,
                                          )));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 200,
                              // width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: snapshot.data?[index]
                                                ['urlToImage'] !=
                                            null
                                        ? NetworkImage(
                                            snapshot.data?[index]['urlToImage'])
                                        : const NetworkImage(
                                            "https://media.giphy.com/media/rj12FejFUysTK/giphy.gif")),
                              ),
                              width: 100,
                            ),
                          );
                        }),
                      );
                    }
                    return const Shimmer(
                        child: MyHome(),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: [Color.fromARGB(0, 136, 136, 169)],
                            stops: [0.0, 0.35, 0.5, 0.65, 1.0]));
                  },
                ))
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Books",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                height: 110,
                // width: double.infinity,
                child: FutureBuilder<List>(
                  future: books,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => openPage(
                                          response:
                                              snapshot.data as List<dynamic>,
                                          index: index)));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 200,
                              // width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: snapshot.data?[index]
                                                ['largeImageURL'] !=
                                            null
                                        ? NetworkImage(snapshot.data?[index]
                                            ['largeImageURL'])
                                        : const NetworkImage(
                                            "https://media.giphy.com/media/rj12FejFUysTK/giphy.gif")),
                              ),
                              width: 100,
                            ),
                          );
                        }),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ))
          ],
        ),
      ],
    );
  }
}

// Streak widget
// ignore: must_be_immutable
class Streakdash extends StatelessWidget {
  Streakdash({Key? key}) : super(key: key);
  int currentstreak = 4;
  // ignore: non_constant_identifier_names
  int streak_fail = 1;

  // ignore: non_constant_identifier_names
  Color? get_color(int index) {
    if (streak_fail == 1) {
      if (index < currentstreak) {
        return Colors.yellow;
      } else if (index == currentstreak) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    } else if (streak_fail == 0) {
      currentstreak = currentstreak;
      if (index < currentstreak) {
        return Colors.yellow;
      } else {
        return Colors.grey;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 29, 29),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 25,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: MediaQuery.of(context).size.width * 0.7,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    width: 25,
                    margin: const EdgeInsets.only(right: 9),
                    decoration: BoxDecoration(
                      color: get_color(index),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                }),
          ),
          const SizedBox(
            // margin: const EdgeInsets.all(10),
            width: 60,
            child: Center(
              child: Text("Streaks 🔥 140 days",
                  style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late Future<List> cats;

  @override
  void initState() {
    cats = fetchCats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 200,
      child: FutureBuilder<List>(
        future: cats,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.all(9.0),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: snapshot.data?[index] != null
                            ? NetworkImage(snapshot.data?[index]['url'])
                            : const NetworkImage(
                                "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80")),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       offset: Offset(6, 6),
                    //       blurRadius: 5,
                    //       color: Color.fromARGB(255, 41, 41, 40))
                    // ]
                  ),
                );
              }),
              options: CarouselOptions(
                height: 600,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return _shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
