---
title: Svg
date: 2020-12-01T17:27:49+08:00
hero: /images/anonymous/4.svg
menu:
  sidebar:
    name: Svg
    parent: notes
    # weight: 10
---

### Convert .eps to .svg

- Install [Adobe Illustrator](https://www.adobe.com/cn/products/illustrator.html).
- Open .eps file and select `Import As .svg`
  > Use these options to minify output:
  >
  > **样式**：内部 CSS  
  > **小数**：1  
  > **缩小**：checked  
  > **响应**：checked

### Minify For Network Transmission

- Install [SVG](https://marketplace.visualstudio.com/items?itemName=jock.svg) extension for `VS Code`.
- Right click in editor of the .svg file and click `compress SVG` to remove unnecessary code.
- Run `gzip xxx.svg` command in console to compress svg.
- Enable `gzip static` in `nginx`.
