import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covid19app/model_data/case_indonesia.dart';
import 'package:covid19app/repository/network_repository.dart';
import './bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final _repository = NetworkRepository();

  @override
  DataState get initialState => InitialDataState();

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if(event is LoadData){
      List<CaseIndonesia> data = await _repository.fetchData();
      yield DataLoaded(data);
    }
  }
}
