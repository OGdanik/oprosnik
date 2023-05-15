function add_otvet(but) {
    var input = document.createElement('input')
    input.setAttribute('type', 'text')
    input.setAttribute('name', 'otvet')
    input.setAttribute('placeholder', 'Текст ответа')
    input.setAttribute('class', 'text-field__input')
    but.before(input)
    but.before(document.createElement('br'))
    var sub = but.nextElementSibling
    sub.setAttribute('style', '')
}

function validate_add_opros(e) {
    var name = document.getElementById('name')
    var select = document.getElementById('select_tema')
    if (!name.value || select.value == -1) {
        e.preventDefault()
    }
}

function validate_add_tema(e) {
    var name = document.getElementById('name_t')
    if (!name.value) {
        e.preventDefault()
    }
}