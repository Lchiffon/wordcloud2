HTMLWidgets.widget({

  name: 'wordcloud2',

  type: 'output',

  factory: function(el, width, height) {

    var instance = {};

    var newCanvas = document.createElement("canvas");
    newCanvas.height = height;
    newCanvas.width = width;
    newCanvas.id = el.id + "-canvas";

    el.appendChild(newCanvas);
    newlabel(el);

    var draw_wordcloud2 = function(instance){
      var x = instance.x;

      if(x.figBase64){
        maskInit(el,x);
      }else{
        instance.wordcloud = WordCloud(el.firstChild, { list: listData,
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
                        hover: x.hover || cv_handleHover
                        });
      }
    }

    return {

      renderValue: function(x) {
        instance.x = x;

        // parse gexf data
        listData=[];
        for(var i=0; i<x.word.length; i++){
          listData.push([x.word[i], x.freq[i]]);
        }
        instance.listData = listData;

        draw_wordcloud2(instance);

      },

      resize: function(width, height) {

        newCanvas.height = height;
        newCanvas.width = width;

        draw_wordcloud2(instance);

      },

      instance: instance

    };
  }
});
