import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_chat/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({
    super.key,
    required this.message
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat.jm().format(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(formattedTime, style: const TextStyle(fontSize: 10, color: Colors.black))
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),

        Container(
          decoration: BoxDecoration(
            color: colors.secondary, 
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Stack(
              children: [
                _ImageBubble(image: message.imageUrl!),
          
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black87
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        stops: [0.7, 1.0]
                      ),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
                    ),
                  )
                ),
          
                Positioned(
                  bottom: 10,
                  left: 190,
                  child: Text(formattedTime, style: const TextStyle(fontSize: 10, color: Colors.white))
                )
              ],
            ),
          )
          ),

        const SizedBox(height: 15,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String image;

  const _ImageBubble({
    required this.image
    });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Image.network(
        image,
        width: size.width * 0.7,
        height: 175,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 175,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                strokeWidth: 2,
              )
            ),
          );
        },
        )
      );
  }
}
