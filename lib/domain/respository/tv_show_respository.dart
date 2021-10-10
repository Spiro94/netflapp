import 'package:dartz/dartz.dart';
import 'package:netflapp/core/failures/failure.dart';
import 'package:netflapp/domain/entities/tv_show.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvShow>>> getPopular();
  Future<Either<Failure, List<TvShow>>> getRecommended();
}
