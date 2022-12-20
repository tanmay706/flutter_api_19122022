import 'package:flutter/material.dart';

import '../../service/service.dart';
import '../model.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: fetchTransaction(),
          builder: (context, AsyncSnapshot<List<TransactionDetails>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return const Center(child: Text('Something went wrong'));
              }

              return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].amount),
                    );
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
