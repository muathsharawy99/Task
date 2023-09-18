abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoadingState extends CreateUserState {}
class CreateUserSuccessState extends CreateUserState {}
class CreateUserErrorState extends CreateUserState {}
