<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<!-- Materialize CSS -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

</head>

<body style="background: url(img/img.jpg); background-size: cover; background-attachment: fixed;">

<div class="container">
    <div class="row">
        <div class="col m6 offset-m3">

            <div class="card" style="border-radius: 10px;">
                <div class="card-content">

                    <h3 class="center-align">Register Here !!</h3>

                    <div class="form center-align">

                        <form id="myform">

                            <input type="text" name="user_name" placeholder="Enter user name" required />
                            <input type="password" name="user_password" placeholder="Enter user password" required />
                            <input type="email" name="user_email" placeholder="Enter user email" required />

                            <button type="submit" class="btn blue">Submit</button>

                        </form>

                    </div>

                    <div class="loader center-align" style="display: none;">
                        <div class="progress">
                            <div class="indeterminate"></div>
                        </div>
                        <h5>Please wait...</h5>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<!-- jQuery FIRST -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Materialize JS AFTER jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<!-- Custom Script -->
<script>
$(document).ready(function(){

    console.log("Page loaded...");

    $("#myform").submit(function(event){
        event.preventDefault();

        $(".loader").show();

        var formData = $(this).serialize();
        console.log(formData);

        $.ajax({
            url: "<%= request.getContextPath() %>/signup",
            type: "POST",
            data: formData,

            success: function(response){
                $(".loader").hide();
                alert("User Registered Successfully!");
                console.log(response);
                $("#myform")[0].reset();
            },

            error: function(){
                $(".loader").hide();
                alert("Something went wrong!");
            }
        });

    });

});
</script>

</body>
</html>