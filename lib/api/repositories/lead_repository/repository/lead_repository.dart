import 'dart:async';

import '../../../models/api_base_resource/api_base_resource.dart';
import '../../base_repository.dart';

class LeadRepository extends BaseRepository {
  final _leadApiStreamController = StreamController<ApiBaseResource>();

  Stream<ApiBaseResource> get leadApiStream async* {
    yield* _leadApiStreamController.stream;
  }

  Future<void> fetchLeads({required int page, int perPage = 50}) async {
    _leadApiStreamController.add(ApiBaseResource.loading());

    try {
      await apiClient
          .getLeadsAPI(
            page: page,
            perPage: perPage,
            sortBy: 'lead_source_id',
            sortDirection: 'desc',
          )
          .then((response) {
            baseResponse(response, _leadApiStreamController);
          })
          .catchError((onError) {
            baseErrorResponse(onError, _leadApiStreamController);
          });
    } catch (e) {
      _leadApiStreamController.add(ApiBaseResource.somethingWentWrong());
    }
  }
}
