import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color });
  final bool isActive;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isActive ? CircleAvatar(
        backgroundColor: color,
          radius: 36,
          child: CircleAvatar(
              backgroundColor: color,
              radius: 30)
      ) : CircleAvatar(
        backgroundColor:color,
        radius: 30,
      ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int selectedColor = 0;
  List<Color> colors = [
    Color(0xff8cb369),
    Color(0xfff4e285),
    Color(0xfff4a259),
    Color(0xff5b8e7d),
    Color(0xffbc4b51),


  ];

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32 * 2.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: ColorItem(isActive: selectedColor == index, color: colors[index],))),
    );
  }
}