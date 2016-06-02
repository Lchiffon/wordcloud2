function cv_handleHover(item, dimension, evt) {
  console.log(this);

  var ne = el.canvasHover;
  if (!item) {
    ne.setAttribute('hidden', true);

    return;
  }

  ne.removeAttribute('hidden');
  ne.style.left = dimension.x + 'px';
  ne.style.top = dimension.y + 'px';
  ne.style.width = dimension.w + 'px';
  ne.style.height = dimension.h + 'px';

  el.canvasHoverLabel = dimension;

  el.canvasHoverLabel.setAttribute(
    'data-l10n-args', JSON.stringify({ word: item[0], count: item[1] }));
  __(el.canvasHoverLabel);
};
