import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mozart_flutter_app/features/admin/sql_connection/data/data_provider/remote/dio_helper.dart';
import 'package:mozart_flutter_app/features/admin/sql_connection/utils/constants/constants.dart';

part 'sql_state.dart';

class SqlCubit extends Cubit<SqlState> {
  SqlCubit() : super(SqlInitialState());

  static SqlCubit get(context) => BlocProvider.of(context);

  SqlDioHelper sqlDioHelper = SqlDioHelper();

  /// Sql Function
  Future<void> sqlFunction({
    String? user,
    String? password,
    String? server,
    String? database,
    required String syncMethod,
    required String syncTime,
    required bool wantSync,
  }) async {
    emit(SqlLoadingState());
    try {
      final dio = Dio();
      final response = await dio.post(
        'http://localhost:8000/api/v1/configureAndSync/configure-sync',
        data: {
          "user": user ?? "sa",
          "password": password ?? "sql2001",
          "server": server ?? "DESKTOP-NDRHRIF",
          "database": database ?? "OnlineStore",
          "syncMethod": syncMethod,
          "syncTime": syncTime,
          "wantSync": true,

        },
      );
      if (response.statusCode == 200) {
        print(response.data);
      }else{
        print('A network error occurred');
      }
      print(response.data);
      emit(SqlSuccessState());
    } catch (error) {
      print(error);
      emit(SqlErrorState());
    }
  }
  Future<void> saveDataToServer() async {
    try {
      final dio = Dio();
      final response = await dio.post(
        'http://localhost:8000/api/v1/configureAndSync/configure-sync',
        data: {
          "user": "sa",
          "password": "sql2001",
          "server": "DESKTOP-NDRHRIF",
          "database": "OnlineStore",
          "syncMethod": "now",
          "syncTime": "7:41 PM",
          "wantSync": true,
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print('A network error occurred');
      }

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (error) {
      print('Error sending data: $error');
    }
  }



}
