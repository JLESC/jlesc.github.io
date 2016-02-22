//= require 'vendor/jquery-2.1.4.min'

var reverse = function (value) {
    return value.split("").reverse().join("");
};

var toggle_meta_aside = function(desired_state) {
    if (desired_state == 'show' && $('#meta-aside', document).hasClass('invisible')) {
        // make aside meta visible again
        $('#show-meta-aside-wrapper', document).addClass('invisible');
        $('#meta-aside', document).removeClass('invisible').addClass('in');
        $('article > div.content', document).addClass('col-lg-7').removeClass('col-lg-12');
    } else if (desired_state == 'hide' && !$('#meta-aside', document).hasClass('invisible')) {
        // make aside meta invisible
        $('#show-meta-aside-wrapper', document).removeClass('invisible');
        $('#meta-aside', document).addClass('invisible').removeClass('in');
        $('article > div.content', document).removeClass('col-lg-7').addClass('col-lg-12');
    }
};

