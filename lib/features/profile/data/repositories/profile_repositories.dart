
import 'package:dartz/dartz.dart';
import 'package:it_matrimony/core/errors/failure.dart';
import 'package:it_matrimony/features/profile/domain/entity/mobile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, MobileEntity>> getResponse(endpoint);
}