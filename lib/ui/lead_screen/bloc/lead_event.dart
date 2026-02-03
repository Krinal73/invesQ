part of 'lead_bloc.dart';

abstract class LeadEvent extends Equatable {
  const LeadEvent();
  @override
  List<Object?> get props => [];
}

class FetchLeadsEvent extends LeadEvent {}

class FetchMoreLeadsEvent extends LeadEvent {}

class UpdateSearchQueryEvent extends LeadEvent {
  final String query;
  const UpdateSearchQueryEvent(this.query);
}
