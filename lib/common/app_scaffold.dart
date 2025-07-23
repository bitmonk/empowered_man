import 'package:empowered/core/extension/extensions.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButtonLocation,
    this.endDrawer,
  });
  const AppScaffold.white({
    required this.body,
    super.key,
    this.appBar,
    this.backgroundColor = AppColors.colorWhite,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButtonLocation,
    this.endDrawer,
  });
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? endDrawer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        endDrawer: endDrawer,
        backgroundColor: backgroundColor,
        key: key,
        drawer: drawer,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
