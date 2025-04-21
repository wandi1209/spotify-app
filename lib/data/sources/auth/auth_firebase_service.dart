import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/data/models/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImplementation extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return Right('Sign In was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return Right('Sign Up was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provide is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An Account already exists with that email.';
      }
      return Left(message);
    }
  }
}
