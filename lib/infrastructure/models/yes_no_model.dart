import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';

class YesNoModel {
        YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    final String answer;
    final bool forced;
    final String image;


    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

      Message toMessageEntity() => Message(
        text: answer == 'yes'
            ? 'si'
            : answer == 'no'
                ? 'No'
                : 'Quizas',
        fromWho: FromWho.hers,
        //Sera el gif
        imagenUrl: image, //Esto usara la URL de la imagen
        timestamp: DateTime.now(), //Agrega la hora actual para el timestamp
      );
}

//Tarea: agregar la hora en la que se envia el mensaje como en WhatsApp