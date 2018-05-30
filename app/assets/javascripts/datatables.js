$(document).ready(function () {
  $('#admin-tags-table').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#admin-tags-table').data('source'),
      "type": "GET",
      "complete": function() {
        console.log("dataTable loaded.");
      }
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "edit", "sortable": false},
      {"data": "name"},
      {"data": "description"},
      {"data": "variety"},
      {"data": "icon", "sortable": false},
      {"data": "delete", "sortable": false}
    ]
  });
});
