import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/features/home/presentations/views/details_of_lectuer.dart';
import 'package:teachers_marks/features/home/presentations/views/widgets/grid_layout_widget.dart';
import 'package:teachers_marks/features/home/presentations/views/widgets/lectuer_card.dart';

class HomeView extends StatefulWidget {

   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double h =1;
  double w=1 ;


  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _sKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("موادي"),
          elevation: 0,
          // backgroundColor: Colors.transparent,
          backgroundColor: kPrimaryColor,
          shadowColor: const Color(0xff7f7f7f),
          automaticallyImplyLeading: false,

          actions: [
            IconButton(
              padding: EdgeInsets.only(
                  // top: 8.0
                  top: h * 0.005
                  ),
              onPressed: () {
                _sKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.black,
                size:
                // 30,
                w * 0.09,
              ),
            ),
          ],

        ),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  // decoration: BoxDecoration
                  //   (
                  //   color: Colors.red
                  // ),
                     child:Column(
                       children: [
                         Text("ji nour"),
                         Text("nourWanli77@gmail.com"),
                       ],
                     )),
                ListTile(
                  title: Text("موادي"),
                  onTap: () {
                    Get.to( HomeView());
                  },
                ),
                ListTile(
                  title: Text("حسابي"),
                  onTap: () {
                    Get.to( HomeView());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("تسجيل خروج"),
                  onTap: () {
                    Get.to( HomeView());
                  },
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.12,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05)
            ,
            child: Column(
              children: [
                TGridLayout(
                    itemCount: 20,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) => TLectuerCard(
                        showBorder: true,
                        onTap: () {
                          Get.to(const LectuerDetails());
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
