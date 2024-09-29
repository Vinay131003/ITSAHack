import os
from flask import Flask, request, jsonify
from flask_cors import CORS # type: ignore
import requests # type: ignore
import mysql.connector # type: ignore

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# API key for nutrition data retrieval
API_NINJA_KEY = "2H89DYlefk874O7ZM8T4wQ==KgmCTrpSb2DidM1i"

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'root',  # Update with your MySQL username
    'password': '',  # Update with your MySQL password
    'database': 'project'
}

def get_nutrition_data(query):
    """Fetch nutrition data from the API based on food query."""
    api_url = f'https://api.api-ninjas.com/v1/nutrition?query={query}'
    response = requests.get(api_url, headers={'X-Api-Key': API_NINJA_KEY})
    
    if response.status_code == requests.codes.ok:
        return response.json()
    else:
        raise Exception(f"Error: {response.status_code}, {response.text}")

def is_number(value):
    """Check if a value can be converted to a float."""
    try:
        float(value)
        return True
    except ValueError:
        return False

@app.route('/fetch_nutrition_details', methods=['POST'])
def fetch_nutrition_details():
    """Endpoint to fetch nutrition details for a given user ID."""
    try:
        data = request.get_json()
        user_id = data.get('userId', '')  # Get the user ID from the request data

        if not user_id:
            return jsonify({"success": False, "message": "No user ID provided."}), 400

        # Fetch nutrition records from the database for the specified user_id
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = "SELECT * FROM nutrition WHERE user_id = %s"
        cursor.execute(query, (user_id,))
        results = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify({"success": True, "nutrition_records": results})

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"success": False, "message": "Failed to fetch nutrition details.", "error": str(e)}), 500

@app.route('/track_nutrients', methods=['POST'])
def track_nutrients():
    """Endpoint to track nutrient data for a given food input."""
    try:
        data = request.get_json()
        food_input = data.get('foodInput', '')

        if not food_input:
            return jsonify({"success": False, "message": "No food input provided."}), 400

        nutrition_data = get_nutrition_data(food_input)

        if nutrition_data:
            total_fat = sum(float(item['fat_total_g']) for item in nutrition_data if is_number(item.get('fat_total_g')))
            carbohydrates = sum(float(item['carbohydrates_total_g']) for item in nutrition_data if is_number(item.get('carbohydrates_total_g')))
            total_calories = (total_fat * 9) + (carbohydrates * 4)
            estimated_protein = (total_calories - (total_fat * 9) - (carbohydrates * 4)) / 4

            # Set a minimum protein value
            estimated_protein = max(5, estimated_protein)  # Set a default protein value if estimated protein is less than 5

            return jsonify({
                "success": True,
                "nutrition": {
                    "total_calories": total_calories,
                    "total_fat": total_fat,
                    "carbohydrates": carbohydrates,
                    "total_protein": estimated_protein
                }
            })
        else:
            return jsonify({"success": True, "nutrition": None})

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"success": False, "message": "Failed to fetch nutrition data.", "error": str(e)}), 500

@app.route('/add_to_db', methods=['POST'])
def add_to_db():
    """Endpoint to add nutrition data and foodInput to the database."""
    try:
        data = request.get_json()
        user_id = data.get('userId', 'constant_user_id')  # Use a constant user ID for now
        total_calories = data.get('totalCalories', '')
        total_fat = data.get('totalFat', '')
        carbohydrates = data.get('carbohydrates', '')
        total_protein = data.get('totalProtein', '')
        food_input = data.get('foodInput', '')  # Get the food input from the request data
        date = data.get('date', '')  # Get the date from the request data

        # Database insertion
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        insert_query = """
        INSERT INTO nutrition (foodInput, user_id, total_calories, total_fat, carbohydrates, total_protein, date)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (food_input, user_id, total_calories, total_fat, carbohydrates, total_protein, date))
        conn.commit()

        cursor.close()
        conn.close()

        return jsonify({"success": True, "message": "Data added to the database."})

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"success": False, "message": "Failed to add data to the database.", "error": str(e)}), 500

@app.route('/get_nutrition/<user_id>', methods=['GET'])
def get_nutrition(user_id):
    """Endpoint to retrieve nutrition records for a specific user."""
    try:
        # Establish MySQL connection
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)  # Use dictionary cursor for easier JSON conversion

        # Query to get nutrition details for the specified user_id
        query = "SELECT * FROM nutrition WHERE user_id = %s"
        cursor.execute(query, (user_id,))
        results = cursor.fetchall()

        cursor.close()
        conn.close()

        # Check if results is empty and ensure it returns an array
        return jsonify({"success": True, "nutrition_records": results or []})  # Return an empty array if no records found

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"success": False, "message": "Failed to retrieve data from the database.", "error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
