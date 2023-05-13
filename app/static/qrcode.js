document.onload = create_qr()

function create_qr() {

    var url = window.location.href.replace('/edit', '')

    new QRCode(document.getElementById('qrcode'), {
        text: url,
        width: 128,
        height: 128,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
}