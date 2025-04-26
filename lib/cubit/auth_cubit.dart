import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { initial, logged, signedOut }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial);

  /// - Podrías chequear en FirebaseAuth.currentUser
  Future<void> checkAuthStatus() async {
    // TODO: implementar lógica de verificación
    // if (usuario autenticado) emit(AuthState.logged);
    // else emit(AuthState.signedOut);
    emit(AuthState.logged);
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthState.initial);
    try {
      // TODO: usar FirebaseAuth.instance.signInWithEmailAndPassword(...)
      emit(AuthState.logged);
    } catch (e) {
      emit(AuthState.signedOut);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthState.initial);
    try {
      // TODO: usar FirebaseAuth.instance.createUserWithEmailAndPassword(...)
      emit(AuthState.logged);
    } catch (e) {
      emit(AuthState.signedOut);
    }
  }

  Future<void> signOut() async {
    try {
      // TODO: usar FirebaseAuth.instance.signOut()
      emit(AuthState.signedOut);
    } catch (e) {
      emit(AuthState.initial);
    }
  }
}
