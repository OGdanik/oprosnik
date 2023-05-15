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

function add_otvet_for_edit(but) {
    var input = document.createElement('input')
    input.setAttribute('type', 'text')
    input.setAttribute('name', 'otvet_edit')
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

function validate_add_vopros(e) {
    var name = document.getElementById('vopr')
    var otvets = document.getElementsByName('otvet')
    otvets.forEach(function(item) {
        if (!item.value) {
            e.preventDefault()
        }
    })
    if (!name.value) {
        e.preventDefault()
    }
}

function validate_add_vopros_2(e) {
    var otvets = document.getElementsByName('otvet_edit')
    otvets.forEach(function(item) {
        if (!item.value) {
            e.preventDefault()
        }
    })
}