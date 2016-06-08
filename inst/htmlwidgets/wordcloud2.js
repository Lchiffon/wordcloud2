HTMLWidgets.widget({
  name: "wordcloud2",
  type: "output",
  initialize: function(el, width, height) {
    var newCanvas = document.createElement("canvas");
    newCanvas.height = height;
    newCanvas.width = width;
    newCanvas.id = "canvas";
    // newCanvas.class = "canvas";

    el.appendChild(newCanvas);
    newlabel(el);
    return(el.firstChild);
  },
  renderValue: function(el, x, instance) {
    // parse gexf data
    listData=[];
    for(var i=0; i<x.word.length; i++){
      listData.push([x.word[i], x.freq[i]]);
    }
    if(x.figBase64){
      maskInit(el,x);
    }else{
      WordCloud(el.firstChild, { list: listData,
    									//weightFactor: x.weightFactor,
                      //backgroundColor: x.backgroundColor,
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
                      hover: cv_handleHover
                      });
    }

  },

  resize: function(el, width, height) {
  }
  // Make the sigma object available as a property on the widget
  // instance we're returning from factory(). This is generally a
  // good idea for extensibility--it helps users of this widget
  // interact directly with sigma, if needed.


});
