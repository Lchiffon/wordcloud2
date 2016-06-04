HTMLWidgets.widget({
  name: "wordcloud2",
  type: "output",
  initialize: function(el, width, height) {
    var newCanvas = document.createElement("canvas");
    newCanvas.height = height;
    newCanvas.width = width;

    el.appendChild(newCanvas);
    newlabel(el);
    return(el.firstChild);
  },
  renderValue: function(el, x, instance) {
    // parse gexf data
    listData=[];
    for(var i=0; i<x.list.name.length; i++){
      listData.push([x.list.name[i], x.list.freq[i]]);
    }
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
                    drawMask: x.settings.drawMask,
                    maskColor: x.settings.maskColor,
                    maskGapWidth: x.settings.maskGapWidth,
                    hover: cv_handleHover
                    });
  },

  resize: function(el, width, height) {
  }
  // Make the sigma object available as a property on the widget
  // instance we're returning from factory(). This is generally a
  // good idea for extensibility--it helps users of this widget
  // interact directly with sigma, if needed.


});
