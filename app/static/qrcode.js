function download_qr() {
    var qrcode_div = document.createElement('div')
    qrcode_div.setAttribute('id','qrcode')
    var url = window.location.href.replace('/edit', '')

    new QRCode(qrcode_div, {
        text: url,
        width: 400,
        height: 400,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
    var block = document.createElement('div');
    block.setAttribute('class','qr')
    var but_close = document.createElement('button')
    but_close.setAttribute('class','close_button')
    but_close.setAttribute('type', 'button')
    but_close.onclick = function() {
        block.remove()
    }
    but_close.innerHTML = '✕'
    block.append(but_close)
    document.body.append(block)
    block.append(qrcode_div)
}