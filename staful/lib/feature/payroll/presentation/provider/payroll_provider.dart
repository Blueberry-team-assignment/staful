class PayrollState {
  final List<Map<String, int>>? payrollItems;
  final int totalPay;

  PayrollState({
    this.payrollItems,
    this.totalPay = 0,
  });
}
