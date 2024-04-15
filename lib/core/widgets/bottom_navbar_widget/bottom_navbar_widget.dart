import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/constants/images_navbar_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/bottom_navbar_widget/bottom_navbar_widget_model/bottom_navbar_widget_model.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/label_text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/buy_sell_screen.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/finance_screen.dart';
import 'package:selpar/screen/home_screen/home_screen.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/online_operation_screen.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/order_screen.dart';
import 'package:selpar/screen/navigation_bar_items/stock_screen/stock_screen.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/vehicle_screen.dart';

class BottomNavbarWidget extends StatelessWidget {
  BottomNavbarWidget({super.key}) {
    reaction((_) async => await _bottomNavbarWidgetModel.initialize(), (_) {});
  }
  final BottomNavbarWidgetModel _bottomNavbarWidgetModel =
      BottomNavbarWidgetModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(child: CircleAvatar()),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    CupertinoIcons.person,
                    color: ColorConstants.taskTextColor,
                  ).getPaddingOnly(context: context, right: 0.02),
                  CustomLabelText(
                    label: 'Hesap',
                    isColorNotWhite: true,
                  )
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    CupertinoIcons.settings,
                    color: ColorConstants.taskTextColor,
                  ).getPaddingOnly(context: context, right: 0.02),
                  CustomLabelText(
                    label: 'Ayarlar',
                    isColorNotWhite: true,
                  )
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        heroTag: 'homeScreen',
        shape: const CircleBorder(),
        backgroundColor: ColorConstants.bottomNavigationBarActiveColor,
        onPressed: () => _bottomNavbarWidgetModel.setIndex(0),
        child:
            const Icon(CupertinoIcons.home, color: ColorConstants.whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(
          title: 'Selpar',
          leading: const SizedBox(),
          centerTitle: true,
          actions: [
            Builder(builder: (context) {
              return CustomIconButton(
                  icon: const Icon(CupertinoIcons.list_bullet,
                      color: ColorConstants.bgColor),
                  onPressed: () => Scaffold.of(context).openEndDrawer());
            })
          ]),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomAppBar(
            padding: EdgeInsets.symmetric(
                horizontal: context.getSizeWidth(size: 0.02)),
            height: context.getSizeHeight(size: 0.07),
            color: ColorConstants.bottomNavigationBarActiveColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomNavbarIcon(
                        context: context,
                        image: ImagesNavBarConstants.imageVehicle,
                        index: 1,
                        onTap: () {
                          _bottomNavbarWidgetModel.setIndex(1);
                        }).getPaddingOnly(context: context, right: 0.08),
                    _bottomNavbarIcon(
                        context: context,
                        image: ImagesNavBarConstants.imageFinance,
                        index: 2,
                        onTap: () {
                          _bottomNavbarWidgetModel.setIndex(2);
                        }).getPaddingOnly(context: context, right: 0.08),
                    _bottomNavbarIcon(
                        context: context,
                        image: ImagesNavBarConstants.imageStock,
                        index: 3,
                        onTap: () {
                          _bottomNavbarWidgetModel.setIndex(3);
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomNavbarIcon(
                        context: context,
                        image: ImagesNavBarConstants.imageTrade,
                        index: 4,
                        onTap: () {
                          _bottomNavbarWidgetModel.setIndex(4);
                        }),
                    _bottomNavbarIcon(
                        context: context,
                        image: ImagesNavBarConstants.imageOnline,
                        index: 5,
                        onTap: () {
                          _bottomNavbarWidgetModel.setIndex(5);
                        }).getPaddingOnly(context: context, left: 0.08),
                    _bottomNavbarIcon(
                        context: context,
                        image: ImagesNavBarConstants.imageOrderTransaction,
                        index: 6,
                        onTap: () {
                          _bottomNavbarWidgetModel.setIndex(6);
                        }).getPaddingOnly(context: context, left: 0.08),
                  ],
                ),
              ],
            ));
      }),
      body: Observer(builder: (context) {
        switch (_bottomNavbarWidgetModel.currentIndex) {
          case 0:
            return const HomeScreen();
          case 1:
            return const VehicleScreen();
          case 2:
            return const FinanceScreen();
          case 3:
            return const StockScreen();
          case 4:
            return const BuySellScreen();
          case 5:
            return const OnlineOperationScreen();
          case 6:
            return const OrderScreen();
          default:
            return Container();
        }
      }).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
    ));
  }

  GestureDetector _bottomNavbarIcon(
      {required BuildContext context,
      required String image,
      required int index,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        scale: 100,
        width: 24,
        height: 24,
        color: _bottomNavbarWidgetModel.currentIndex == index
            ? ColorConstants.whiteColor
            : ColorConstants.bottomNavigationBarInactiveColor,
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    );
  }
}
