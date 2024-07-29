function cls() {
    document.getElementById('num1').value = "";
    document.getElementById('num2').value = "";
    document.getElementById('result').value = "";
}

function showResult(choice) {
    var n1 = parseFloat(document.getElementById('num1').value);
    var n2 = parseFloat(document.getElementById('num2').value);
    var r;

    switch (choice) {
        case '1':
            r = n1 + n2;
            break;
        case '2':
            r = n1 - n2;
            break;
        case '3':
            r = n1 * n2;
            break;
        case '4':
            r = n1 / n2;
            break;
        default:
            r = 'Invalid Operation';
            break;
    }
    document.getElementById('result').value = r;
}
