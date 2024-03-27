/**
 * 
 */
 
  $(document).ready(function () {
       

        // Function to validate password contains only letters and numbers
        function validatePassword(password) {
            // Regular expression for password validation (letters and numbers only)
            var passwordRegex = /^[a-zA-Z0-9]+$/;
            return passwordRegex.test(password);
        }

        // Function to perform form validation
        function validateUserSetting() {
            var oldpassword = $("#oldpassword").val();
            var password = $("#password").val();

         
            // Check if Old password is not empty and contains only letters and numbers
            if (oldpassword === "") {
                alert("Please enter your old password.");
                return false;
            } else if (!validatePassword(oldpassword)) {
                alert("old password should contain only letters and numbers.");
                return false;
            }

            // Check if password is not empty and contains only letters and numbers
            if (password === "") {
                alert("Please enter your password.");
                return false;
            } else if (!validatePassword(password)) {
                alert("Password should contain only letters and numbers.");
                return false;
            }

            // If all validations pass, return true
            return true;
        }

        // Handle form submission
        $("#userSettingsForm").submit(function (event) {
            event.preventDefault(); // Prevent default form submission

            // Perform form validation
            if (validateUserSetting()) {
                var formData = {
                    oldpassword: $("#oldpassword").val(),
                    password: $("#password").val()
                };

                $.ajax({
                    type: "PATCH",
                    url: document.location.origin + "/updateUserSettings", //?oldpassword="+formData.oldpassword+"&"+"password="+formData.password, 
                    data: formData,
                    success: function (response) {
                        alert(response);
                    },
                    error: function (xhr, status, error) {
                        alert(xhr.responseText); 
                    }
                });
            }
        });
    });