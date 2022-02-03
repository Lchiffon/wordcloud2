HTMLWidgets.widget({

  name: 'wordcloud2',

  type: 'output',

  initialize: function(el, width, height) {
    var newCanvas = document.createElement("canvas");
    newCanvas.height = height;
    newCanvas.width = width;
    newCanvas.id = "canvas";

    el.appendChild(newCanvas);
    newlabel(el);
    return(el.firstChild);
  },
  renderValue: function(el, x, instance) {
    const canvas = el.children[0];
    const context = canvas.getContext('2d');
    context.clearRect(0, 0, el.scrollWidth, el.scrollHeight);

    // parse gexf data
    listData=[];
    if (typeof(x.word) === 'string') {
      listData.push([x.word, x.freq])
    } else {
      for(var i=0; i<x.word.length; i++){
        listData.push([x.word[i], x.freq[i]]);
      }
    }

    if (x.figBase64) {
      maskInit(el,x);
    } else {
      WordCloud(el.firstChild, {
        list: listData,
        fontFamily: x.fontFamily,
        fontWeight: x.fontWeight,
        color: x.color,
        minSize: x.minSize,
        weightFactor: x.weightFactor,
        backgroundColor: x.backgroundColor,
        gridSize: x.gridSize,
        minRotation: x.minRotation,
        maxRotation: x.maxRotation,
        shuffle: x.shuffle,
        shape: x.shape,
        rotateRatio: x.rotateRatio,
        ellipticity: x.ellipticity,
        drawMask: x.drawMask,
        maskColor: x.maskColor,
        maskGapWidth: x.maskGapWidth,
        hover: x.hover || cv_handleHover });
    }
  },
  resize: function(el, width, height) {
  }
});
