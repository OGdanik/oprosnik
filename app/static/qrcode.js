document.onload = create_qr()

function create_qr() {

    var url = window.location.href.replace('/edit', '')

    new QRCode(document.getElementById('qrcode'), {
        text: url,
        width: 200,
        height: 200,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
    document.getElementById('qrcode').setAttribute('style','display:none;')
}

function download_qr() {
    var a = document.createElement('a');
    var div = document.getElementById('qrcode')
    var img = div.querySelector('img')
    a.href = img.getAttribute('src')
    a.download = "qrcode.png";
    document.body.appendChild(a)
    a.click()
    document.body.removeChild(a)
}