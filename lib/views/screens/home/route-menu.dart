import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/appTheme.dart';
import '../../../utils/navigation_service.dart';
import '../Profill/profilpage.dart';
import '../seach/seachPage.dart';
import '../setting/settingPage.dart';
import 'home-menu.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomeMenu(),
        SeachPage(),
        ProfilPage(),
        ParametrePage(),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home,
      Icons.search_outlined,
      Icons.person_outlined,
      Icons.settings
    ];
    List itemsName = ['home', 'Chercher', 'Profil', 'parametres'];
    return Container(
      width: width(context),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), //BorderRadius.Only
        color: AppTheme.color.whithColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 208, 172, 226),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: pageIndex == index
                      ? Container(
                          decoration: BoxDecoration(
                            color: AppTheme.color.primaryColor,
                            borderRadius: BorderRadius.circular(10),  
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(items[index],
                                    size: 25, color: AppTheme.color.whithColor),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  itemsName[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.color.whithColor),
                                )
                              ],
                            ),
                          ),
                        )
                      : Icon(
                          items[index],
                          size: 25,
                          color: 
                             AppTheme.color.secondaryColor
                          
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
  