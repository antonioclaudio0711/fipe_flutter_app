import 'package:fipe_app/src/core/utils/common_widgets/customize_app_drawer.dart';
import 'package:flutter/material.dart';

class CustomizeAppScaffold extends StatelessWidget {
  const CustomizeAppScaffold({
    super.key,
    this.appBarTitle,
    this.floatingActionButton,
    required this.scaffoldBody,
    required this.canPop,
    this.appBarActionsWidgetsList,
  });

  final Widget? appBarTitle;
  final FloatingActionButton? floatingActionButton;
  final Widget scaffoldBody;
  final bool canPop;
  final List<Widget>? appBarActionsWidgetsList;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        drawer: const CustomizeAppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: appBarActionsWidgetsList,
        ),
        floatingActionButton: floatingActionButton,
        body: scaffoldBody,
      ),
    );
  }
}
