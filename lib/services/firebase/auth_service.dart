import 'package:fast_feet/services/firebase/auth_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  errorHandler(error) {
    switch (error.code) {
      case "user-not-found":
        return "Usuário não cadastrado!";
      case "wrong-password":
        return "Senha inválida!";
      case "invalid-email":
        return "Email inválido!";
      default:
        return "Erro inesperado, tente novamente!";
    }
  }

  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return AuthResponse.fromMap(
          responseSuccess: true, responseMessage: response.user!.uid);
    } catch (e) {
      return AuthResponse.fromMap(
          responseSuccess: false, responseMessage: errorHandler(e));
    }
  }

  Future<AuthResponse> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return AuthResponse.fromMap(
          responseSuccess: true, responseMessage: "Email enviado!");
    } catch (e) {
      return AuthResponse.fromMap(
          responseSuccess: false, responseMessage: errorHandler(e));
    }
  }

  Future<void> updateInfos({required String name}) async {
    await currentUser!.updateDisplayName(name);
  }

  Future<AuthResponse> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthResponse.fromMap(
          responseSuccess: true,
          responseMessage: "Você foi cadastrado com sucesso!");
    } catch (e) {
      return AuthResponse.fromMap(
          responseSuccess: false, responseMessage: errorHandler(e));
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
