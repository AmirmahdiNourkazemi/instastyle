import 'package:instastyle/core/resources/data_state.dart';
import 'package:instastyle/core/usecase/use_case.dart';
import 'package:instastyle/feature/status/data/model/status_model.dart';
import 'package:instastyle/feature/status/domain/repository/status_repository.dart';

class StatusUsecase implements UseCase<DataState<StatusModel>, void> {
  final StatusRepository statusRepository;
  StatusUsecase(this.statusRepository);
  @override
  Future<DataState<StatusModel>> call(void params) {
    return statusRepository.getStatusV1();
  }
}
