import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_connect_app/modules/cart/cart_page.dart';
import 'package:pharma_connect_app/modules/home/home_page.dart';
import 'package:pharma_connect_app/modules/my_order/order_page.dart';
import 'package:pharma_connect_app/modules/profile/profile_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    HomePage(),
    OrderPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              'assets/icons/home_active.svg',
              colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/order.svg'),
            label: 'Orders',
            activeIcon: SvgPicture.asset(
              'assets/icons/order.svg',
              colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/cart.svg'),
            label: 'Cart',
            activeIcon: SvgPicture.asset(
              'assets/icons/cart.svg',
              colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              'assets/icons/profile.svg',
              colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
