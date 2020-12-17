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
  // parse gexf data
     listData=[];
     for(var i=0; i<x.word.length; i++){
        listData.push([x.word[i], x.freq[i]]);
     }
     x.list = listData;
     delete x.word;
     delete x.freq;
     x.hover = x.hover || cv_handleHover;

     if(x.figBase64){

        maskInit(el,x);
        console.log(3)

      }else{
        WordCloud(el.firstChild, x);
      }
    },
    resize: function(el, width, height) {
    }

});
