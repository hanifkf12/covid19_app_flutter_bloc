import 'package:covid19app/model_data/case_indonesia.dart';
import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {
  const DataState();
}

class InitialDataState extends DataState {
  @override
  List<Object> get props => [];
}
class DataLoaded extends DataState{
  final List<CaseIndonesia> data;

  DataLoaded(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}