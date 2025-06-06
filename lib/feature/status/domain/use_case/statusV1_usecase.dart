import 'package:instastyle/core/resources/data_state.dart';
import 'package:instastyle/core/usecase/use_case.dart';
import 'package:instastyle/feature/status/data/model/status_model.dart';

import '../repository/status_repository.dart';

class StatusV1Usecase implements UseCase<DataState<StatusModel>, void> {
  final StatusRepository statusRepository;
  StatusV1Usecase(this.statusRepository);
  @override
  Future<DataState<StatusModel>> call(void params) {
    return statusRepository.getStatusV1();
  }
}
