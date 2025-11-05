
import 'package:dartz/dartz.dart';
import 'package:it_matrimony/core/errors/failure.dart';
import 'package:it_matrimony/features/profile/data/datasource/profile_service.dart';
import 'package:it_matrimony/features/profile/data/repositories/profile_repositories.dart';
import 'package:it_matrimony/features/profile/domain/entity/mobile_entity.dart';

class ProfileRepoImpl extends ProfileRepository{

  final ProfileService profileservice;

  ProfileRepoImpl({required this.profileservice});

  @override
  Future<Either<Failure, MobileEntity>> getResponse(endpoint) {
    throw UnimplementedError();
  }
}