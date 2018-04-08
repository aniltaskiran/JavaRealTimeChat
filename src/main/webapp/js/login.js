
// var ajaxRequest;
//
// $('form').on('submit', function(form) {
//     form.preventDefault();
//
//     var username = $('#usernameInput').val();
//     var password = $('#passwordInput').val();
//
//     if (username != "" && password != "") {
//
//         var uri = "/login";
//         var json = {"username": username, "password": password};
//             console.log("gönderiliyor");
//
//         ajaxRequest = $.ajax({
//             url: uri,
//             type: "POST",
//             contentType: "application/json; charset=utf-8",
//             dataType: "json",
//             data: JSON.stringify(json)
//         });
//
//         /* Alert the user when finished without error */
//         ajaxRequest.done(function (response, textStatus, jqXHR){
//             console.log(response);
//
//             var message = "";
//             if (response.result) {
//                if (response.id == "null") {
//                    message = "Lütfen tekrar deneyiniz.";
//                } else {
//                    message = "Başarıyla giriş yapıldı.";
//                }
//             } else {
//                 message = "Şu anda hizmet veremiyoruz.";
//             }
//             console.log("done");
//             console.log(response);
//             alert(message);
//         });
//
//         /* If the call fails  */
//         ajaxRequest.fail(function (jqXHR, textStatus, errorThrown){
//             console.log("fail");
//
//             // Log the error
//             console.error(
//                 "The following error occurred: "+
//                 textStatus, errorThrown
//             );
//         });
//
//         $('#exampleInputTitle').val('');
//         $('#exampleInputMessage').val('');
//     }
//
//
// });
//
//
//




