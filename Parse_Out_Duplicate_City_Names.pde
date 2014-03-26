/*
Since teaching a class on Processing this past Saturday I've realized that a few code examples of using Processing for some straightforward tasks might be helpful to people getting started with the Processing language and programming in general. 

This example came out of a problem I had at work where I needed to generate a clean list of names from a text file where each name was listed nine times with some unnecessary.

The code below goes through the following steps to create a list of clean city names from an original list where each name had been duplicated nine times.
The steps involved are:
1) Read in a text file from your local hard drive.
2) Create a new array by selecting every ninth line.
3) Clean out some extraneous information at the end of each city name.
4) Save the cleaned version back out to a file on your hard drive.

I've added comments for each line which will hopefully provide enough information about how the program works. 

The file being used in the example is 9000 lines of city names. Each city name is repeated nine times with some random
extraneous data added at the end of each line.

This is an example of the content and structure of the example file:
"TOKYO, Japan" - [425083]
"TOKYO, Japan" - [456198]
"TOKYO, Japan" - [504920]
"TOKYO, Japan" - [527316]
"TOKYO, Japan" - [541281]
"TOKYO, Japan" - [598284]
"TOKYO, Japan" - [560637]
"TOKYO, Japan" - [546684]
"TOKYO, Japan" - [576558]
"JAKARTA, Indonesia" - [244097]
"JAKARTA, Indonesia" - [286973]
"JAKARTA, Indonesia" - [317604]
...

This is what we are trying to create:
"TOKYO, Japan"
"JAKARTA, Indonesia"
"New York (NY), United States"
...


I've made the code below more verbose than what I might normally write so that it is hopefully easier to read and understand.

You can download the code and text file here on GitHub.
*/

// parse out every 9th line from the provided text file
void setup() {
  // no size call since we're just working on a text file

  // load the file with the list of cities with lots of duplicates
  String[] dupCityList = loadStrings("MajorCities.txt"); 

  // Creating a new String array called newCityList to hold the de-duplicated list of cities. The length is determined by dividing by 9 because there are nine entries for every city. If we weren't sure about the source of the data we would need to add in a way to check every line and see if each city had already been added to the list or not.
  String[] newCityList = new String[dupCityList.length/9]; 

  // This is a counter to keep track of the array index number to be used when adding new cities to the newCityList array. 
  int cityIdx = 0; 

  // Create a for() loop to run through the list and grab every ninth line
  for (int i=0; i<dupCityList.length; i=i+9) { 

  	// Copy the row from the duplicates list to the new list
    newCityList[cityIdx] = dupCityList[i]; 

    // Add 1 to the index counter so that it is ready for the next trip through the loop
    cityIdx = cityIdx + 1; 
  }

  // Now we have a list (in the newCityList array) of unique cities but there is some extra junk around the end of each line.
  // It looks like this:
  /*
  "TOKYO, Japan" - [425083] 
  "JAKARTA, Indonesia" - [244097] 
  "New York (NY), United States" - [201521] 
  "SEOUL, South Korea" - [633312] 
  ...
  */
  // We want to get rid of the extra spacing and numbers at the end of the line

  // Cleaning out the excess numbers
  // Create a new for() loop to run through each city in the list
  for (int j = 0; j < newCityList.length; j++) { 
	
	// create a new String variable called 'trimmed' and put the city listed at position 'j' from the newCityList array
  	String trimmed = newCityList[j]; 

  	// Use indexOf() to find the position where the extraneous information begins  
  	int cutEnd =  trimmed.indexOf(" - ["); 

  	// Use substring() to select the beginning of the String (where the city name is), to the beginning of the extraneous stuff.  The variable trimmed now contains just the city name.
  	trimmed = trimmed.substring(0, cutEnd); 

  	// Last thing to do in the loop is put the edited string with just the city name back into the newCityList array.
  	newCityList[j] = trimmed; 
  }

  // All that's left to do is save the array newCityList to a new text file. You can call the file anything you'd like.
  saveStrings("NoDuplicatesList.txt", newCityList);
}

