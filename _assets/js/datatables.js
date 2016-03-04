//= require 'vendor/jquery-2.1.4.min'
//= require 'vendor/bootstrap.min'
//= require 'vendor/jquery.dataTables.min'
//= require 'vendor/dataTables.bootstrap4.min'
//= require 'vendor/moment.min'
//= require 'vendor/dataTables.plugins.datetime_moment'

$(document).ready(function() {
    $('#people-db').DataTable({
        "columnDefs": [
            { "orderable": false, "targets": 5 } // column 'Topics' should not be sortable
        ],
        "lengthMenu": [ [5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
        "pageLength": 10,
        "language": {
            "lengthMenu": "Display _MENU_ people"
        }
    });

    $('#stats-institutes').DataTable({
        "info": false,
        "paging": false,
        "searching": false,
        "columns": [
            null,
            {"type": "num"},
            {"type": "num"},
            {"type": "num"}
        ]
    });

    $.fn.dataTable.moment('DD MMM YYYY');
    $('#visits-db').DataTable({
        "lengthMenu": [ [5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
        "pageLength": 25,
        "language": {
            "lengthMenu": "Display _MENU_ visits"
        }
    });
});
