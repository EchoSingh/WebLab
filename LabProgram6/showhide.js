function flipimage() {
    var dom = document.getElementById("apple").style;
    if (dom.visibility == "visible") {
        dom.visibility = "hidden";
    } else {
        dom.visibility = "visible";
    }
}
