import 'package:flutter/material.dart';
import 'package:rentease/utils/constants/colors.dart';
import 'features/shope/screens/addProperty/add_property.dart';
import 'features/shope/screens/home/home.dart';
import 'features/shope/screens/profile/profile.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const HomeScreen(),
      const Center(child: Text('بحث')),
      const AddPropertyScreen(),
      const Center(child: Text('المفضلة')),
      const ProfileScreen(),
    ];
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      [Icons.home_filled, 'الرئيسية'],
      [Icons.search, 'بحث'],
      [Icons.add_circle_outline, 'إضافة'],
      [Icons.favorite_border, 'المفضلة'],
      [Icons.person, 'حسابي'],
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 88,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final selected = _selectedIndex == index;

            return InkWell(
              onTap: () => _onTap(index),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: selected
                      ? TColors.PrimaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      items[index][0] as IconData,
                      color: selected
                          ? Colors.white
                          : const Color(0xff94A3B8),
                      size: 23,
                    ),
                    Text(
                      items[index][1] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 10,
                        color: selected
                            ? Colors.white
                            : const Color(0xff94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}