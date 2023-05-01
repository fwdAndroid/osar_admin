import 'package:flutter/material.dart';
import 'package:osar_admin/sidebardashboard/deliverypersonrecords.dart';
import 'package:osar_admin/sidebardashboard/ownerrecords.dart';
import 'package:osar_admin/sidebardashboard/payment_records.dart';
import 'package:osar_admin/sidebardashboard/userrecords.dart';
import 'package:sidebarx/sidebarx.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Color(0xffFFBF00),
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 230,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 140,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Admin Panel",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              //  Image.asset(
              //   "assets/logo.png",
              //   height: 200,
              // ),
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.person,
          label: 'User Records',
        ),
        SidebarXItem(
          icon: Icons.store,
          label: 'Owner Records',
        ),
        SidebarXItem(
          icon: Icons.delivery_dining,
          label: 'Delivery Person Records',
        ),
        SidebarXItem(
          icon: Icons.payment,
          label: 'Payment Records',
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return UserRecords();
          case 1:
            return OwnerRecords();
          case 2:
            return DeliveryPersonRecords();
          case 3:
            return PaymentRecords();

          case 4:
            return AlertDialog(
              title: const Text('Sign Out Alert'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Are you sure to logout from Admin Panel'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Color(0xffeb4474)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: Color(0xffeb4474)),
                  ),
                  onPressed: () {},
                ),
              ],
            );

          default:
            return Text(
              'Not found page',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

const canvasColor = Color(0xff2294ed);
const scaffoldBackgroundColor = Color(0xffFFBF00);
const accentCanvasColor = Color(0xff2294ed);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: Colors.black.withOpacity(0.3), height: 1);
