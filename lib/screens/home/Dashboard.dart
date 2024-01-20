
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/MyLanguages.dart';
import 'MenuContent.dart';
import 'Questionnaire/QuestionnaireTypes.dart';
import 'Questionnaire/ResendQuestionnaire.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with TickerProviderStateMixin, RouteAware {
  List<_CustomTab> tabList = [];
  late TabController _tabController;
  int selectedIndex = 0;
  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    setTabs();
    _tabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    super.initState();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: MyLanguageKeys.pressAgainToExit.toString().tr);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("استبيان"),
        ),
         backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SafeArea(
              child: Column(children: [
            // Expanded(
            //   child: TabBarView(
            //       physics: NeverScrollableScrollPhysics(),
            //       controller: _tabController,
            //       children: tabList.map((tab) => tab.widget).toList()),
            // ),
            // Container(
            //   height: MySizes.tabBarHeight,
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).primaryColor,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Theme.of(context)
            //             .colorScheme
            //             .onSecondary
            //             .withOpacity(0.1),
            //         spreadRadius: 2,
            //         blurRadius: 1,
            //         offset: Offset(0, 1), // changes position of shadow
            //       ),
            //     ],
            //   ),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Center(
            //       child: TabBar(
            //         controller: _tabController,
            //         indicatorColor: Colors.transparent,
            //         isScrollable: false,
            //         onTap: (index) {
            //           setState(() {
            //             selectedIndex = index;
            //           });
            //         },
            //         tabs: tabList
            //             .map(
            //               (tab) => Tab(
            //                 icon: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     tab.icon,
            //                     Text(tab.name).marginAll(5),
            //                   ],
            //                 ).marginSymmetric(vertical: 0, horizontal: 0),
            //               ),
            //             )
            //             .toList(),
            //       ),
            //     ),
            //   ),
            // ),
          ])),
        ),
    );
  }

  setTabs() {
    tabList.insert(
        0,
        _CustomTab(
          widget: QuestionnaireTypes(),
          name: MyLanguageKeys.add.toString().tr,
          icon: FaIcon(FontAwesomeIcons.plus),
        ));

    tabList.insert(
        1,
        _CustomTab(
          widget: ResendQuestionnaire(),
          name: MyLanguageKeys.sync.toString().tr,
          icon: FaIcon(FontAwesomeIcons.sync),
        ));

    tabList.insert(
        2,
        _CustomTab(
          widget: MenuContent(),
          name: MyLanguageKeys.more.toString().tr,
          icon: FaIcon(FontAwesomeIcons.ellipsisH),
        ));
  }
}

class _CustomTab {
  final Widget widget;
  final String name;
  final Widget icon;

  _CustomTab({
    required this.widget,
    required this.name,
    required this.icon,
  });
}
