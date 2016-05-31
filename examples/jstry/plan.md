笔记:

主函数:  `WordCloud(elements, options);`

### Elements
  - `document.getElementById('my_canvas')` or `$('#my_canvas')[0]`
  - 如果是canvas,直接在上面绘制,如果是其他,创建span对象绘制(选后一种)
  - TODO:图片

## options
### 基本属性
- `list`: `[word, size]`, e.g. `[['foo', 12], ['bar', 6]]`.
- `fontFamily` 字体
- `fontWeight` 字体粗细
- `color` 字体颜色
  - `callback(word, weight, fontSize, distance, theta)`
  - `random-dark`
  - `random-light`
- `classes`用于定义span的class,目测用不上
- `minSize`最小字体
- `weightFactor`函数或者是数字去定义list中字的大小
- `clearCanvas`开始前先重新print背景色
- `backgroundColor`背景颜色
### 维度信息
- `gridSize`字的间隔
- `origin`词云的中心
## Mask
- `drawMask`
- `maskColor`
- `maskGapWidth`
## Timing
- `wait`
- `abortTheshold`
- `abort`
## Rotation旋转
- `minRotation`最小旋转角度
- `maxRotation`最大旋转角度
## Randomness随机性
- `shuffle`每次是否随机
- `rotateRatio`随机旋转的比例,1代表永远旋转
## Shape形状
- `shape`形状
  - circle
  - cardioid
  - diamond
  - triangle-forward
  - triangle
- `ellipticity`光滑程度(不做了吧)
## Interactive交互
- `hover`移动上显示` callback(item, dimension, event)`
- `click`点击显示` callback(item, dimension, event)`
