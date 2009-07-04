// various javascrips functions


function clearRadioGroup(buttonGroup){
//function to clear a radio button group.
    for (i=0; i < buttonGroup.length; i++) {
        if (buttonGroup[i].checked == true) { // if a button in either group is checked,
            buttonGroup[i].checked = false;   // uncheck it
        }
    }
}

function showHelp(helpText) {
// function to show the helptip sidebox with the helptext content
    if (document.getElementById) {
        document.getElementById("sidebox_helptip").style.display = "block";
        document.getElementById("sidebox_helptip").innerHTML = helpText;
    }
}

function hideHelp() {
// function to hide the helptip sidebox
    if (document.getElementById) {
        document.getElementById("sidebox_helptip").style.display = "none";
    }
}

function hideFlashMessage() {
// function to hide flash success messages after 2.5 seconds
    if (document.getElementById("success_message")) {
        setTimeout("document.getElementById('success_message').style.display = 'none'", 2500);
    }
}
