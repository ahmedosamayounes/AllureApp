import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String uId;

  const UserEntity({required this.email, required this.uId});

  @override
  List<Object?> get props => [email, uId];
}
