// create element
function newlabel(el){
  var newDiv = document.createElement("div");
  var newSpan = document.createElement("span");

  newDiv.id = 'wcLabel'
  newSpan.id = "wcSpan"

  // newDiv.style.position = 'absolute';
  //   newDiv.style.border ='2px solid #fff';
  //   newDiv.setAttribute("box-shadow",'0 0 4px 0 #008');
  //   newDiv.style.padding ='2px';
  //   newDiv.style.margin ='-4px 0 0 -4px';
  //   newDiv.setAttribute("pointer-events",'none');
  //
  //
  //   newSpan.style.position ='absolute';
  //   newSpan.style.top= '100%';
  //   newSpan.style.left= '0';
  //   newSpan.style.background= 'white';
  //   newSpan.style.color= '#333';
  //   newSpan.setAttribute("margin-top", '6px');
  //   newSpan.style.padding= '0 0.5em';
  //   newSpan.setAttribute('border-radius', '0.5em');
  //   newSpan.setAttribute('white-space', 'nowrap');


  el.appendChild(newDiv);
  document.getElementById("wcLabel").appendChild(newSpan)
}

// hover function
function cv_handleHover(item,
                                                           dimension, evt) {
  var el = document.getElementById("wcLabel");
  if (!item) {
    el.setAttribute('hidden', true);

    return;
  }

  el.removeAttribute('hidden');
  // console.log(evt.srcElement.offsetLeft);

  el.style.left = dimension.x + evt.srcElement.offsetLeft + 'px';
  el.style.top = dimension.y + evt.srcElement.offsetTop + 'px';
  el.style.width = dimension.w + 'px';
  el.style.height = dimension.h + 'px';

  this.hoverDimension = dimension;

  document.getElementById("wcSpan").setAttribute(
    'data-l10n-args', JSON.stringify({ word: item[0], count: item[1] }));
  document.getElementById("wcSpan").innerHTML =item[0]+":" + item[1];
  //__(document.getElementById("wcSpan"));
};

//mask function
function maskInit(el,x){
  str = x.settings.figBase64;
  var newImg = document.createElement("img");
  newImg.src = str;
  newImg.style.position = 'absolute';
  newImg.style.left = 0;
  console.log(el.clientHeight);
  newImg.width = el.clientWidth;
  newImg.height = el.clientHeight;
  // maskCanvas = init(el, x, newImg);




  maskCanvas = null;
  // var img = new Image();
  // img.src = x.settings.figBase64;



    maskCanvas = document.createElement('canvas');
    maskCanvas.width = newImg.width;
    maskCanvas.height = newImg.height;

    var ctx = maskCanvas.getContext('2d');
    ctx.drawImage(newImg, 0, 0, newImg.width, newImg.height);

    var imageData = ctx.getImageData(
      0, 0, maskCanvas.width, maskCanvas.height);
    var newImageData = ctx.createImageData(imageData);

    // M = 0
    for (var i = 0; i < imageData.data.length; i += 4) {

      var tone = imageData.data[i] +
        imageData.data[i + 1] +
        imageData.data[i + 2];
      var alpha = imageData.data[i + 3];

      if (alpha < 128 || tone > 128 * 3) {
        // Area not to draw
        newImageData.data[i] =
          newImageData.data[i + 1] =
          newImageData.data[i + 2] = 255;
        newImageData.data[i + 3] = 0;
      } else {
        // Area to draw
        newImageData.data[i] =
          newImageData.data[i + 1] =
          newImageData.data[i + 2] = 0;
        newImageData.data[i + 3] = 255;
      }
      // M = M + newImageData.data[i] + newImageData.data[i + 1] + newImageData.data[i + 2]
    }
    // console.log(M);
    ctx.putImageData(newImageData, 0, 0);




  // console.log(maskCanvas);
  mask(el, x, maskCanvas);
  // el.appendChild(newImg);
}


//
//
// jQuery(function($) {
//   var $form = $('#form');
//   var $canvas = $('#canvas');
//   var $htmlCanvas = $('#html-canvas');
//   var $canvasContainer = $('#canvas-container');
//   var $loading = $('#loading');
//
//   var $list = $('#input-list');
//   var $options = $('#config-option');
//   var $width = $('#config-width');
//   var $height = $('#config-height');
//   var $mask = $('#config-mask');
//   var $dppx = $('#config-dppx');
//   var $css = $('#config-css');
//   var $webfontLink = $('#link-webfont');



  // Load the local image file, read it's pixels and transform it into a
  // black-and-white mask image on the canvas.
