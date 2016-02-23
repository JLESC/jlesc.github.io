//= require 'vendor/jquery-2.1.4.min'

//= require 'vendor/tether.min'
//= require 'vendor/bootstrap.min'

//= require 'vendor/featherlight.min'

//= require 'functions'
//= require 'github_widget'
//= require 'datatables'


$(document).ready(function() {
    // activate tooltips
    $('[data-toggle="tooltip"]').tooltip();

    // make those obfuscated email links clickable
    $('a.email-obfuscated').each(function() {
        $(this).attr('href', 'mailto:' + reverse($(this).data('email')));
    });

    //
    // Beautify Ref Lists
    //
    $('ol.bibliography').each(function() {
        $(this).addClass('list-group');
        $(this).find('li').each(function() {
            $(this).addClass('list-group-item');
            $(this).find('.bibtex-entry-container').addClass('container-fluid')
                .find('>div').addClass('row')
                .find('.bibtex-ref-meta').removeClass('hidden');
            $(this).find('.bibtex-ref-entry').addClass('col-md-9 col-sm-12');
        });
    });

    $('#project-categories-accordion').find('.collapse').each(function() {
       $(this).collapse('hide');
    });

    $('#hide-meta-aside').click(function() {
        toggle_meta_aside('hide')
    });

    $('#show-meta-aside').click(function() {
        toggle_meta_aside('show')
    });

    $('#schedule-accordion').each(function() {
        $('.collapse').collapse('hide');
        toggle_meta_aside('hide');
    });
});
