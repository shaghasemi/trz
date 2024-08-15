import 'dart:isolate';
import 'package:hamdars/domain/entities/transaction.dart';

Future<List<Transaction>> processTransactionsInIsolate(
  List<Transaction> transactions,
) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(
    _transactionIsolate,
    receivePort.sendPort,
  );
  final SendPort sendPort = await receivePort.first as SendPort;
  final ReceivePort response = ReceivePort();
  sendPort.send([transactions, response.sendPort]);
  return await response.first as List<Transaction>;
}

void _transactionIsolate(SendPort sendPort) {
  final ReceivePort port = ReceivePort();
  sendPort.send(port.sendPort);

  port.listen(
    (dynamic message) {
      final List<Transaction> transactions = message[0] as List<Transaction>;
      final SendPort send = message[1] as SendPort;

      // Simulate heavy processing
      final List<Transaction> processedTransactions = transactions.map(
        (Transaction transaction) {
          // Add processing logic here
          return transaction;
        },
      ).toList();

      send.send(processedTransactions);
    },
  );
}
