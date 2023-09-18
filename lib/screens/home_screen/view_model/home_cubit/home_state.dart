abstract class HomeState {}

class HomeInitial extends HomeState {}
class LogoutSuccessState extends HomeState{}
class LogoutErrorState extends HomeState{}
class LogoutLoadingState extends HomeState{}


class SetCurrentIndexState extends HomeState{}