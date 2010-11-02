/** ================== jQuery javascript functions ================== **/


/** ============ Top login box panel ============ **/

// hide the login panel
function hidelogin() {
    $("#login-panel").slideUp(200);
    $("#login-link").css("-moz-border-radius","0 0 7px 7px");
    $("#login-link").css("-webkit-border-radius","0 0 7px 7px");
    $("#login-link").css("-khtml-border-radius","0 0 7px 7px");
}

// manage events to show or hide the login panel
$(function(){
    $("#login-link").click(function(){
    if ($("#login-panel").is(':hidden')){
        $("#login-panel").slideDown(200);
        $("#login-link").css("padding-bottom","6px");
        $("#login-link").css("-moz-border-radius","0");
        $("#login-link").css("-webkit-border-radius","0");
        $("#login-link").css("-khtml-border-radius","0");
    }
    else{
        hidelogin();
    }
    return false;
    });
    $('#login-panel').click(function(e){
        e.stopPropagation();
    });
    $(document).click(function(){
        hidelogin();
    });
    $(document).keydown(function(e){
        if (e.keyCode == 27){
            hidelogin();
        }
    });
});


/** ============ Top flash messages ============ **/

// hide flash messages on close for all or with delay except for error messages
$(function(){
    // slide up #success_message" and #notice_message messages after 3 seconds
    $("#success_message").delay(3000).slideUp(250);
    $("#notice_message").delay(3000).slideUp(250);
    // slide up #warning_message" and #notice_message messages after 10 seconds
    $("#warning_message").delay(10000).slideUp(250);
    // slide up messages if closed
    $("div a.close_message").click(function(){
        //stop is used to remove the delay if there is one
        $(this).parent().stop().slideUp(250);
    });
});


/** ============ Date picker ============ **/

// set the jqueryUI date picker defaults
$.datepicker.setDefaults({
    dateFormat: "dd/mm/yy",
    yearRange: 'c-15:c+15',
    maxDate: '+0D',
    changeYear: true,
    showOtherMonths: true,
    selectOtherMonths: true
});


// display a date picker for date fields
$(function() {
    $("#birth_date").datepicker();
    $("#start_date").datepicker();
    $("#end_date").datepicker();
});
