document.addEventListener("DOMContentLoaded", function(){
    var canvas = document.getElementById('mycanvas');
    var ctx = canvas.getContext('2d');
    ctx.fillStyle = "red";
    ctx.fillRect(100,200,200,100);

    ctx.beginPath();
    ctx.arc(100, 50, 45, 0, 2 * Math.PI);
    ctx.strokeStyle = 'orange';
    ctx.lineWidth = 200;
    ctx.stroke();
    ctx.fillStyle = "yellow";
    ctx.fill();

    ctx.beginPath();
    ctx.strokeStyle = 'purple';
    ctx.lineWidth = 200;
    ctx.stroke();
    ctx.arc(50, 100, 45, 0, 2 * Math.PI);
    ctx.fillStyle = "yellow";
    ctx.fill();

    ctx.lineWidth = 30;
    ctx.beginPath();
    ctx.strokeStyle = 'green';
    ctx.moveTo(20,30);
    ctx.lineTo(130, 130);
    ctx.moveTo(300,300);
    ctx.lineTo(400, 130);
    ctx.moveTo(250,250);
    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();

});
