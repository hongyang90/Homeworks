// TIMEOUT FUNC
const setTimeout = window.setTimeout(function () {
   alert("HAMMERTIME");
}, 5000);

// TIMEOUT WITH CLOSURE
const hammertime = function(time) {
    window.setTimeout(function() {
        alert(`${time} is hammertime!`)
    }, 5000);
}
