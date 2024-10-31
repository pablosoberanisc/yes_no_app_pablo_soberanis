import 'package:dio/dio.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';

class GetYesNoAnswer {

  //Se crea obejto de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async{

    //Almacenar la peticion GET en una variable
    final response= await _dio.get('https://yesno.wtf/api');

    //Generar un error si algo sale mal 
    throw UnimplementedError();

  }
}