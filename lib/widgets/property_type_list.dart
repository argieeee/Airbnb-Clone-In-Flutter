import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PropertyTypeList extends StatefulWidget {
  const PropertyTypeList({Key? key}) : super(key: key);

  @override
  State<PropertyTypeList> createState() => _PropertyTypeListState();
}

class _PropertyTypeListState extends State<PropertyTypeList> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> propertyTypes = [
    {'type': 'Surfing', 'icon': Icons.surfing},
    {'type': 'Fishing', 'icon': Icons.south_east},
    {'type': 'ScubaDiving', 'icon': Icons.scuba_diving},
    {'type': 'BeachVolleyball', 'icon': Icons.sports_volleyball},
    {'type': 'ZipLining', 'icon': Icons.line_axis},
    {'type': 'Bonfires', 'icon': Icons.local_fire_department},
    {'type': 'Entertainment', 'icon': Icons.nightlight},
    {'type': 'SpaTreatments', 'icon': Icons.spa},
    {'type': 'BeachYoga', 'icon': Icons.fitness_center},
    {'type': 'JetSkiing', 'icon': Icons.directions_boat},
    {'type': 'WildlifeWatching', 'icon': Icons.filter_sharp},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(propertyTypes.length, (index) {
          return Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0, top: 4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(propertyTypes[index]['icon']),
                  const SizedBox(height: 2.0),
                  Text(
                    propertyTypes[index]['type'],
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: index == selectedIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  if (index == selectedIndex)
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      height: 2.0,
                      width: 64.0,
                      color: Colors.black,
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 300))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}