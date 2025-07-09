import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:clean_arch_app/core/utilities/shared_prefrences_helper.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_app/features/auth/domain/useCases/login_use_cases.dart';
import 'package:clean_arch_app/features/auth/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginProvider({required this.loginUseCase});

  bool _isLoading = false;
  String? _errorMessage;
  UserEntity? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserEntity? get user => _user;

  Future<void> login(String email, String password, BuildContext context) async {
    _setLoading(true);
    _clearError();

    showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator()));
    final result = await loginUseCase.call(email, password);
    
    result.fold(
      (failure) {
        Navigator.pop(context);
        _setLoading(false);
        _setError(failure.message);
        _showErrorDialog(context, failure.message);
      }, 
      (user) {
        Navigator.pop(context);
        _setLoading(false);
        print("hamza is ${user}");
        _setUser(user);
        SharedPrefrenceHelper.setDataModel(key: SharedKeys.userData, value: user);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        print('Login successful: ${user.firstName}');
      }
    );
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setUser(UserEntity user) {
    _user = user;
    notifyListeners();
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}