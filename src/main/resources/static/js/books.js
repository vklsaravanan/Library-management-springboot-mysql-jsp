/**
 * 
 */

$(document).ready(function() {
	
	// book CREATE Form Handler

	$('#bookCreateForm').submit(function(event) {
		event.preventDefault();

		if (validateBookForm()) {
			var formData = $(this).serialize();

			var bookId = $(this).attr('book-id');

			$.ajax({
				url: window.location.origin + '/books',
				type: 'POST',
				data: formData,
				success: function(response) {
					alert('Book created Successfully', response);
					$('#bookCreateForm')[0].reset();
				},
				error: function(xhr, status, error) {
					alert('Error in creating book', error);
				}
			});
		} else {
			alert('Form validation failed');
		}
	});

	//DELETE Handler

	$('.btn-del-book').click(function() {
		var bookId = $(this).attr('del-book-id');

		if (confirm('Are you sure you want to delete this book?')) {
			$.ajax({
				url: window.location.origin + '/book/' + bookId,
				type: 'DELETE',
				success: function(response) {
					alert('Book deleted successfully');
					$(`#book-row-id-${bookId}`).remove();
				},
				error: function(xhr, status, error) {
					alert('Error deleting book ' + error);
				}
			});
		}
	});



	// book UPDATE Form Handler

	$('#bookUpdateForm').submit(function(event) {
		event.preventDefault();

		if (validateBookForm()) {
			var formData = $(this).serialize();

			var bookId = $(this).attr('book-id');

			$.ajax({
				url: window.location.origin + '/book/' + bookId,
				type: 'PATCH',
				data: formData,
				success: function(response) {
					alert('Success:', response);
					window.location.href = window.location.origin + "/book/" + bookId;
				},
				error: function(xhr, status, error) {
					alert('Error:', error);
				}
			});
		} else {
			alert('Form validation failed');
		}
	});
});

function validateBookForm() {
    var title = document.getElementById("title").value;
    var author = document.getElementById("author").value;
    var isbn = document.getElementById("isbn").value;
    var year = document.getElementById("year").value;
    var genre = document.getElementById("genre").value;
    var avl_count = document.getElementById("avl_count").value;

    if (title.trim() === "") {
        alert("Title cannot be empty");
        return false;
    }

    if (author.trim() === "") {
        alert("Author cannot be empty");
        return false;
    }

    if (isbn.trim() === "") {
        alert("ISBN cannot be empty");
        return false;
    }

    var currentYear = new Date().getFullYear();
    if (year < 1900 || year > currentYear) {
        alert("Year must be between 1900 to " + currentYear);
        return false;
    }

    if (genre === "") {
        alert("Please select a genre");
        return false;
    }

    if (avl_count.trim() === "") {
        alert("Available Count cannot be empty");
        return false;
    }
    return true;
}