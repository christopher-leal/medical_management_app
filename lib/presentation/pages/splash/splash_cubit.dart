import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/domain/repositories/auth_firebase_repository.dart';

enum SplashState { none, logged_in }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authRepository) : super(SplashState.none);
  final AuthRepository _authRepository;
  Future<void> init() async {
    // TODO: add service
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(SplashState.logged_in);
  }
}
