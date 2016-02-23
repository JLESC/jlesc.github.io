//= require 'vendor/jquery-2.1.4.min'

var reverse = function (value) {
    return value.split("").reverse().join("");
};

var toggle_meta_aside = function(desired_state) {
    var meta_aside = $('#meta-aside');

    if (desired_state === 'show' && meta_aside.hasClass('invisible')) {
        // make aside meta visible again
        $('#show-meta-aside').addClass('invisible');
        meta_aside.removeClass('invisible').addClass('in');
        $('article div#main-content').addClass('col-lg-7').removeClass('col-lg-12');

    } else if (desired_state === 'hide' && !meta_aside.hasClass('invisible')) {
        // make aside meta invisible
        $('#show-meta-aside').removeClass('invisible');
        meta_aside.addClass('invisible').removeClass('in');
        $('article div#main-content').removeClass('col-lg-7').addClass('col-lg-12');
    }
};

