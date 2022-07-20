import 'package:flutter/material.dart';
import 'package:flutter_pokemon/constants/constants.dart';
import 'package:flutter_pokemon/constants/ui_helper.dart';
import 'package:flutter_pokemon/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelper.getDefaultPadding(),
      child: Container(
        decoration: UIHelper.getDefaultBorderRadius(),
        padding: const EdgeInsets.all(20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildInformationRow('Name', pokemon.name),
          _buildInformationRow('Height', pokemon.height),
          _buildInformationRow('Weight', pokemon.weight),
          _buildInformationRow('Spawn Time', pokemon.spawnTime),
          _buildInformationRow('Weakness', pokemon.weaknesses),
          _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
          _buildInformationRow('Next Evolution', pokemon.nextEvolution),
        ]),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constants.getPokeInfoLabelTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(value.join(' , '), style: Constants.getPokeInfoTextStyle())
        else if (value == null)
          Text('Not Available', style: Constants.getPokeInfoTextStyle())
        else
          Text(value, style: Constants.getPokeInfoTextStyle())
      ],
    );
  }
}
