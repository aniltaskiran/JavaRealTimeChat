
var ajaxRequest;

$('form').on('submit', function(form) {
    form.preventDefault();

    var password = $('#passwordRegisterInput').val();
    var email =    $('#emailRegisterInput').val();
    var fullName = $('#fullNameRegisterInput').val();

    console.log(fullName);
    if (fullName != "" && password != "" && email != "") {

        var uri = "/registration";
        var json = {
            "password": "password",
            "email": "email",
            "fullName":"fullName"};

        console.log("gönderiliyor");
        console.log(json);
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
                // window.location.href = "../oldlogin.jsp";
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
