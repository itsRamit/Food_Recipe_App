import 'package:flutter/material.dart';
import 'package:food_recipe/clickbutton.dart';
import 'package:food_recipe/foodCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> ButtonText = ['Recommend', 'Breakfast', "Lunch", 'Dinner'];
var idx = 0;

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  var _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> Buttons = List.generate(ButtonText.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              idx = index;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: idx == index ? Colors.orange : Colors.white,
            foregroundColor: idx == index ? Colors.white : Colors.grey,
          ),
          child: Text(ButtonText[index]),
        ),
      );
    });

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
            selectedItemColor: Color(0xffffa500),
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
                              color: Color(0xffffa500),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('assets/images/Thinking.png'),
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
                        child: Wrap(
                          children: Buttons,
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
                      name_1: 'Fried egg tortilla.',
                      name_2: 'Penne pasta in tomato sauce.',
                      cal_1: 473,
                      time1_1: '9 min',
                      time2_1: 9 * 60,
                      image1_1: 'assets/images/tortilla egg.png',
                      image2_1: 'assets/images/tortilla egg.jpg',
                      Ingredients_1:
                          '► 2 teaspoons butter\n► 1 large egg\n► 1/4 teaspoon taco seasoning, or to taste\n► 1 1/2 ounces shredded Cheddar cheese, divided\n► 1 (6 to 7-inch) flour tortilla',
                      Recipe_1:
                          'In a 10-inch nonstick skillet, melt butter over medium heat, and swirl the pan to coat the bottom evenly.\nCarefully break egg into buttered skillet and cook until egg white is opaque and egg is firm enough to turn, about 1 minute.\nTurn egg over, being careful not to break yolk; sprinkle with taco seasoning and about half of cheese.\mGently place tortilla over egg and cheese, and cook about 1 minute. Using a silicone egg turner, flip the egg and tortilla, as one.\nSprinkle remaining cheese on top of the egg, and continue cooking until the egg is done to your liking and the tortilla is warm and toasty, about 2 minutes.\nSlide tortilla and egg to a serving plate and serve warm.',
                      cal_2: 473,
                      time1_2: '20 min',
                      time2_2: 20 * 60,
                      image1_2:
                          'assets/images/penne-pasta-tomato-sauce-with-chicken-tomatoes-removebg.png',
                      image2_2:
                          'assets/images/penne-pasta-tomato-sauce-with-chicken-tomatoes.jpg',
                      Ingredients_2:
                          '► 2 tablespoons olive oil\n►1 small onion, diced\n►2 cloves garlic, minced\n►1 teaspoon dried oregano\n►1/4 teaspoon red pepper flakes\n►1 (14.5 ounce) can diced tomatoes\n►1 (14.5 ounce) can tomato sauce\n►Salt and pepper, to taste\n►1/2 pound penne pasta\n►1/4 cup grated Parmesan cheese\n',
                      Recipe_2:
                          'Heat oil in a large skillet over medium heat.\n2. Add onion and chicken and cook until chicken is cooked through, about 5 minutes.\n3. Add garlic, oregano, and red pepper flakes and cook for 1 minute.\n4. Add diced tomatoes and tomato sauce and bring to a simmer.\n5. Season with salt and pepper, to taste.\n6. Reduce heat to low and simmer for 10 minutes.\n7. Meanwhile, bring a pot of salted water to a boil.\n8. Add penne pasta and cook for 8-10 minutes, or according to package instructions.\n9. Drain pasta and add to skillet with tomato sauce.\n10. Stir to combine and simmer for 2-3 minutes.\n11. Serve with Parmesan cheese.\n',
                    ),
                    foodCardRow(
                      name_1: 'Chiken Biryani',
                      name_2: 'Penne pasta in tomato sauce.',
                      cal_1: 550,
                      time1_1: '45 min',
                      time2_1: 45 * 60,
                      image1_1: 'assets/images/Chicken-Biryani.png',
                      image2_1: 'assets/images/chicken-biryani-bg.png',
                      Ingredients_1:
                          'Brown Onions (Note 1)\n►2 Onions Large\n►½ cup Vegetable Oil\nChicken Marinade:\n►700 grams Chicken Thighs and Drumsticks bone-in and skinless (Note 2)\n►¾ cup Yogurt or hung curd\n►¼ cup Tomato Puree\n►¼ cup Vegetable Oil\n►1 tablespoon Ginger Garlic Paste minced ginger and garlic\n►1 tablespoon Red Chilli Powder sub with 1 teaspoon Paprika + 1 teaspoon Cayenne\n►1 teaspoon Turmeric Powder\n►1 teaspoon Garam Masala Powder\n►2 tablespoon Brown Onions\n►1 ¼ teaspoon Salt\nSaffron:\n►2 tablespoon Hot Milk\n►10-15 Saffron strands\nParboiled Rice (70% cooked):\n►2 cups Basmati Rice Note 3\n►6 cups Water\n►2 tablespoon Salt\n►1 Bayleaf\n►5-6 Cloves\n►2-3 Cardamom Pods\nOther Biryani Ingredients:\n►1 cup Mint Leaves fresh\n►1 cup Coriander Leaves Cilantro\n►1 ½ tablespoons Ghee or Butter\nTo Serve:\n►Crispy Brown Onions\n►Onion Raita',
                      Recipe_1:
                          '1 To make the brown onions, pat the onions dry and if time permits, leave them out on a kitchen towel for 15-20 minutes to dry them out slightly. Heat oil in a pan and add the onions. On a medium flame, shallow fry the onions for 15 minutes till they are a deep golden brown, without burning them. Drain them out on a paper towel, and set aside. These can be made ahead and stored in an air tight container overnight. Burnt onions will add a bitter flavor to the biryani. You can also use store bought fried onions/ shallots which are easily available in leading supermarkets, Indian and Asian stores.\n2 Mix together all the ingredients under chicken marinade and marinate for at least two hours or overnight for best results.\n3 When you are ready to make the biryani, soak saffron strands in hot milk and rub them slightly with the back of a spoon. Set this aside.\n4 Bring water to a roaring boil and add salt, whole spices and basmati rice. Cook for exactly 5 minutes and drain completely, leaving the whole spices in the rice. This will cook the rice to about 70% doneness which can be checked by pressing a grain of rice between two fingers - the rice should still be raw in the middle.\n5 Layering and Cooking Chicken Biryani: \nHeat a heavy bottomed pot like a dutch oven, and add the chicken to it. Cook for 4 minutes and then turn the chicken pieces once. Cover and cook for another 3 minutes. Turn off the heat. Scatter half the onions all over the chicken, and then sprinkle all the coriander and mint leaves. Next layer the rice all over the mint and coriander, and in the end drizzle saffron milk and ghee all over the rice. Cover and cook on a low flame for 20 minutes - this will help steam the rice, cook it to doneness and cook the chicken. (Note 4)\n6 Once the biryani is cooked, let it rest for 5-10 minutes, and finish by scattering the remaining onions on top. Serve hot digging the spoon deep to get all the layers.',
                      cal_2: 473,
                      time1_2: '20 min',
                      time2_2: 20 * 60,
                      image1_2:
                          'assets/images/penne-pasta-tomato-sauce-with-chicken-tomatoes-removebg.png',
                      image2_2:
                          'assets/images/penne-pasta-tomato-sauce-with-chicken-tomatoes.jpg',
                      Ingredients_2:
                          '► 2 tablespoons olive oil\n►1 small onion, diced\n►2 cloves garlic, minced\n►1 teaspoon dried oregano\n►1/4 teaspoon red pepper flakes\n►1 (14.5 ounce) can diced tomatoes\n►1 (14.5 ounce) can tomato sauce\n►Salt and pepper, to taste\n►1/2 pound penne pasta\n►1/4 cup grated Parmesan cheese\n',
                      Recipe_2:
                          'Heat oil in a large skillet over medium heat.\n2. Add onion and chicken and cook until chicken is cooked through, about 5 minutes.\n3. Add garlic, oregano, and red pepper flakes and cook for 1 minute.\n4. Add diced tomatoes and tomato sauce and bring to a simmer.\n5. Season with salt and pepper, to taste.\n6. Reduce heat to low and simmer for 10 minutes.\n7. Meanwhile, bring a pot of salted water to a boil.\n8. Add penne pasta and cook for 8-10 minutes, or according to package instructions.\n9. Drain pasta and add to skillet with tomato sauce.\n10. Stir to combine and simmer for 2-3 minutes.\n11. Serve with Parmesan cheese.\n',
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
