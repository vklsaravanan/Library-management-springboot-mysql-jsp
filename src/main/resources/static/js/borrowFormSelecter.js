/**
 * 
 */

function validateUserBookForm() {

	return true;
}

$(document).ready(function() {
	//selector

	$('#studentSelect').bsSelect();
	$('#bookSelect').bsSelect();

// book CREATE Form Handler

	$('#libraryHistoryCreateForm').submit(function(event) {
		event.preventDefault();

		if (validateUserBookForm()) {
			var formData = $(this).serialize();

			var bookId = $(this).attr('book-id');

			$.ajax({
				url: window.location.origin + '/bookUserHistory',
				type: 'POST',
				data: formData,
				success: function(response) {
					alert(response);
					$('#libraryHistoryCreateForm')[0].reset();
				},
				error: function(xhr, status, error) {
					alert(error + xhr.responseText);
				}
			});
		} else {
			alert('Form validation failed');
		}
	});



	// user UPDATE Form Handler

	$('#userBookHsdistory').submit(function(event) {
		event.preventDefault();

		if (validateUserBookForm()) {
			var formData = $(this).serialize();

			var userId = $(this).attr('user-id');

			$.ajax({
				url: window.location.origin + '/user/' + userId,
				type: 'PATCH',
				data: formData,
				success: function(response) {
					alert("User updated Successfully");
					window.location.href = window.location.origin + "/admin/user/" + userId;
				},
				error: function(xhr, status, error) {
					alert("User not able to update");
				}
			});
		} else {
			alert('Form validation failed');
		}
	});

});
