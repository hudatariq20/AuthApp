part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;

  const ProfileLoaded({required this.user});
  @override
  List<Object?> get props => [user];
}

class ProfileUnavailable extends ProfileState {}




