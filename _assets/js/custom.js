$(document).ready(function() {
    function reverse(value) {
        return value.split("").reverse().join("");
    }

    // make those obfuscated email links clickable
    $('a.email-obfuscated').each(function() {
        var email = $(this).data('email');
        $(this).attr('href', 'mailto:' + reverse(email));
    });

    // from http://stackoverflow.com/a/20469901/588243
    $.extend({
        replaceTag: function (currentElem, newTagObj, keepProps) {
            var $currentElem = $(currentElem);
            var i, $newTag = $(newTagObj).clone();
            if (keepProps) {
                newTag = $newTag[0];
                newTag.className = currentElem.className;
                $.extend(newTag.classList, currentElem.classList);
                $.extend(newTag.attributes, currentElem.attributes);
            }
            $currentElem.wrapAll($newTag);
            $currentElem.contents().unwrap();
            return this;
        }
    });
    $.fn.extend({
        replaceTag: function (newTagObj, keepProps) {
            return this.each(function() {
                jQuery.replaceTag(this, newTagObj, keepProps);
            });
        }
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

    $('#people-db').DataTable({
        "columnDefs": [
            { "orderable": false, "targets": 3 } // column 'Topics' should not be sortable
        ],
        "lengthMenu": [ [5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
        "pageLength": 25,
        "language": {
            "lengthMenu": "Display _MENU_ people"
        }
    });
});
