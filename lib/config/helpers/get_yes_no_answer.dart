import 'package:dio/dio.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';
import 'package:yes_no_app_pablo_soberanis/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  // Se crea la instancia (objeto, referencia a) de la clase Dio
  // Para manejar las peticiones de https
  final _dio = Dio();

  // Obtener la respuesta
  Future<Message> getAnswer() async {

  // Almacenar la petición tipo get en una variable
  final response = await _dio.get('https://yesno.wtf/api');
  

  final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    

  // Generar el error
 // throw UnimplementedError(); //error no implementado
  

}
}