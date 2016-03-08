$(document).ready(function () {
	jQuery('#ingredients-index-table').DataTable({
		"order": [[ 1, "asc" ]],
		columns: [
      { orderable: false },
      {},
      {},

  	]
	  // responsive: true
	});
	jQuery('#admin-ingredients-index-table').DataTable({
		"order": [[ 1, "asc" ]],
		columns: [
      { orderable: false },
      {},
      {},
      { orderable: false },
      { orderable: false }
  	]
	  // responsive: true
	});
});
