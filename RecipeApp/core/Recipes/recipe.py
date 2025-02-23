import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

data = pd.read_csv('recipe_data.csv')

# Select relevant columns
data = data[['Recipe_Name', 'Cuisine_Type', 'Ingredients_List', 'Preparation_Steps','Cooking_Time_Minutes','Difficulty_Level', 'Serving_Size', 'Calories_Per_Serving', 'Allergen_Information', 'Cost_Per_Serving']]

# Convert to JSON for API use
data_json = data.to_json(orient="records")

# Save processed data
with open("processed_data.json", "w") as f:
    f.write(data_json)


if __name__ == "__main__":    
        
    file_path = 'recipe_data.csv'
    df = pd.read_csv(file_path)

    # Display the first few rows of the dataframe
    
    print(df.head().to_string())