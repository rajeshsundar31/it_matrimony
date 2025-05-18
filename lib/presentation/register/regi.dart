import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: RegisterStepper()));

class RegisterStepper extends StatefulWidget {
  @override
  _RegisterStepperState createState() => _RegisterStepperState();
}

class _RegisterStepperState extends State<RegisterStepper> {
  int _currentStep = 0;

  // One form key per step
  final List<GlobalKey<FormState>> _formKeys = List.generate(5, (i) => GlobalKey<FormState>());

  // 5 steps * 6 fields
  final List<List<TextEditingController>> _controllers = List.generate(
    5,
    (i) => List.generate(6, (j) => TextEditingController()),
  );

  // Build 6 text fields per step
  List<Widget> _buildFields(int step) {
    return List.generate(6, (i) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: _controllers[step][i],
          decoration: InputDecoration(
            labelText: 'Step ${step + 1} - Field ${i + 1}',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        ),
      );
    });
  }

  void _nextStep() {
    if (_formKeys[_currentStep].currentState!.validate()) {
      if (_currentStep < 4) {
        setState(() => _currentStep += 1);
      } else {
        // Final form submission
        print("All data collected.");
        for (var step in _controllers) {
          for (var field in step) {
            print(field.text);
          }
        }
      }
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal Stepper Registration')),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: _nextStep,
        onStepCancel: _prevStep,
        controlsBuilder: (context, details) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_currentStep > 0)
                ElevatedButton(
                  onPressed: details.onStepCancel,
                  child: Text('Back'),
                ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(_currentStep == 4 ? 'Submit' : 'Next'),
              ),
            ],
          );
        },
        steps: List.generate(5, (step) {
          return Step(
            title: Text('Step ${step + 1}'),
            isActive: _currentStep >= step,
            state: _currentStep > step ? StepState.complete : StepState.indexed,
            content: Form(
              key: _formKeys[step],
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9
                  ),
                  child: Column(children: _buildFields(step))),
              ),
            ),
          );
        }),
      ),
    );
  }
}
