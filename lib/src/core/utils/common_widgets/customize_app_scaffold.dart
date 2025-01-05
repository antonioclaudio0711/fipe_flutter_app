import 'package:fipe_app/src/core/utils/common_widgets/customize_app_drawer.dart';
import 'package:flutter/material.dart';

class CustomizeAppScaffold extends StatelessWidget {
  const CustomizeAppScaffold({
    super.key,
    this.appBarTitle,
    this.floatingActionButton,
    required this.scaffoldBody,
  });

  final Widget? appBarTitle;
  final FloatingActionButton? floatingActionButton;
  final Widget scaffoldBody;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        drawer: const CustomizeAppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        floatingActionButton: floatingActionButton,
        body: scaffoldBody,
      ),
    );
  }
}