//  function  init(el,x,newImage) {
//
//     console.log(maskcanvas);
//     return(maskCanvas);
// };
function mask(el,x,maskCanvas){
  // options.clearCanvas = false;

  /* Determine bgPixel by creating
     another canvas and fill the specified background color. */
  var bctx = document.createElement('canvas').getContext('2d');

  bctx.fillStyle = x.settings.backgroundColor || '#fff';
  bctx.fillRect(0, 0, 1, 1);
  var bgPixel = bctx.getImageData(0, 0, 1, 1).data;
  // console.log(bgPixel)
  var maskCanvasScaled =
    document.createElement('canvas');
  maskCanvasScaled.width = el.clientWidth;
  maskCanvasScaled.height = el.clientHeight;
  var ctx = maskCanvasScaled.getContext('2d');

  ctx.drawImage(maskCanvas,
    0, 0, maskCanvas.width, maskCanvas.height,
    0, 0, maskCanvasScaled.width, maskCanvasScaled.height);
  console.log(canvas);
  var imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
  // console.log(imageData)
  var newImageData = ctx.createImageData(imageData);
  for (var i = 0; i < imageData.data.length; i += 4) {
    if (imageData.data[i + 3] > 128) {
      newImageData.data[i] = bgPixel[0];
      newImageData.data[i + 1] = bgPixel[1];
      newImageData.data[i + 2] = bgPixel[2];
      newImageData.data[i + 3] = bgPixel[3];
    } else {
      // This color must not be the same w/ the bgPixel.
      newImageData.data[i] = bgPixel[0];
      newImageData.data[i + 1] = bgPixel[1];
      newImageData.data[i + 2] = bgPixel[2];
      newImageData.data[i + 3] = bgPixel[3] ? (bgPixel[3] - 1) : 0;
    }
  }

  ctx.putImageData(newImageData, 0, 0);

  ctx = el.firstChild.getContext('2d');
  ctx.drawImage(maskCanvasScaled, 0, 0);

  maskCanvasScaled = ctx = imageData = newImageData = bctx = bgPixel = undefined;


  WordCloud(el.firstChild, { list: listData,
                  //weightFactor: x.settings.weightFactor,
                  //backgroundColor: x.settings.backgroundColor,
                  fontFamily: x.settings.fontFamily,
                  fontWeight: x.settings.fontWeight,
                  color: x.settings.color,
                  minSize: x.settings.minSize,
                  weightFactor: x.settings.weightFactor,
                  backgroundColor: x.settings.backgroundColor,
                  gridSize: x.settings.gridSize,
                  minRotation: x.settings.minRotation,
                  maxRotation: x.settings.maxRotation,
                  shuffle: x.settings.shuffle,
                  shape: x.settings.shape,
                  rotateRatio: x.settings.rotateRatio,
                  ellipticity: x.settings.ellipticity,
                  // drawMask: true,
                  clearCanvas: false,
                  // maskColor: x.settings.backgroundColor,
                  // maskGapWidth: x.settings.maskGapWidth,
                  hover: cv_handleHover
                  });
}




//
//
//   var run = function run() {
//
//     // Put the word list into options
//
//     if (maskCanvas) {
//       options.clearCanvas = false;
//
//       /* Determine bgPixel by creating
//          another canvas and fill the specified background color. */
//       var bctx = document.createElement('canvas').getContext('2d');
//
//       bctx.fillStyle = options.backgroundColor || '#fff';
//       bctx.fillRect(0, 0, 1, 1);
//       var bgPixel = bctx.getImageData(0, 0, 1, 1).data;
//
//       var maskCanvasScaled =
//         document.createElement('canvas');
//       maskCanvasScaled.width = $canvas[0].width;
//       maskCanvasScaled.height = $canvas[0].height;
//       var ctx = maskCanvasScaled.getContext('2d');
//
//       ctx.drawImage(maskCanvas,
//         0, 0, maskCanvas.width, maskCanvas.height,
//         0, 0, maskCanvasScaled.width, maskCanvasScaled.height);
//
//       var imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
//       var newImageData = ctx.createImageData(imageData);
//       for (var i = 0; i < imageData.data.length; i += 4) {
//         if (imageData.data[i + 3] > 128) {
//           newImageData.data[i] = bgPixel[0];
//           newImageData.data[i + 1] = bgPixel[1];
//           newImageData.data[i + 2] = bgPixel[2];
//           newImageData.data[i + 3] = bgPixel[3];
//         } else {
//           // This color must not be the same w/ the bgPixel.
//           newImageData.data[i] = bgPixel[0];
//           newImageData.data[i + 1] = bgPixel[1];
//           newImageData.data[i + 2] = bgPixel[2];
//           newImageData.data[i + 3] = bgPixel[3] ? (bgPixel[3] - 1) : 0;
//         }
//       }
//
//       ctx.putImageData(newImageData, 0, 0);
//
//       ctx = $canvas[0].getContext('2d');
//       ctx.drawImage(maskCanvasScaled, 0, 0);
//
//       maskCanvasScaled = ctx = imageData = newImageData = bctx = bgPixel = undefined;
//     }
//
//
//     // All set, call the WordCloud()
//     // Order matters here because the HTML canvas might by
//     // set to display: none.
//     WordCloud([$canvas[0], $htmlCanvas[0]], options);
//   };
//
//
//
//
//
// });
