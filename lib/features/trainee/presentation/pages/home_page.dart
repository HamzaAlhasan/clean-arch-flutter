import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:clean_arch_app/core/utilities/shared_prefrences_helper.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserEntity? user;

  void getUser() async {
    final user = await SharedPrefrenceHelper.getDataModel(key: SharedKeys.userData);
    print("user: $user");
    setState(() {
      this.user = user;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}