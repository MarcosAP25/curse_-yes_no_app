import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
   final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola, como estas?',
              style: TextStyle(
                color: colors.onPrimary
              ),
            ),
          ),
        ),
        const SizedBox(height: 5,),

        _ImageMeme(),

        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageMeme extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/no/13-755222c98795431aa2e7d453ab1e75a1.gif',
        width: size.width *0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null){
            return child;
          }
          return SizedBox(
            width: size.width *0.7,
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null 
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null
              ),
            ),
          );
        },
      ),
    );
  }
}