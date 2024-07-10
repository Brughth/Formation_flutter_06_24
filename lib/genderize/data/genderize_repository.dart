import 'package:dio/dio.dart';
import 'package:formation_flutter_join24/genderize/data/genderize_model.dart';

class GenderizeRepository {
  final Dio dio = Dio();

  Future<GenderizeModel> getGenderFromName(String name) async {
    Response response = await dio.get('https://api.genderize.io/?name=$name');

    return GenderizeModel.fromJson(response.data);
  }
}
