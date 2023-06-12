import 'package:flutter/material.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/to_do_element.dart';
import 'widgets/sliver_appbar_delegate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Flavor> flavors = [
    Flavor(name: 'Chocolate'),
    Flavor(name: 'Strawberry'),
    Flavor(name: 'Hazelnut'),
    Flavor(name: 'Vanilla'),
    Flavor(name: 'Lemon'),
    Flavor(name: 'Yoghurt'),
        Flavor(name: 'Chocolate'),
    Flavor(name: 'Strawberry'),
    Flavor(name: 'Hazelnut'),
    Flavor(name: 'Vanilla'),
    Flavor(name: 'Lemon'),
    Flavor(name: 'Yoghurt'),
        Flavor(name: 'Chocolate'),
    Flavor(name: 'Strawberry'),
    Flavor(name: 'Hazelnut'),
    Flavor(name: 'Vanilla'),
    Flavor(name: 'Lemon'),
    Flavor(name: 'Yoghurt'),
  ];

  void F1(int index, Flavor flavor) {
    setState(() {
      flavors[index] = flavor.copyWith(isFavorite: !flavor.isFavorite);
    });
  }

  void F2(int index) {
    setState(() {
      flavors.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(),
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: flavors.length,
                      itemBuilder: (context, index) {
                        final flavor = flavors[index];
                        return Visibility(child: ToDoElement(flavor: flavor, index: index, F1: F1, F2: F2));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Flavor {
  final String name;
  final bool isFavorite;

  Flavor({required this.name, this.isFavorite = false});

  Flavor copyWith({String? name, bool? isFavorite}) => Flavor(
      name: name ?? this.name, isFavorite: isFavorite ?? this.isFavorite);
}
