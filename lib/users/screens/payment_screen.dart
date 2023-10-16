import 'package:flutter/material.dart';

enum PaymentMethod {
  mpesa,
  airtelMOney,
  orangeMoney,
  visa,
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  var paymentMethod = PaymentMethod.mpesa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Méthode de paiement"),
      ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: (paymentMethod == PaymentMethod.mpesa) ? Colors.blue : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Mpesa'),
                      leading: Image.asset("assets/icons/mpesa_logo.png",),
                      trailing : Radio<PaymentMethod>(
                        value: PaymentMethod.mpesa,
                        groupValue: paymentMethod,
                        activeColor: Colors.red, // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                        splashRadius: 20, // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: (paymentMethod == PaymentMethod.airtelMOney) ? Colors.blue : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Airtel Money'),
                      leading: Image.asset("assets/icons/airtel_money_logo.png",),
                      trailing : Radio<PaymentMethod>(
                        value: PaymentMethod.airtelMOney,
                        groupValue: paymentMethod,
                        activeColor: Colors.red, // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                        splashRadius: 20, // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: (paymentMethod == PaymentMethod.orangeMoney) ? Colors.blue : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Orange Money'),
                      leading: Image.asset("assets/icons/orange_money_logo.png",),
                      trailing : Radio<PaymentMethod>(
                        value: PaymentMethod.orangeMoney,
                        groupValue: paymentMethod,
                        activeColor: Colors.red, // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                        splashRadius: 20, // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: (paymentMethod == PaymentMethod.visa) ? Colors.blue : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Visa'),
                      leading: Image.asset("assets/icons/visa_logo.png",),
                      trailing : Radio<PaymentMethod>(
                        value: PaymentMethod.visa,
                        groupValue: paymentMethod,
                        activeColor: Colors.red, // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                        splashRadius: 20, // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0, right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen()));
                    },
                    child: Text("Continuer")),
              ),
            )
          ],
        )
    );
  }
}

class CustomRadio<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final void Function(T) onChanged;
  const CustomRadio({Key? key, required this.value, required this.groupValue, required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {

    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(shape: BoxShape.circle, color: selected ? Colors.white : Colors.grey[200]),
        child: Icon(
          Icons.circle,
          size: 30,
          color: selected ? Colors.blue : Colors.grey[200],
        ),
      ),
    );
  }
}

