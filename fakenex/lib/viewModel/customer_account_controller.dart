import 'package:get/get.dart';
import 'package:fakenex/core/services/api_service.dart';
import 'package:fakenex/model/user_model.dart'; // Bu hala gerekli

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
      
      // 1. ApiService'den doğrudan parse edilmiş listeyi alıyoruz.
      final List<dynamic> userJsonList = await _apiService.getUsers();
      
      // 2. userFromJson'a gerek kalmadan listeyi doğrudan User nesnelerine map'liyoruz.
      // user_model.dart dosyasındaki User.fromJson fabrika metodu burada kullanılıyor.
      final List<User> users = userJsonList.map((json) => User.fromJson(json)).toList();
      
      userList.assignAll(users);

    } catch (e) {
      errorMessage('Veri yüklenemedi: $e');
    } finally {
      isLoading(false);
    }
  }
}