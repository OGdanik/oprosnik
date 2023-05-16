function validation_login(e) {
    var log = document.getElementById('login')
    var pass = document.getElementById('pass1')
    if (!log.value || !pass.value) {
        e.preventDefault();
    }
}

function validation_signup(e) {
    var log = document.getElementById('login')
    var pass = document.getElementById('pass1')
    var pass2 = document.getElementById('pass2')
    var fio = document.getElementById('f')
    var age = document.getElementById('a')
    if (!log.value || !pass.value || !pass2.value || !fio.value || !age.value) {
        e.preventDefault();
    }
    var checkbox = document.getElementsByName('pol')
    if (!checkbox[0].checked && !checkbox[1].checked) {
        e.preventDefault();
    }
}