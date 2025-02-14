import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const LogicGatesApp());
}

class LogicGatesApp extends StatelessWidget {
  const LogicGatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogicGateSimulator(),
    );
  }
}

class LogicGateSimulator extends StatefulWidget {
  @override
  _LogicGateSimulatorState createState() => _LogicGateSimulatorState();
}

class _LogicGateSimulatorState extends State<LogicGateSimulator> {
  String selectedGate = 'AND'; // Compuerta por defecto
  bool inputA = false;
  bool inputB = false;
  bool inputSel = false; // Para MUX y DMUX
  bool output = false;
  List<bool> signalPath = [];

  // 🔹 Implementación de compuertas usando NAND como base
  bool nand(bool a, bool b) => !(a && b);
  bool not(bool a) => nand(a, a);
  bool and(bool a, bool b) => not(nand(a, b));
  bool or(bool a, bool b) => nand(not(a), not(b));
  bool xor(bool a, bool b) => and(nand(a, b), or(a, b));
  bool mux(bool a, bool b, bool sel) => or(and(not(sel), a), and(sel, b));
  List<bool> dmux(bool input, bool sel) =>
      [and(input, not(sel)), and(input, sel)];

  // Diccionario de funciones de compuertas
  late final Map<String, Function> gateFunctions;

  @override
  void initState() {
    super.initState();
    gateFunctions = {
      'AND': () => and(inputA, inputB),
      'OR': () => or(inputA, inputB),
      'XOR': () => xor(inputA, inputB),
      'NOT': () => not(inputA),
      'MUX': () => mux(inputA, inputB, inputSel),
      'DMUX': () => dmux(inputA, inputSel),
    };
    signalPath = List.generate(4, (_) => false);
  }

  void startAnimation() {
    setState(() {
      signalPath = List.generate(4, (_) => false);
      output = false;
    });

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      int step = timer.tick - 1;
      if (step < signalPath.length) {
        setState(() {
          signalPath[step] = true;
        });
      } else {
        timer.cancel();
        setState(() {
          output = gateFunctions[selectedGate]!() is bool
              ? gateFunctions[selectedGate]!()
              : (gateFunctions[selectedGate]!() as List<bool>)[0];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logic Gate Simulator")),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedGate,
            onChanged: (String? newValue) {
              setState(() {
                selectedGate = newValue!;
                signalPath = List.generate(4, (_) => false);
                output = false;
              });
            },
            items:
                gateFunctions.keys.map<DropdownMenuItem<String>>((String gate) {
              return DropdownMenuItem<String>(
                value: gate,
                child: Text(gate),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSwitch(
                  "A", inputA, (value) => setState(() => inputA = value)),
              if (selectedGate != "NOT")
                _buildSwitch(
                    "B", inputB, (value) => setState(() => inputB = value)),
              if (selectedGate == "MUX" || selectedGate == "DMUX")
                _buildSwitch("SEL", inputSel,
                    (value) => setState(() => inputSel = value)),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: startAnimation,
            child: const Text("Execute circuit"),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 200),
                painter: CircuitPainter(
                    selectedGate, inputA, inputB, inputSel, signalPath, output),
              ),
            ),
          ),
          Text("Output: ${output ? '1' : '0'}",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        Switch(value: value, onChanged: onChanged),
        Text(label),
      ],
    );
  }
}

class CircuitPainter extends CustomPainter {
  final String gate;
  final bool inputA, inputB, inputSel;
  final List<bool> signalPath;
  final bool output;

  CircuitPainter(this.gate, this.inputA, this.inputB, this.inputSel,
      this.signalPath, this.output);

  @override
  void paint(Canvas canvas, Size size) {
    final paintWire = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final paintSignal = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    Offset input1 = Offset(20, size.height / 3);
    Offset input2 = Offset(20, 2 * size.height / 3);
    Offset gatePos = Offset(size.width / 2, size.height / 2);
    Offset outputPos = Offset(size.width - 20, size.height / 2);

    canvas.drawCircle(input1, 5, Paint()..color = Colors.blue);
    if (gate != "NOT")
      canvas.drawCircle(input2, 5, Paint()..color = Colors.blue);
    if (gate == "MUX" || gate == "DMUX") {
      Offset selPos = Offset(20, size.height / 2);
      canvas.drawCircle(selPos, 5, Paint()..color = Colors.green);
      canvas.drawLine(selPos, gatePos, paintWire);
      if (signalPath[2] && inputSel)
        canvas.drawLine(selPos, gatePos, paintSignal);
    }

    textPainter.text = TextSpan(
      text: gate,
      style: const TextStyle(fontSize: 18, color: Colors.black),
    );
    textPainter.layout();
    textPainter.paint(canvas, gatePos - Offset(20, 20));

    canvas.drawLine(input1, gatePos, paintWire);
    if (gate != "NOT") canvas.drawLine(input2, gatePos, paintWire);
    canvas.drawLine(gatePos, outputPos, paintWire);

    if (signalPath[0] && inputA) canvas.drawLine(input1, gatePos, paintSignal);
    if (signalPath[1] && inputB) canvas.drawLine(input2, gatePos, paintSignal);
    if (signalPath[3] && output)
      canvas.drawLine(gatePos, outputPos, paintSignal);

    canvas.drawCircle(
        outputPos,
        5,
        output ? (Paint()..color = Colors.red) : Paint()
          ..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
