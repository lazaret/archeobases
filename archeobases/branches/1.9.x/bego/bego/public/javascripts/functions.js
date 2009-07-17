
/** ======================== jQuery plugins ======================== **/

/**
 * jQuery Delay - A delay function
 * Copyright (c) 2009 Clint Helfers - chelfers(at)gmail(dot)com | http://blindsignals.com
 * Dual licensed under MIT and GPL.
 * Date: 7/01/2009
 * @author Clint Helfers
 * @version 1.0.0
 *
 * http://blindsignals.com/index.php/2009/07/jquery-delay/
 */

$.fn.delay = function(time, name) {
    return this.queue((name || "fx"), function(){
        var self = this;
        setTimeout(function(){$.dequeue(self);}, time);
    });
};


/** ================== jQuery javascript functions ================== **/

// fade out the #success_flash messages after 3 seconds
$(function(){
    $("#success_message").delay(1800).fadeOut(800).slideUp(200);
});


// function to show/hide the helptip sidebox with the helptext content
$(function(){
    $(".helptip_button img").hover(
        function () {
            helptip = $(this).attr("alt");
            $("#sidebox_helptip").html(helptip);
            $("#sidebox_helptip").slideDown(200);
        },
        function () {
            $("#sidebox_helptip").slideUp(200);
        }
    );
});


// auto-align the label, the input and the .error_messages in forms by fieldset
$(function() {
    maxi = 0
    $("fieldset").each(function() {
        $(this).find("label").each(function() {
            width = $(this).width()
            if (width > maxi) {
                maxi = width
            }
        });
        $(this).find("label").width(maxi);
        $(this).find("#error-message").css("margin-left", maxi);
        maxi = 0
    });
});


// remove the .error style on clicked form inputs
$(function() {
    $(".error").click(function(){
        $(this).removeClass("error");
    });
});


// mouse clic on radio button uncheck it if is checked
$(function() {
    $("input:radio").mousedown(function() {
        this.is_checked = this.checked;
    }).click(function() {
        if (this.is_checked) {
            this.checked = false;
        }
    });
});
