Parse_Out_Duplicate_City_Names
==============================

This is an example project written in Processing to show how to parse and clean a text file, then save out the result.

Since teaching a class on Processing this past Saturday I've realized that a few code examples of using Processing for some straightforward tasks might be helpful to people getting started with the Processing language and programming in general. 

This example came out of a problem I had at work where I needed to generate a clean list of names from a text file where each name was listed nine times with some unnecessary.

The code below goes through the following steps to create a list of clean city names from an original list where each name had been duplicated nine times.

The steps involved are:  
1. Read in a text file from your local hard drive.  
2. Create a new array by selecting every ninth line.  
3. Clean out some extraneous information at the end of each city name.  
4. Save the cleaned version back out to a file on your hard drive.  

I've added comments for each line which will hopefully provide enough information about how the program works. 

The file being used in the example is 9000 lines of city names. Each city name is repeated nine times with some random
extraneous data included at the end of each line.

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


I've made the code more verbose than what I might normally write so that it is hopefully easier to read and understand.
