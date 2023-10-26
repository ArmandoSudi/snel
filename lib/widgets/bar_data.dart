import 'individual_bar.dart';

class BarData {
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  BarData(this.monAmount, this.tueAmount, this.wedAmount, this.thuAmount,
      this.friAmount, this.satAmount, this.sunAmount);

  List<IndividualBar> barData = [];

  void initializeData() {
    barData  = [
      IndividualBar(0, monAmount),
      IndividualBar(1, tueAmount),
      IndividualBar(2, wedAmount),
      IndividualBar(3, thuAmount),
      IndividualBar(4, friAmount),
      IndividualBar(5, satAmount),
      IndividualBar(6, sunAmount),
    ];
  }
}