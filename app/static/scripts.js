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