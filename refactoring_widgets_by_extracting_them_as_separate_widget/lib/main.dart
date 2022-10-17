import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Refactoring Widgets")),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            final fakeData = Faker.withGenerator(random);
            return ListTile(
              title: Text(fakeData.person.name()),
              subtitle: Text(fakeData.lorem.sentence()),
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(fakeData.image.image(random: true)),
              ),
            );
          },
        ),
      ),
    ),
  );
}
