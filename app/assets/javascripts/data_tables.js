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
		"order": [[3, 'asc'],[ 1, "asc" ]],
		columns: [
      { orderable: false },
      {},
      {},
      {},
      { orderable: false },
      { orderable: false }
  	]
	  // responsive: true
	});
	jQuery('#admin-restaurant-food-index-table').DataTable({
		"order": [[3, 'asc'],[ 1, "asc" ]],
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
