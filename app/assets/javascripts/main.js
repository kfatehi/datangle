function draw_triangle(triangle, index) {
  var canvas = $('canvas#triangle_'+index)[0];
  if (canvas.getContext){
    var ctx = canvas.getContext('2d');
    ctx.beginPath();
    coords = triangle.coordinates
    ctx.moveTo(coords[0].x, coords[0].y);
    ctx.lineTo(coords[1].x, coords[1].y);
    ctx.lineTo(coords[2].x, coords[2].y);
    ctx.stroke(); 
  } else {
    alert('You need Safari or Firefox 1.5+ to see this demo.');
  }
}
