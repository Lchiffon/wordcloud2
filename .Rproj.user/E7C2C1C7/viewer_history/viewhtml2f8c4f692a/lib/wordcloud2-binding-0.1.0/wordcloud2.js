HTMLWidgets.widget({
  name: "wordcloud2",
  type: "output",
  renderValue: function(el, x) {
    // parse gexf data
    listData=[];
    for(var i=0; i<x.list.name.length; i++){
      listData.push([x.list.name[i], x.list.freq[i]]);
    }
    WordCloud(el, { list: listData,
  									weightFactor: x.settings.weightFactor,
                    backgroundColor: x.settings.backgroundColor});
  },

  resize: function(el, width, height) {
  }
  // Make the sigma object available as a property on the widget
  // instance we're returning from factory(). This is generally a
  // good idea for extensibility--it helps users of this widget
  // interact directly with sigma, if needed.


});
