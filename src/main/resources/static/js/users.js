/**
 * 
 */

function validateUserForm() {
	var username = document.getElementById('username');
	var studentId = document.getElementById('student_id');
	var password = document.getElementById('password');
	var firstName = document.getElementById('firstName');
	var lastName = document.getElementById('lastName');
	var email = document.getElementById('email');
	var phoneNumber = document.getElementById('phoneNumber');
	var roles = document.getElementById('roles');

	var passwordRegex = /^[a-zA-Z0-9]+$/;
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	var phoneNumberRegex = /^\d{10}$/;

	var isValid = true;

	if (!username.value.trim()) {
		isValid = false;
		alert('Username is required.');
		username.focus();
		return isValid;
	}

	if (!password.value.trim()) {
		isValid = false;
		alert('Password is required.');
		password.focus();
		return isValid;
	} else if (!passwordRegex.test(password.value.trim())) {
		isValid = false;
		alert('Password should contain only letters and numbers.');
		password.focus();
		return isValid;
	}
	var nameregex = /^[A-Za-z]+$/;
	if (!firstName.value.trim()) {
		isValid = false;
		alert('First Name is required.');
		firstName.focus();
		return isValid;
	}else if (!nameregex.test(firstName.value.trim())) {
        isValid = false;
        alert('First Name should contain only letters.');
        firstName.focus();
        return isValid;
    }


	if (!lastName.value.trim()) {
		isValid = false;
		alert('Last Name is required.');
		lastName.focus();
		return isValid;
	}else if (!nameregex.test(lastName.value.trim())) {
        isValid = false;
        alert('Last Name should contain only letters.');
        firstName.focus();
        return isValid;
    }

	if (!email.value.trim()) {
		isValid = false;
		alert('Email is required.');
		email.focus();
		return isValid;
	} else if (!emailRegex.test(email.value.trim())) {
		isValid = false;
		alert('Please enter a valid email address.');
		email.focus();
		return isValid;
	}

	if (!phoneNumber.value.trim()) {
		isValid = false;
		alert('Phone Number is required.');
		phoneNumber.focus();
		return isValid;
	} else if (!phoneNumberRegex.test(phoneNumber.value.trim())) {
		isValid = false;
		alert('Phone Number should be a 10-digit number without space.');
		phoneNumber.focus();
		return isValid;
	}

	if (!roles.value.trim()) {
		isValid = false;
		alert('Please select a Role.');
		roles.focus();
		return isValid;
	}

	return isValid;
}

$(document).ready(function() {

	// user CREATE Form Handler

	$('#userCreateForm').submit(function(event) {
		event.preventDefault();

		if (validateUserForm()) {
			var formData = $(this).serialize();

			$.ajax({
				url: window.location.origin + '/users',
				type: 'POST',
				data: formData,
				success: function(response) {
					alert('User created Successfully');
					$('#userCreateForm')[0].reset();
				},
				error: function(xhr, status, error) {
					if (status === 409) {
						alert('username or student_id are dublicate');
					}
				}
			});
		} else {
			alert('Form validation failed');
		}
	});




	// user UPDATE Form Handler

	$('#userUpdateForm').submit(function(event) {
		event.preventDefault();

		if (validateUserForm()) {
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

	//DELETE Handler

	$('.btn-del-user').click(function() {
		var userId = $(this).attr('del-user-id');

		if (confirm('Are you sure you want to delete this user?')) {
			$.ajax({
				url: window.location.origin + '/user/' + userId,
				type: 'DELETE',
				success: function() {
					alert('user deleted successfully');
					$(`#user-row-id-${userId}`).remove();
				},
				error: function(xhr, status, error) {
					if(status === 404){
						alert("User not found");
					}else{
						alert("User not deletable !")
					}
				}
			});
		}
	});
});
