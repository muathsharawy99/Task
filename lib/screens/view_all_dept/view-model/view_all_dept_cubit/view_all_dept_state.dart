abstract class ViewAllDeptState {}

class ViewAllDeptInitial extends ViewAllDeptState {}
class GetAllDeptLoadingState extends ViewAllDeptState {}
class GetAllDeptSuccessState extends ViewAllDeptState {}
class GetAllDeptErrorState extends ViewAllDeptState {}

class UpdateDeptLoadingState extends ViewAllDeptState {}
class UpdateDeptSuccessState extends ViewAllDeptState {}
class UpdateDeptErrorState extends ViewAllDeptState {}

class DeleteDeptSuccessState extends ViewAllDeptState {}
class DeleteDeptLoadingState extends ViewAllDeptState {}
class DeleteDeptErrorState extends ViewAllDeptState {}
