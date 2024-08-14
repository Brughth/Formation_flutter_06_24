import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/person/data/person_model.dart';
import 'package:formation_flutter_join24/person/presentation/add_or_update_person.dart';
import 'package:formation_flutter_join24/shared/app_routes.dart';
import 'package:formation_flutter_join24/shared/const.dart';

import '../data/person_service.dart';

class PersonListScreen extends StatefulWidget {
  const PersonListScreen({super.key});

  @override
  State<PersonListScreen> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends State<PersonListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Persons"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateTo(context, const AddOrUpdatePersonScreen());
        },
        label: const Text("Add Person"),
        icon: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: personsRef.orderBy('createdAt', descending: true).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 50,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          if (snapshot.hasData) {
            var data = snapshot.data?.docs;

            if (data?.isEmpty ?? true) {
              return const Center(
                child: Text(
                  "Aucun donnee pour le moment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                var doc = data[index].data();
                var person = PersonModel.fromJson(doc);

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: person.image != null
                        ? NetworkImage(person.image!)
                        : NetworkImage(
                            "https://ui-avatars.com/api/?name=${person.name}",
                          ),
                  ),
                  title: Text(person.name),
                  subtitle: Text(person.email),
                  trailing: PopupMenuButton<int>(
                    onSelected: (value) {},
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 1,
                          child: const Text("Modifier"),
                          onTap: () {
                            navigateTo(
                              context,
                              AddOrUpdatePersonScreen(
                                person: person,
                              ),
                            );
                          },
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: const Text("Supprimer"),
                          onTap: () {
                            try {
                              PersonService().deletePerson(person.id);
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ];
                    },
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
