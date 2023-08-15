import 'package:get/get.dart';
import '../data/api_connector.dart';
import 'main_controller.dart';

class BinderData implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<ApiConnectorController>(ApiConnectorController(), permanent: true);
  }
}
