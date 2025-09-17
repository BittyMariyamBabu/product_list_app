import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';
import 'package:product_listing_app/feature/home/domain/repositories/home_repository.dart';

/// A use case class responsible for fetching the list of banners.
/// This class abstracts the banner fetching logic from the presentation layer,
/// delegating the actual data retrieval to the [HomeRepository].
class GetBannersUseCase {
  final HomeRepository repository;
  GetBannersUseCase(this.repository);

  /// Fetches a list of [BannerEntity] objects. Delegates the call to the repository.
  Future<List<BannerEntity>> call() async {
    return await repository.getBanners();
  }
}