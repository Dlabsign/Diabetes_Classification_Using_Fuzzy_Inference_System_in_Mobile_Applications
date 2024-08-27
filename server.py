from flask import Flask, request, jsonify
import numpy as np
import skfuzzy as fuzz
from skfuzzy import control as ctrl

app = Flask(__name__)

# Definisi fungsi keanggotaan untuk variabel input
glucose = ctrl.Antecedent(np.arange(0, 201, 1), 'glucose')
bmi = ctrl.Antecedent(np.arange(0, 51, 1), 'bmi')
age = ctrl.Antecedent(np.arange(0, 101, 1), 'age')
diabetes_pedigree = ctrl.Antecedent(np.arange(0, 2.51, 0.01), 'diabetes_pedigree')
insulin = ctrl.Antecedent(np.arange(0, 401, 1), 'insulin')

# Definisi variabel output fuzzy
diabetes_level = ctrl.Consequent(np.arange(0, 101, 1), 'diabetes_level')

# Definisi fungsi keanggotaan
glucose['low'] = fuzz.trimf(glucose.universe, [0, 60, 120])
glucose['medium'] = fuzz.trimf(glucose.universe, [80, 120, 160])
glucose['high'] = fuzz.trimf(glucose.universe, [120, 160, 200])

bmi['low'] = fuzz.trimf(bmi.universe, [0, 15, 30])
bmi['medium'] = fuzz.trimf(bmi.universe, [20, 30, 40])
bmi['high'] = fuzz.trimf(bmi.universe, [30, 40, 50])

age['young'] = fuzz.trimf(age.universe, [0, 20, 40])
age['middle'] = fuzz.trimf(age.universe, [20, 40, 60])
age['old'] = fuzz.trimf(age.universe, [40, 60, 100])

diabetes_pedigree['low'] = fuzz.trimf(diabetes_pedigree.universe, [0, 0.5, 1])
diabetes_pedigree['medium'] = fuzz.trimf(diabetes_pedigree.universe, [0.5, 1, 1.5])
diabetes_pedigree['high'] = fuzz.trimf(diabetes_pedigree.universe, [1, 1.5, 2.5])

insulin['low'] = fuzz.trimf(insulin.universe, [0, 100, 200])
insulin['medium'] = fuzz.trimf(insulin.universe, [100, 200, 300])
insulin['high'] = fuzz.trimf(insulin.universe, [200, 300, 400])

diabetes_level['low'] = fuzz.trimf(diabetes_level.universe, [0, 25, 50])
diabetes_level['medium'] = fuzz.trimf(diabetes_level.universe, [25, 50, 75])
diabetes_level['high'] = fuzz.trimf(diabetes_level.universe, [50, 75, 100])

# Definisi aturan fuzzy
rule1 = ctrl.Rule(glucose['high'] & bmi['high'] & age['old'], diabetes_level['high'])
rule2 = ctrl.Rule(glucose['high'] & insulin['high'], diabetes_level['high'])
rule3 = ctrl.Rule(diabetes_pedigree['high'] & insulin['high'], diabetes_level['high'])
rule4 = ctrl.Rule(glucose['medium'] | bmi['medium'] | age['middle'], diabetes_level['medium'])
rule5 = ctrl.Rule(glucose['low'] & bmi['low'] & age['young'], diabetes_level['low'])
rule6 = ctrl.Rule(glucose['medium'] & bmi['medium'] & age['middle'], diabetes_level['medium'])
rule7 = ctrl.Rule(glucose['low'] & bmi['low'] & insulin['low'], diabetes_level['low'])

# Buat sistem kontrol fuzzy
diabetes_ctrl = ctrl.ControlSystem([rule1, rule2, rule3, rule4, rule5, rule6, rule7])
diabetes_sim = ctrl.ControlSystemSimulation(diabetes_ctrl)

@app.route('/evaluate', methods=['POST'])
def evaluate():
    data = request.json
    try:
        # Assign input values
        diabetes_sim.input['glucose'] = data['glucose']
        diabetes_sim.input['bmi'] = data['bmi']
        diabetes_sim.input['age'] = data['age']
        diabetes_sim.input['diabetes_pedigree'] = data['diabetes_pedigree']
        diabetes_sim.input['insulin'] = data['insulin']

        # Compute result
        diabetes_sim.compute()
        diabetes_level_value = diabetes_sim.output['diabetes_level']

        return jsonify({"diabetes_level": diabetes_level_value})
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True)
