// char_counter.js
// ---------------
// Counts the number of characters entered in the micropost textarea so the
// user knows how close they are to the 140 character limit.
//
// Author:  Adam Toda

/* GLOBAL VARIABLES */

var TEXTFIELD_ID = "micropost_content";
var MAX_CHAR = 140;
var COUNTER_ID = "charCounter";
var SAFE_COLOR = "black";
var WARNING_COLOR = "orange";
var DANGER_COLOR = "red";

function UpdateCounter(textfieldID) {
    textfield = getObject(textfieldID);
    counter = getObject(COUNTER_ID);
    updatedCount = MAX_CHAR - textfield.value.length;

    // Updates the Counter
    counter.innerHTML = updatedCount.toString();
    
    // Changes the color of the text
    // More than 30 chars
    if (updatedCount > 30) {
	counter.style.color = SAFE_COLOR;

    // Between 30 and 10 chars
    } else if (updatedCount <= 30 && updatedCount > 10) {
	counter.style.color = WARNING_COLOR;

    // 10 or Fewer Chars
    } else if (updatedCount <= 10) {
	counter.style.color = DANGER_COLOR;
    }
}

function CheckCharCount() {
    charCount = getObject(textfield).value.length;
    alert("am I getting called?");

    if (charCount > 140) {
	alert("Your post is too long!  The limit is 140 characters");
	return false;
    } else if (charCount == 0) {
	alert("Please enter some content for your post and try again");
	return false;
    } else {
	return true;
    }
}

function getObject(id) {
    return document.getElementById(id);
}