/** ================== jQuery javascript functions ================== **/


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
    $("#last_fee_date").datepicker();
});


/** ============== Forms =============== **/

// add collapsible fielsets
// .collapsible and .collapsed classes must
// be set on fieldsets elements

$(function() {
    $(".collapsed").children().not("legend").hide();
    $("legend").click(function(){
        $(this).parent(".collapsed").children().not("legend").slideToggle(300);
        $(this).parent(".collapsed").toggleClass("collapsible");
    });
});


