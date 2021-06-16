import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  List<String> advice = new List<String>();

  CalculatorBrain({this.height, this.weight});

  void addAdvice() {
    //High BMI
    advice.add(
        'Adding five servings of fruit and vegetables a day can add nutrition to your diet, '
        'which will also serve to fill you up.');
    advice.add(
        'High sugar foods such as sweetened cereal, chocolate and pastries should be avoided, '
        'as well as sugary soda drinks.');
    advice.add(
        'Eating lean meat can assist with weight loss as it contains significantly more protein '
        'and has less fat and carbohydrate content.');
    advice.add('It can be quite tempting to buy snacks when shopping, '
        'but snacks such as crisps and chocolate can contain excess calories.');
    //Normal BMI
    advice.add(
        'It\'s important to exercise at least 60-90 minutes most days of the week.');
    advice.add('Staying hydrated and eat a balanced diet are important.');
    advice.add(
        'Set reasonable limits on the amount of time you spend watching TV, playing video games,'
        ' and using computers, phones, and tablets not related to school work.');
    advice.add(
        'If you want to burn more calories, increase the intensity of your workout '
        'and add some strength exercises to build muscle.');
    advice.add(
        'You can increase calories by adding nut or seed toppings, cheese, and healthy side dishes. '
        'Try almonds, sunflower seeds, fruit, or whole-grain, wheat toast.');
    advice.add(
        'Instead of eating empty calories and junk food, eat foods that are rich in nutrients.'
        ' Consider high-protein meats, which can help you to build muscle.');
    advice.add(
        'Consider eating smaller meals throughout the day to increase your calorie intake.');
    advice.add(
        'While too much aerobic exercise will burn calories and work against your weight goal, '
        'strength training can help. This includes weightlifting or yoga');
  }

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    addAdvice();
    Random ran = new Random();
    if (_bmi >= 25) {
      return "You have a higher than normal body weight.\n" +
          (advice[ran.nextInt(4)]);
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!\n" +
          (advice[ran.nextInt(4) + 4]);
    } else {
      return "You have a lower than normal body weight.\n" +
          (advice[ran.nextInt(4) + 8]);
    }
  }
}
