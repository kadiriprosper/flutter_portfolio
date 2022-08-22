class TipCalc {
  TipCalc({required this.amount, required this.percent, required this.head});

  double? amount;
  int? percent;
  int? head;

  String? calcTotalTip() {
    return ((percent! / 100) * amount!).toStringAsFixed(2);
  }

  String? totalBill() {
    final totalTip = double.tryParse(calcTotalTip()!);
    return (amount! + totalTip!).toStringAsFixed(2);
  }

  String? tipPerPerson() {
    final totalTip = double.tryParse(calcTotalTip()!);
    return (totalTip! / head!).toStringAsFixed(2);
  }

  String? totalBillPerPerson() {
    final totalBillStuff = double.tryParse(totalBill()!);
    return (totalBillStuff! / head!).toStringAsFixed(2);
  }
}
