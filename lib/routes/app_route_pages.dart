import 'package:get/get.dart';
import 'package:pharma_connect_app/modules/dashboard/dashboard.dart';
import 'package:pharma_connect_app/routes/app_route.dart';

abstract class AppRoutePages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.dashboard, page: () => Dashboard()),
  ];
}
