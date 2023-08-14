import 'package:flutter/material.dart';

class button extends StatefulWidget {
  var name;
  late IconData Icon;
  button({
    required this.name,
    required this.Icon,
  });
  @override
  State<StatefulWidget> createState() {
    
    return _buttonState(icon:Icon,name:name );
  }
}

class _buttonState extends State<button> { 
  var name;
  late IconData icon;
  _buttonState({
    required this.name,
    required this.icon,
  });
  Color _color = Colors.white;
  Color _color2 = Colors.grey;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right:12.0),
      child: InkWell(
        onTap: () {
          if (flag == true) {
            _color = Colors.orange;
            _color2 = Colors.white;
            flag = false;
          } else {
            _color = Colors.white;
            _color2 = Colors.grey;
            flag = true;
          }
          setState(() {});
        },
        child: Container(
          width: w/4,
          height: h/22,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(children: [
                    Icon(icon, color: _color2),
                    Text(name, style: TextStyle(color: _color2)),
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
