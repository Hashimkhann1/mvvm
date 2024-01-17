

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmprac/data/app_exception.dart';
import 'package:mvvmprac/data/response/status.dart';
import 'package:mvvmprac/res/routes/routes_name.dart';
import 'package:mvvmprac/utils/utils.dart';
import 'package:mvvmprac/view_model/home_view_model/home_view_model.dart';
import 'package:mvvmprac/view_model/user_preference_view_model/user_preference_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());
  final UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
            userPreference.removeUser().then((value) {
              Get.toNamed(RoutesName.loginView);
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch(homeViewModel.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Text(homeViewModel.error.toString());
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeViewModel.userList.value.data!.length,
                itemBuilder: (context , index) {
                final userData = homeViewModel.userList.value.data![index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userData.avatar.toString()),
                  ),
                  title: Text(userData.firstName.toString()),
                  subtitle: Text(userData.email.toString()),
                ),
              );
            });
        }
      }),
    );
  }
}
