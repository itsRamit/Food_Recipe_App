import 'package:flutter/material.dart';
import 'package:food_recipe/clickbutton.dart';
import 'package:food_recipe/foodCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  var _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            selectedLabelStyle:
                TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
            backgroundColor: Colors.white,
            currentIndex: _currentindex,
            selectedItemColor: Colors.orange,
            onTap: (index) {
              setState(() {
                _currentindex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.book_rounded,
                  ),
                  label: 'Recipes'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile')
            ]),
        body: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: CustomScrollView(slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: h / 6,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: FlexibleSpaceBar(
                    background: Container(
                        width: w,
                        height: h / 12,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0, left: 0.0),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  onPressed: () {},
                                )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text(
                                'Good Morning \u{1F505}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 30.0,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notifications_none,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                )),
                          ],
                        )),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(4.0),
                  child: Container(
                    width: w,
                    height: h / 14,
                    //color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextField(
                          cursorColor: Colors.grey,
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.orange,
                                )),
                            hoverColor: Colors.orange,
                            hintText: 'Search by food name',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black38,
                            ),
                            fillColor: Colors.black38,
                          ),
                        )),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 20),
                          child: Container(
                            width: w,
                            height: h / 5,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: h / 6,
                          left: w / 17,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 280),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      'Watch',
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  ],
                                )),
                          ),
                        )
                        //Text('Fin')
                      ],
                    ),
                    SizedBox(
                      height: h / 38,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            button(
                                name: 'Recommend',
                                Icon: Icons.recommend_outlined),
                            button(
                                name: 'Noodles',
                                Icon: Icons.recommend_outlined),
                            button(
                                name: 'Recommend',
                                Icon: Icons.recommend_outlined),
                            button(
                                name: 'Noodles',
                                Icon: Icons.recommend_outlined),
                            button(
                                name: 'Recommend',
                                Icon: Icons.recommend_outlined),
                            button(
                                name: 'Noodles',
                                Icon: Icons.recommend_outlined),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: w / 14,
                          ),
                          Text(
                            'Recommended',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    foodCardRow(
                      name_1: 'Fried egg tortilla',
                      name_2: 'Fried egg tortilla',
                      cal_1: 473,
                      time1_1: '9 min',
                      time2_1: 9 * 60,
                      image1_1: 'assets/images/tortilla egg.png',
                      image2_1: 'assets/images/dish.png',
                      Ingredients_1:
                          '► 2 teaspoons butter\n► 1 large egg\n► 1/4 teaspoon taco seasoning, or to taste\n► 1 1/2 ounces shredded Cheddar cheese, divided\n► 1 (6 to 7-inch) flour tortilla',
                      Recipe_1:
                          'In a 10-inch nonstick skillet, melt butter over medium heat, and swirl the pan to coat the bottom evenly.\nCarefully break egg into buttered skillet and cook until egg white is opaque and egg is firm enough to turn, about 1 minute.\nTurn egg over, being careful not to break yolk; sprinkle with taco seasoning and about half of cheese.\mGently place tortilla over egg and cheese, and cook about 1 minute. Using a silicone egg turner, flip the egg and tortilla, as one.\nSprinkle remaining cheese on top of the egg, and continue cooking until the egg is done to your liking and the tortilla is warm and toasty, about 2 minutes.\nSlide tortilla and egg to a serving plate and serve warm.',
                      cal_2: 473,
                      time1_2: '9 min',
                      time2_2: 9 * 60,
                      image1_2: 'assets/images/tortilla egg.png',
                      image2_2: 'assets/images/dish.png',
                      Ingredients_2:
                          '► 2 teaspoons butter\n1 large egg\n► 1/4 teaspoon taco seasoning, or to taste\n► 1 1/2 ounces shredded Cheddar cheese, divided\n► 1 (6 to 7-inch) flour tortilla',
                      Recipe_2:
                          'In a 10-inch nonstick skillet, melt butter over medium heat, and swirl the pan to coat the bottom evenly.\nCarefully break egg into buttered skillet and cook until egg white is opaque and egg is firm enough to turn, about 1 minute.\nTurn egg over, being careful not to break yolk; sprinkle with taco seasoning and about half of cheese.\mGently place tortilla over egg and cheese, and cook about 1 minute. Using a silicone egg turner, flip the egg and tortilla, as one.\nSprinkle remaining cheese on top of the egg, and continue cooking until the egg is done to your liking and the tortilla is warm and toasty, about 2 minutes.\nSlide tortilla and egg to a serving plate and serve warm.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: w / 14,
                          ),
                          Text(
                            'Breakfast',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              )
            ])));
  }
}
