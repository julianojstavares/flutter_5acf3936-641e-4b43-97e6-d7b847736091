// @lazySingleton
// class ReadOnePeriodBloc extends Bloc<ReadOnePeriodEvent, ReadOnePeriodState> {
//   final ReadOnePeriodUseCase _readOnePeriodUseCase;

//   ReadOnePeriodBloc({required ReadOnePeriodUseCase readOnePeriodUseCase})
//       : _readOnePeriodUseCase = readOnePeriodUseCase,
//         super(ReadOnePeriodLoading()) {
//     on<OnePeriodReaded>(_onOnePeriodReaded);
//   }

//   void _onOnePeriodReaded(
//     OnePeriodReaded event,
//     Emitter<ReadOnePeriodState> emit,
//   ) async {
//     final List<PeriodEntity> periods;

//     try {
//       periods = await _readOnePeriodUseCase.call(userID: event.userID);
//     } catch (e) {
//       emit(ReadOnePeriodError(message: "$e"));
//       return;
//     }

//     emit(ReadOnePeriodSuccess(periods: periods));
//   }
// }
