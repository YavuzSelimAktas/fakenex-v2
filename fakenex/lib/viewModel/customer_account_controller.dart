import 'package:get/get.dart';
import 'package:fakenex/core/services/api_service.dart';
import 'package:fakenex/model/user_model.dart';

class CustomerAccountController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = true.obs;
  var userList = <User>[].obs;
  var errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
  void fetchUsers() async {
    try {
      isLoading(true);
      errorMessage('');
      final String userJson = await _apiService.getUsers();
      final List<User> users = userFromJson(userJson);
      userList.assignAll(users);

    } catch (e) {
      errorMessage('Veri yüklenemedi: $e');
    } finally {
      isLoading(false);
    }
  }
}