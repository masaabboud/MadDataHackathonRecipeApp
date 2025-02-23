from flask import Flask, request, jsonify
import google.generativeai as genai
import json

app = Flask(__name__)

# Load processed dataset
with open("processed_data.json", "r") as f:
    recipe_data = json.load(f)

# Set Gemini API Key
genai.configure(api_key="AIzaSyAWD5rEtD6GDAgj-cxl1kP9yCJdMX7MTLU")

@app.route("/get_recipes", methods=["GET"])
def get_recipes():
    return jsonify(recipe_data)

def filter_recipes_by_preferences(preferences, recipes):
    # Assume preferences contains things like "low calorie", "high protein", etc.
    filtered_recipes = []
    for recipe in recipes:
        if "low calorie" in preferences and recipe['Calories_Per_Serving'] < 300:
            filtered_recipes.append(recipe)
        # Add more filters based on user preferences
    return filtered_recipes

@app.route("/generate_recipe", methods=["POST"])
def generate_recipe():
    data = request.get_json()
    user_preferences = data["preferences"]

    filtered_recipes = filter_recipes_by_preferences(user_preferences, recipe_data)
    
    # Build prompt using filtered recipes
    filtered_recipes_str = "\n".join([f"{recipe['Recipe_Name']}: {recipe['Ingredients_List']}, Calories: {recipe['Calories_Per_Serving']}" for recipe in filtered_recipes])
    
    prompt = f"""
    You are a chef. Based on the following recipes, suggest a new recipe that fits the following preferences:
    {filtered_recipes_str}
    
    User preferences: {user_preferences}
    """

    # Use Gemini model for text generation
    model = genai.GenerativeModel("gemini-pro")  # Use "gemini-1.5-pro" if available
    response = model.generate_content(prompt)

    # Extract response text
    generated_recipe = response.text if hasattr(response, "text") else "Failed to generate recipe."

    return jsonify({"recipe": generated_recipe})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=10005)