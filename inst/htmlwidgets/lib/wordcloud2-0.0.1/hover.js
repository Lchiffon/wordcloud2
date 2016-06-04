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


function cv_handleHover(item,
                                                           dimension, evt) {
  var el = document.getElementById("wcLabel");
  if (!item) {
    el.setAttribute('hidden', true);

    return;
  }

  el.removeAttribute('hidden');
  el.style.left = dimension.x + 'px';
  el.style.top = dimension.y + 'px';
  el.style.width = dimension.w + 'px';
  el.style.height = dimension.h + 'px';

  this.hoverDimension = dimension;

  document.getElementById("wcSpan").setAttribute(
    'data-l10n-args', JSON.stringify({ word: item[0], count: item[1] }));
  document.getElementById("wcSpan").innerHTML =item[0]+":" + item[1];
  //__(document.getElementById("wcSpan"));
};
