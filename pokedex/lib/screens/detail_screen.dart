import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utilities/constants.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  Widget _renderStat({required String label, required String value}) {
    return Column(
      children: [
        Text(
          label,
          style:
              const TextStyle(color: kLightGrey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          value,
          style: const TextStyle(
            color: kDarkGrey,
            fontSize: 28,
            fontWeight: FontWeight.w400,
            letterSpacing: 4,
            fontFamily: 'Pokemon',
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                pokemon.name,
                style: const TextStyle(
                  fontFamily: 'Pokemon',
                  fontSize: 32,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Image.asset("assets/images/large/${pokemon.id}.png"),
              const SizedBox(
                height: 16.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    children: [
                      _renderStat(
                          label: 'HP', value: pokemon.hitPoints.toString()),
                      _renderStat(
                          label: 'ATTACK', value: pokemon.attack.toString()),
                      _renderStat(
                          label: 'DEFENSE', value: pokemon.defense.toString()),
                      _renderStat(
                          label: 'SPEED', value: pokemon.speed.toString()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
