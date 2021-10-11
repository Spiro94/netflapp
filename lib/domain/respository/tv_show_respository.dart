import 'package:dartz/dartz.dart';

import '../../core/failures/failure.dart';
import '../../data/models/tv_show_model.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShowModel>>> getPopular();
  Future<Either<Failure, List<TvShowModel>>> getRecommended();
  Future<Either<Failure, List<TvShowModel>>> getFavorites();
  Future<bool> addFavorite(TvShowModel model, {bool delete = false});
}
