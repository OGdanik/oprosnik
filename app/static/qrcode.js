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
}