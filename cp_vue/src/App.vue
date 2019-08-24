<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  background:#fff;
}
#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
.mint-tab-container.tabContainer {
  position: absolute !important;
  height: 100%;
  width: 100%;
  overflow: scroll;
  padding-bottom:56px;
}
.main {
  width: 100%;
  max-width: 640px;
  margin: 0px auto;
  background: #f5f5f5;
  box-sizing: border-box;
}

.mint-cell-wrapper{
  padding:0px 25px !important;
}
.mint-cell+.mint-cell{
  border-top:1px solid #d9d9d9;
}
.mint-toast-icon{
  font-size:38px !important;
  color:#fff;
}
.icon-kong1:before{
  color:#fff !important;
}
.mint-button::after {
  background:#ff5151 !important
}
.mint-cell-wrapper{
  background:transparent !important;
}
.mint-cell-wrapper.focus{
  border-top:1px solid rgb(53, 221, 243);
  border-bottom:1px solid  rgb(53, 221, 243);
}

span,input{
  vertical-align: middle;
}

body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
main, menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	vertical-align: baseline;
  box-sizing:border-box;
}
a{
  text-decoration: none;
}
ul{
  list-style: none;
}
img{
  vertical-align: middle;
}

input textarea{
  border:0 !important;
  outline: none !important;
  box-sizing:border-box !important;
}

::-webkit-scrollbar {
    width: 0px;
    height: 0px;
    background-color: #F5F5F5;
}
::-webkit-scrollbar-thumb {
    border-radius: 0px;
    background-color: #555;
}
::-webkit-scrollbar-track {
    border-radius: 0px;
    background-color: #F5F5F5;
}
</style>
