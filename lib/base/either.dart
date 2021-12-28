import 'package:either_dart/either.dart';

Future<Either<Exception, T>> attempt<T>(Future<T> Function() func) async {
  try {
    return Right(await func());
  } on Exception catch (e) {
    return Left(e);
  }
}
