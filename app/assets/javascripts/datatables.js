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
      {"data": "name"},
      {"data": "description"},
      {"data": "variety"},
      {"data": "icon", "sortable": false},
      {"data": "actions", "sortable": false, "className": "nowrap"}
    ]
  });

  $('#admin-ingredients-table').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#admin-ingredients-table').data('source'),
      "type": "GET",
      "complete": function() {
        console.log("dataTable loaded.");
      }
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "name"},
      {"data": "normalized_name"},
      {"data": "tags", "sortable": false},
      {"data": "actions", "sortable": false, "className": "nowrap"}
    ]
  });

  $('#admin-users-table').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#admin-users-table').data('source'),
      "type": "GET",
      "complete": function() {
        console.log("dataTable loaded.");
      }
    },
    "pagingType": "full_numbers",
    "order": [[ 4, "desc" ]],
    "columns": [
      {"data": "user_name"},
      {"data": "email"},
      {"data": "level"},
      {"data": "approved"},
      {"data": "editor"},
      {"data": "admin"},
      {"data": "actions", "sortable": false, "className": "nowrap"}
    ]
  });
});
