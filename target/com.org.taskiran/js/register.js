
var ajaxRequest;

$('form').on('submit', function(form) {
    form.preventDefault();

    var username = $('#usernameRegisterInput').val();
    var password = $('#passwordRegisterInput').val();
    var email =    $('#emailRegisterInput').val();
    var lastName = $('#lastNameRegisterInput').val();
    var firstName = $('#firstNameRegisterInput').val();


    if (username != "" && password != "" && email != "") {

        var uri = "/registration";
        var json = {
            "username": username,
            "password": password,
            "email": email,
            "firstName":firstName,
            "lastName":lastName };

        console.log("gönderiliyor");

        ajaxRequest = $.ajax({
            url: uri,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(json)
        });

        /* Alert the user when finished without error */
        ajaxRequest.done(function (response, textStatus, jqXHR){
            console.log(response);

            var message = "";
            if (response.result) {
               message = "Başarıyla kaydınız alındı.";
                alert(message);
                window.location.href = "../login.jsp";
            } else {
                alert(message);
                message = "Lütfen başka bir kullanıcı adı veya mail giriniz.";
            }
            console.log("done");
            console.log(response);

        });

        /* If the call fails  */
        ajaxRequest.fail(function (jqXHR, textStatus, errorThrown){
            console.log("fail");

            // Log the error
            console.error(
                "The following error occurred: "+
                textStatus, errorThrown
            );
        });

        $('#exampleInputTitle').val('');
        $('#exampleInputMessage').val('');
    }


});

$("#login").click(function(){
// similar behavior as clicking on a link
    window.location.href = "../login.jsp";
});
