/*============================================================================

Stephen Boyd, March 25, 2014
@sspboyd
blog.sspboyd.ca/

----------------------------

This is an example project written in Processing to show how to do some simple 
parsing and cleaning of a text file, and then saving out the result.

See the blog post for more information:
http://blog.sspboyd.ca/

============================================================================*/


// This program only uses the setup() function because we are not drawing 
// anything to the screen. We're just going to work on some text from a file 
// and save it back out to the hard drive.
void setup() {

  // No size() call since we're just working on a text file.

  // The file we are about to load into the program is called MajorCities.txt 
  // and has 9000 lines. Each city is listed 9 times in a row. Each line 
  // looks something like this...
  // "TOKYO, Japan" - [425083]
  
  // Load the file with the list of cities with lots of duplicates.
  String[] dupCityList = loadStrings("MajorCities.txt"); 

  // Creating a new String array called newCityList to hold the de-duplicated 
  // list of cities. The length is determined by dividing by 9 because there 
  // are nine entries for every city. If we weren't sure about the source of 
  // the data we would need to add in a way to check every line and see if 
  // each city had already been added to the list or not.
  String[] newCityList = new String[dupCityList.length/9]; 

  // This is a counter to keep track of the array index number to be used 
  // when adding new cities to the newCityList array. 
  int cityIdx = 0; 

  // Create a for() loop to run through the list and grab every ninth line
  for (int i=0; i<dupCityList.length; i=i+9) { 

  	// Copy the row from the duplicates list to the new list
    newCityList[cityIdx] = dupCityList[i]; 

    // Add 1 to the index counter so that it is ready for the next trip 
    // through the loop
    cityIdx = cityIdx + 1; 
  }

  // Now we have a list (in the newCityList array) of unique cities but there 
  // is some extra junk around the end of each line.
  // It looks like this:
  /*
  "TOKYO, Japan" - [425083] 
  "JAKARTA, Indonesia" - [244097] 
  "New York (NY), United States" - [201521] 
  "SEOUL, South Korea" - [633312] 
  ...
  */
  // Now, we want to get rid of the extra spacing and numbers at the end of 
  // each line

  // Cleaning out the excess numbers
  // Create a new for() loop to run through each city in the list
  for (int j = 0; j < newCityList.length; j++) { 
	
	// create a new String variable called 'trimmed' and put the city 
	// listed at position 'j' from the newCityList array
  	String trimmed = newCityList[j]; 

  	// Use indexOf() to find the position where the extraneous 
  	// information begins  
  	int cutEnd =  trimmed.indexOf(" - ["); 

  	// Use substring() to select the beginning of the String (where the city 
  	// name is), to the beginning of the extraneous stuff.  The variable 
  	// trimmed now contains just the city name.
  	trimmed = trimmed.substring(0, cutEnd); 

  	// Last thing to do in the loop is put the edited string with just the 
  	// city name back into the newCityList array.
  	newCityList[j] = trimmed; 
  }

  // All that's left to do is save the array newCityList to a new text file. You 
  // can call the file anything you'd like.
  saveStrings("NoDuplicatesList.txt", newCityList);
}
