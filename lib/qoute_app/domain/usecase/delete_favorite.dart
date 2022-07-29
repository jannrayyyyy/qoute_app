// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:qoute/qoute_app/domain/repository/qoute_repository.dart';

class DeleteFavorite {
  final QouteRepository repo;
  DeleteFavorite({required this.repo});
  Future<void> call(String qoute) async {
    await repo.deleteFavorite(qoute);
  }
}
