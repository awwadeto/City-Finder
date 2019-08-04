# City Finder

This project allows the user to search through a JSON file of cities around the world and present them on the map

# Implementations

The app is using a Split View Controller to adapt for the Master and Detail views needed to present both side by side on landscape screens while changing the behaviour into Navigation push and pull in Portrait mode

### The Master View (CitiesViewController)

* The screen is a *Table View* with a *Search controller* attached to the *Navigation controller* and it gets its source data from the JSON file named *cities.json*
* Each cell represents a city with the city name and country name in the title label and city location in the detail label
* Clicking on any cell will pass the city object to the Detail View (MapViewController) and show a pin on the map with the city location
* Typing Text in the Search bar will start updating the list with the filtered cities related to the typed text, the data is being updating on a different thread from the main thread to keep the user experience smooth and prevent the UI from getting stuck, and after finishing the search, the view will be updated on the main thread 

### The Detail View (MapViewController)

* The screen is a *Map View* that's centered on the location of the picked city from the master view
* It Centers with a region span of 0.01
* It only has one pin annotation on the map, by clicking on the pin; it will show the name of the city plus a detailed disclousre button
* Clicking on the detail button will open the AboutViewController, which display information about the location

### The About View (AboutViewController)

* The screen shows a list of information provided by the JSON fie named *aboutInfo.json*, which only has one entry
* That information will be presented in a (key, value) style in a Table View
