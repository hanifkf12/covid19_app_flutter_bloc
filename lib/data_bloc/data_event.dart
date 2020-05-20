import 'package:covid19app/model_data/case_indonesia.dart';
import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class LoadData extends DataEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
    return "Load Data";
  }

}


