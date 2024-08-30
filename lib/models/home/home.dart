import 'package:flutter/material.dart';
import '../../data/user_type.dart';
import '../other/super_components/app_bar.dart';
import 'components/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.userData,
      required this.pageNumber,
      required this.pageSize,
      required this.search,
      required this.sort,
      required this.filter,
      super.key});

  final User userData;
  final int pageNumber;
  final int pageSize;
  final String search;
  final String sort;
  final List<String> filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (userData.getType == UserType.admin) ? SuperAppBar(area: "home_admin", search: '',) :  SuperAppBar(area: "home_user", search: '',),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Benvenuto ${getUserType()}\n",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Clicca in alto a destra per il menù",
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const Text(
                  "SITO WEB",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getUserType() {
    UserType typeUser = userData.getType();
    if (typeUser == UserType.admin) {
      return "Admin";
    } 
    return "Utente";
  }
}