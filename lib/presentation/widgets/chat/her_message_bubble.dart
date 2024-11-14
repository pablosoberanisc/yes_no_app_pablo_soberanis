import 'package:flutter/material.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;
  
  const HerMessageBubble({
    super.key, 
    required this.message
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, 
              style: const TextStyle( color: Colors.black),
            ),
          ),
        ),

        const SizedBox(height: 5),
         _ImageBubble(imageUrl: message.imagenUrl!),//! es que responda algo. un valor nulo

        const SizedBox(height: 10),
        Text(
          message.formattedTimestamp,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {

 final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Messi esta enviando una imagen'),
          );
        },
      ),
    );
  }
}