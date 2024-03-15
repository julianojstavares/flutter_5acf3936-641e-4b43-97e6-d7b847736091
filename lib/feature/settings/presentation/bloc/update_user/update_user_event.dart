import '../../../../../core/domain/entities/user_entity.dart';

sealed class UpdateUserEvent {}

final class UserUpdated extends UpdateUserEvent {
  final UserEntity userUpdated;

  UserUpdated({required this.userUpdated});
}
