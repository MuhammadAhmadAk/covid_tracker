import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/Views/details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountrieList extends StatefulWidget {
  const CountrieList({super.key});

  @override
  State<CountrieList> createState() => _CountrieListState();
}

class _CountrieListState extends State<CountrieList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateService stateService = StateService();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search Country',
                  hintStyle: const TextStyle(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: stateService.countriesListApi(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: Column(
                          children: [
                            ListTile(
                                title: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.grey,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.grey,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 89,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      String name = snapshot.data![index]['country'];
                      if (searchController.text.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        totalcase: snapshot.data![index]
                                            ['cases'],
                                        active: snapshot.data![index]['active'],
                                        totalRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        totalDeaths: snapshot.data![index]
                                            ['deaths'],
                                      ),
                                    ));
                              },
                              child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  )),
                            )
                          ],
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        totalcase: snapshot.data![index]
                                            ['cases'],
                                        active: snapshot.data![index]['active'],
                                        totalRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        totalDeaths: snapshot.data![index]
                                            ['deaths'],
                                      ),
                                    ));
                              },
                              child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  )),
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
