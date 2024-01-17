


import 'package:get/get.dart';
import 'package:mvvmprac/data/response/status.dart';
import 'package:mvvmprac/model/user_list_model/user_list_model.dart';
import 'package:mvvmprac/repository/user_list_repsoitory/user_list_repsoitory.dart';

class HomeViewModel extends GetxController {

  final _api = UserListRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  final RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}