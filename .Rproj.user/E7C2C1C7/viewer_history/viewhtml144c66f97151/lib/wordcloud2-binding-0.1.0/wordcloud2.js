HTMLWidgets.widget({
  name: "wordcloud2",
  type: "output",
  renderValue: function(el, x, instance) {
    // parse gexf data
    WordCloud(el, { list: HTMLWidgets.transposeArray2D(x.list),
  									weightFactor: x.settings.weightFactor,
                    backgroundColor: x.settings.backgroundColor});
  },

  resize: function(el, width, height, instance) {
  }
  // Make the sigma object available as a property on the widget
  // instance we're returning from factory(). This is generally a
  // good idea for extensibility--it helps users of this widget
  // interact directly with sigma, if needed.

  }
});
