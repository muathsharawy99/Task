abstract class CreateDeptState {}

class CreateUserInitial extends CreateDeptState {}


class CreateDeptLoadingState extends CreateDeptState{}
class CreateDeptErrorState extends CreateDeptState{}
class CreateDeptSuccessState extends CreateDeptState{}