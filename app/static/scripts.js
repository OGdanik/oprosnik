function add_otvet(but) {
    var div = document.createElement('div')
    div.setAttribute('class', 'text-field__group')
    var input = document.createElement('input')
    var delete_but = document.createElement('button')
    delete_but.setAttribute('onclick', 'delete_otvet(this)')
    delete_but.setAttribute('type', 'button')
    delete_but.setAttribute('class','text-field__btn')
    delete_but.innerHTML = 'Удалить'
    input.setAttribute('type', 'text')
    input.setAttribute('name', 'otvet')
    input.setAttribute('placeholder', 'Текст ответа')
    input.setAttribute('class', 'text-field__input')
    div.append(input)
    div.append(delete_but)
    but.before(div)
    but.before(document.createElement('br'))
}

function add_otvet_for_edit(but) {
    var div = document.createElement('div')
    div.setAttribute('class', 'text-field__group')
    var input = document.createElement('input')
    var delete_but = document.createElement('button')
    delete_but.setAttribute('onclick', 'delete_otvet(this)')
    delete_but.setAttribute('type', 'button')
    delete_but.setAttribute('class','text-field__btn')
    delete_but.innerHTML = 'Удалить'
    input.setAttribute('type', 'text')
    input.setAttribute('name', 'otvet_edit')
    input.setAttribute('placeholder', 'Текст ответа')
    input.setAttribute('class', 'text-field__input')
    div.append(input)
    div.append(delete_but)
    but.before(div)
    var sub = but.nextElementSibling
    sub.setAttribute('style', '')
    but.before(document.createElement('br'))
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

function delete_otvet(but) {
    but.parentNode.nextSibling.remove()
    but.parentNode.remove()
}