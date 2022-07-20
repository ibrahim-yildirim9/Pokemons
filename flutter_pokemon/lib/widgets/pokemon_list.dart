import 'package:flutter/material.dart';
import 'package:flutter_pokemon/constants/ui_helper.dart';
import 'package:flutter_pokemon/model/pokemon_model.dart';
import 'package:flutter_pokemon/services/pokedex_api.dart';
import 'package:flutter_pokemon/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _listem = snapshot.data!;
            return GridView.builder(
                itemCount: _listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: UIHelper.getGridNumber(),
                ),
                itemBuilder: (context, index) =>
                    PokeListItem(pokemon: _listem[index]));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Hata çıktı'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
