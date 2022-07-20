import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/constants/constants.dart';
import 'package:flutter_pokemon/constants/ui_helper.dart';
import 'package:flutter_pokemon/model/pokemon_model.dart';

class PokeImageBall extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeImageBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.pokeballImageUrl,
            width: UIHelper.calculatePokeImageAndBall(),
            height: UIHelper.calculatePokeImageAndBall(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImageAndBall(),
              height: UIHelper.calculatePokeImageAndBall(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
