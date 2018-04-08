

function signOut() {
    var resp = confirm("Çıkış yapmak istediğinize emin misiniz?");
    if (resp) {
        window.location.href = "../logout.jsp";
    }
}


$("#registerButton").click(function(){
// similar behavior as clicking on a link
    window.location.href = "../register.jsp";
});