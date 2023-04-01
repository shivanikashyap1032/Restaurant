console.log("JS is working fine");

function showContent(contentId) {
    // Hide all content elements
    var contents = document.getElementsByClassName("content");
    for (var i = 0; i < contents.length; i++) {
        contents[i].classList.add("coreToggle");
    }

    // Show the selected content element
    var content = document.getElementById(contentId);
    content.classList.remove("coreToggle");
}

function showAdminContent(contentId) {
    // Hide all content elements
    var contents = document.getElementsByClassName("adminContent");
    for (var i = 0; i < contents.length; i++) {
        contents[i].classList.add("coreToggle");
    }

    // Show the selected content element
    var content = document.getElementById(contentId);
    content.classList.remove("coreToggle");
}

  function enableButtons() {
    // select the buttons using their ids
    var profile = document.getElementById("profile");
    var orders = document.getElementById("orders");
    var logout = document.getElementById("logout");
    var bookings = document.getElementById("bookings");
    
    // remove the "disabled" attribute from each button
    profile.removeAttribute("disabled");
    orders.removeAttribute("disabled");
    logout.removeAttribute("disabled");
    bookings.removeAttribute("disabled");
  }
  
var prevBtnId = null;

function toggleMenu(btnName) {
    // remove active from all buttons
    var categoryBtns = document.getElementsByClassName('categoryBTns');
    for (var i = 0; i < categoryBtns.length; i++) {
        categoryBtns[i].classList.remove("active");
    }

    // add active to button that is clicked
    var categoryBtn = document.getElementById(btnName);
    categoryBtn.classList.add("active");

    // remove crossBtnClose from previously clicked button, if any
    if (prevBtnId) {
        var prevCrossBtn = document.getElementById('crossBtn' + prevBtnId);
        prevCrossBtn.classList.add('crossBtnClose');
    }

    // getting card id
    var categoryName = categoryBtn.id.substr(3);
    var categoryCard = document.getElementById('id' + categoryName);

    var crossBtn = document.getElementById('crossBtn' + categoryName);
    crossBtn.classList.remove('crossBtnClose');

    // adding hide class to all cards except the cardname extracted
    var cards = document.getElementsByClassName('myCard1');
    for (i = 0; i < cards.length; i++) {
        let card = cards[i];
        if (card.id !== 'id' + categoryName) {
            card.classList.add('myCardHide');
        } else {
            card.classList.remove('myCardHide');
        }
    }

    prevBtnId = categoryName;
}

function toggleCrossBtn(crossBtnName, event) {
    event.stopPropagation();
    var crossBtn = document.getElementById(crossBtnName);
    crossBtn.classList.add('crossBtnClose');
    var categoryName = crossBtnName.substr(8);
    var categoryBtn = document.getElementById('btn' + categoryName);
    categoryBtn.classList.remove("active");
    var cards = document.getElementsByClassName('myCard1');
    for (i = 0; i < cards.length; i++) {
        let card = cards[i];
        card.classList.remove("myCardHide");
    }

    prevBtnId = null; // reset prevBtnId since cross button is removed
}


//adding time in fromtime and totime
function updateTimes() {
  var dateField = document.getElementById("date");
  var fromField = document.getElementById("timeFrom");
  var toField = document.getElementById("timeTo");

  var selectedDate = new Date(dateField.value);
  var today = new Date();
  var currentHour = today.getHours();

  var hours = [];
  if (selectedDate.getDate() == today.getDate()) {
    // if today is selected, start from the next hour
    for (var i = currentHour + 1; i <= 23; i++) 
    {
    	if(i !== 16 && i !== 17 )
    	{
      		hours.push(getFormattedTime(i));
    	}
    }
  } else {
    // if a future date is selected, show all hours from 10am to 10pm
    for (var i = 10; i <= 23; i++) {
    	if(i !== 16 && i !== 17 )
    	{
    		 hours.push(getFormattedTime(i));
    	}
    }
  }

  // update the "from" field with the available hours
  fromField.innerHTML = '';
  for (var i = 0; i < hours.length; i++)
  {
    var option = document.createElement("option");
    if(!hours[i].match("3:00 pm") && !hours[i].match("11:00 pm"))
    {
    	 option.value = hours[i];
    	 option.text = hours[i];
    	 fromField.add(option);
    }
  }

  // update the "to" field with the available hours after the selected "from" time
  toField.innerHTML = '';
  var selectedIndex = fromField.selectedIndex;
  if (selectedIndex >= 0) 
  {
    for (var i = selectedIndex + 1; i < hours.length; i++) 
    {
    	if(!hours[i].match("10:00 am") && !hours[i].match("6:00 pm"))
    	{
    		var option = document.createElement("option");
     	 	option.value = hours[i];
     		option.text = hours[i];
     		toField.add(option);
    	}
    }
  }
}

function getFormattedTime(hour) {
  var ampm = hour >= 12 ? 'pm' : 'am';
  hour = hour % 12;
  hour = hour ? hour : 12; // convert 0 to 12
  return hour + ':00 ' + ampm;
}

//checking user is logged in or not for bookings  
//and also checking the to time must not lesser then the from time
function validateTime() {
	  var fromTime = document.getElementById("timeFrom").value;
	  var toTime = document.getElementById("timeTo").value;
	  var userBookings = document.getElementById("userBookings").value;
	  var fromTimeObj = new Date("2000-01-01 " + fromTime);
	  var toTimeObj = new Date("2000-01-01 " + toTime);

	  if (userBookings < 1) {
	    alert("Please log in to book a table.");
	    return false; // prevent form submission
	  }
	  	
	  if (toTimeObj <= fromTimeObj) {
		    alert("To time cannot be less or equal to from time!");
		    return false; // prevent form submission
	  }
	console.log("returning true")
	  return true; // allow form submission
	}

//open drop down for orders and bookings
function openDropdown(divId){
	var dro = document.getElementById(divId+"drop-downContent");
	  if (dro.style.display === "block") {
    dro.style.display = "none";
  } else {
    dro.style.display = "block";
  }
}

//Check user logged in before ordering
function validateUser(){
	var userId = document.getElementById("userIdMenu")
	if(userId.value < 1)
	{
		alert("Please log in first");
		return false;
	}
	else
	{
		return true;
	}
}

//search funcionality
function searchSubCategory(e){
	let input = e;
	console.log(input);
	let subcategory = document.querySelectorAll(".searchedInput");
	console.log(subcategory);
	subcategory.value = e;
}

//function to slider
var img1 = document.getElementById("img1");
var img2 = document.getElementById("img2");
var img3 = document.getElementById("img3");
 let moveImg = () => {
    img1.classList.add("givePriority");
    img2.classList.add("givePriority");
    img1.style.left = "-100%";
    img2.style.left = "0%";
    img3.style.left = "100%";
    setTimeout(() => {
        img1.classList.remove("givePriority");
        img2.classList.remove("givePriority");
        img1.style.left = "100%";
        img2.style.left = "-100%";
        img3.style.left = "0%";
    }, 3000);
    setTimeout(() => {
        img1.classList.add("givePriority");
        img1.style.left = "0%";
        img2.style.left = "100%";
        img3.style.left = "-100%";
    }, 6000);
}

setInterval(() => {
    moveImg();
}, 9000);

//refresh the cart
function refreshCart(){
	localStorage.setItem('refreshCart', 'true');
}