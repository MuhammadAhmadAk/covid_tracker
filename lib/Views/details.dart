// ignore_for_file: must_be_immutable

import 'package:covid_tracker/Views/world_state.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String? name;
  String? image;
  int totalcase, totalDeaths, totalRecovered, active;

  DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalcase,
    required this.active,
    required this.totalRecovered,
    required this.totalDeaths,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        ReuseableRow(
                            title: 'Total cases',
                            value: widget.totalcase.toString()),
                        ReuseableRow(
                            title: 'Active', value: widget.active.toString()),
                        ReuseableRow(
                            title: 'Total Recovered',
                            value: widget.totalRecovered.toString()),
                        ReuseableRow(
                            title: 'Total Deaths',
                            value: widget.totalDeaths.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(widget.image.toString()))
              ],
            )
          ],
        ),
      ),
    );
  }
}
