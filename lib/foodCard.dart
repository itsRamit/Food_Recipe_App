import 'package:flutter/material.dart';
import 'package:food_recipe/CookScreen.dart';

class foodCard extends StatefulWidget {
  String image1;
  String name;
  String time1;
  int time2;
  String Image2;
  String DishName;
  int Cal;
  String Ingredients;
  String Recipe;
  foodCard({
    required this.time1,
    required this.DishName,
    required this.Cal,
    required this.Ingredients,
    required this.Recipe,
    required this.Image2,
    required this.name,
    required this.image1,
    required this.time2,
  });
  @override
  State<StatefulWidget> createState() {
    return _foodCardState(
        name: name,
        image1: image1,
        time1: time1,
        time2: time2,
        DishName: DishName,
        Ingredients: Ingredients,
        Recipe: Recipe,
        Cal: Cal,
        Image2: Image2);
  }
}

class _foodCardState extends State<foodCard> {
  String image1;
  String name;
  String time1;
  int time2;
  String Image2;
  String DishName;
  int Cal;
  String Ingredients;
  String Recipe;
  _foodCardState({
    required this.name,
    required this.image1,
    required this.time1,
    required this.Image2,
    required this.DishName,
    required this.time2,
    required this.Cal,
    required this.Ingredients,
    required this.Recipe,
  });
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      shadowColor: Colors.grey,
      child: Container(
          width: w / 2.5,
          height: h / 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: w / 2.5,
                    height: h / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image1),
                        fit: BoxFit.scaleDown,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Text(
                    name.length <= 18 ? name : name.substring(0, 18) + '...',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '$Cal cal',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 3),
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CookScreen(
                                            time: time2,
                                            Image: Image2,
                                            DishName: DishName,
                                            Cal: Cal,
                                            Ingredients: Ingredients,
                                            Recipe: Recipe,
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              child: Text(
                                'Cook',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Icon(
                        Icons.timer,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Text(
                        time1,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class foodCardRow extends StatefulWidget {
  String image1_1;
  String image2_1;
  String name_1;
  int cal_1;
  String time1_1;
  int time2_1;
  String Ingredients_1;
  String Recipe_1;
  String image1_2;
  String image2_2;
  String name_2;
  int cal_2;
  String time1_2;
  int time2_2;
  String Ingredients_2;
  String Recipe_2;

  foodCardRow({
    required this.name_1,
    required this.image1_1,
    required this.image2_1,
    required this.time1_1,
    required this.time2_1,
    required this.cal_1,
    required this.Ingredients_1,
    required this.Recipe_1,
    required this.name_2,
    required this.image1_2,
    required this.image2_2,
    required this.time1_2,
    required this.time2_2,
    required this.cal_2,
    required this.Ingredients_2,
    required this.Recipe_2,
  });
  @override
  State<StatefulWidget> createState() {
    return _foodCardRowState(
      name_1: name_1,
      name_2: name_2,
      image1_1: image1_1,
      image2_1: image2_1,
      image1_2: image1_2,
      image2_2: image2_2,
      time1_1: time1_1,
      time2_1: time2_1,
      time1_2: time1_2,
      time2_2: time2_2,
      cal_1: cal_1,
      cal_2: cal_2,
      Ingredients_1: Ingredients_1,
      Ingredients_2: Ingredients_2,
      Recipe_1: Recipe_1,
      Recipe_2: Recipe_2,
    );
  }
}

class _foodCardRowState extends State<foodCardRow> {
  String image1_1;
  String image2_1;
  String name_1;
  int cal_1;
  String time1_1;
  int time2_1;
  String Ingredients_1;
  String Recipe_1;
  String image1_2;
  String image2_2;
  String name_2;
  int cal_2;
  String time1_2;
  int time2_2;
  String Ingredients_2;
  String Recipe_2;

  _foodCardRowState({
    required this.name_1,
    required this.image1_1,
    required this.image2_1,
    required this.time1_1,
    required this.time2_1,
    required this.cal_1,
    required this.Ingredients_1,
    required this.Recipe_1,
    required this.name_2,
    required this.image1_2,
    required this.image2_2,
    required this.time1_2,
    required this.time2_2,
    required this.cal_2,
    required this.Ingredients_2,
    required this.Recipe_2,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foodCard(
            Cal: cal_1,
            image1: image1_1,
            Image2: image2_1,
            time1: time1_1,
            time2: time2_1,
            Ingredients: Ingredients_1,
            Recipe: Recipe_1,
            DishName: name_1,
            name: name_1,
          ),
          SizedBox(
            width: 10,
          ),
          foodCard(
            Cal: cal_2,
            image1: image1_2,
            Image2: image2_2,
            time1: time1_2,
            time2: time2_2,
            Ingredients: Ingredients_2,
            Recipe: Recipe_2,
            DishName: name_2,
            name: name_2,
          ),
        ],
      ),
    );
  }
}
