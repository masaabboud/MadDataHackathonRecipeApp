//
//  PythonPlaceholder.py
//  Recipe App
//
//  Created by Annie Z on 2/22/25.
//
import json
def getRecipe(preferences_json):
    #preferences is json data - need to convert to dict
    preferences = json.loads(preferences_json)
    recipes = [
        {"name": "Salad", "diets": "vegetarian", "calories": 200},
        {"name": "Cheeseburger", "diets": "None", "calories": 400},
        {"name": "Sushi", "diets": "None", "calories": 300}
               ]

    filtered_recipes = [
        recipe for recipe in recipes
        if all(preferences.get(key, recipe[key]) == recipe[key] for key in preferences)
    ]
    
    # Convert filtered recipes to JSON
    recipe = json.dumps({"recommendations": filtered_recipes}, indent=4)
    
    return recipe

if __name__=="__main__":
    preferences_json = '{"diets": "vegetarian"}'
    recipe = getRecipe(preferences_json)
    print(recipe)
