
function add_otvet(but) {
    var input = document.createElement('input')
    input.setAttribute('type', 'text')
    input.setAttribute('name', 'otvet')
    input.setAttribute('placeholder', 'Текст ответа')
    but.before(input)
    but.before(document.createElement('br'))
}