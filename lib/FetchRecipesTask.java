import android.os.AsyncTask;
import android.util.Log;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FetchRecipesTask extends AsyncTask<Void, Void, String> {
    private static final String SPOONACULAR_API_KEY = "e6dfc0abd1524170abd193b756e7ef7c ";
    private static final String SPOONACULAR_API_ENDPOINT = "https://api.spoonacular.com/recipes/search";
    private static final int NUMBER_OF_RECIPES = 10; // Adjust as needed

    @Override
    protected String doInBackground(Void... voids) {
        try {
            URL url = new URL(buildApiUrl());
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

            try {
                BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;

                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }

                return response.toString();
            } finally {
                urlConnection.disconnect();
            }
        } catch (Exception e) {
            Log.e("FetchRecipesTask", "Error fetching recipes", e);
            return null;
        }
    }

    @Override
    protected void onPostExecute(String jsonResponse) {
        if (jsonResponse != null) {
            // Parse the JSON response and handle the recipes data
            handleRecipesData(jsonResponse);
        } else {
            // Handle errors
        }
    }

    private String buildApiUrl() {
        return SPOONACULAR_API_ENDPOINT +
                "?apiKey=" + SPOONACULAR_API_KEY +
                "&number=" + NUMBER_OF_RECIPES;
    }

    private void handleRecipesData(String jsonResponse) {
        // Parse the JSON response and extract information about the recipes
        // Update UI or data structures accordingly
    }
}
