(function(){var e=/\{([^\}]+)\}/g,t=/(?:(?:^|\.)(.+?)(?=\[|\.|$|\()|\[('|")(.+?)\2\])(\(\))?/g,n=function(e,n,r){var i=r;n.replace(t,function(e,t,n,r,s){t=t||r;if(i){if(t in i){i=i[t]}typeof i=="function"&&s&&(i=i())}});i=(i===null||i==r?e:i)+"";return i},r=function(t,r){return String(t).replace(e,function(e,t){return n(e,t,r)})};Raphael.fn.popup=function(e,t,n,i,s){i=String(i||"top-middle").split("-");i[1]=i[1]||"middle";var o=5,u=n.getBBox(),a=Math.round(u.width),f=Math.round(u.height),l=Math.round(u.x)-o,c=Math.round(u.y)-o,h=Math.min(f/2,a/2,10),p={top:"M{x},{y}h{w4},{w4},{w4},{w4}a{r},{r},0,0,1,{r},{r}v{h4},{h4},{h4},{h4}a{r},{r},0,0,1,-{r},{r}l-{right},0-{gap},{gap}-{gap}-{gap}-{left},0a{r},{r},0,0,1-{r}-{r}v-{h4}-{h4}-{h4}-{h4}a{r},{r},0,0,1,{r}-{r}z",bottom:"M{x},{y}l{left},0,{gap}-{gap},{gap},{gap},{right},0a{r},{r},0,0,1,{r},{r}v{h4},{h4},{h4},{h4}a{r},{r},0,0,1,-{r},{r}h-{w4}-{w4}-{w4}-{w4}a{r},{r},0,0,1-{r}-{r}v-{h4}-{h4}-{h4}-{h4}a{r},{r},0,0,1,{r}-{r}z",right:"M{x},{y}h{w4},{w4},{w4},{w4}a{r},{r},0,0,1,{r},{r}v{h4},{h4},{h4},{h4}a{r},{r},0,0,1,-{r},{r}h-{w4}-{w4}-{w4}-{w4}a{r},{r},0,0,1-{r}-{r}l0-{bottom}-{gap}-{gap},{gap}-{gap},0-{top}a{r},{r},0,0,1,{r}-{r}z",left:"M{x},{y}h{w4},{w4},{w4},{w4}a{r},{r},0,0,1,{r},{r}l0,{top},{gap},{gap}-{gap},{gap},0,{bottom}a{r},{r},0,0,1,-{r},{r}h-{w4}-{w4}-{w4}-{w4}a{r},{r},0,0,1-{r}-{r}v-{h4}-{h4}-{h4}-{h4}a{r},{r},0,0,1,{r}-{r}z"},d={hx0:e-(l+o+a-h*2),hx1:e-(l+o+a/2-h),hx2:e-(l+o+h),vhy:t-(c+o+f+o+h),"^hy":t-(c-h)},v=[{x:l+o,y:c,w:a,w4:a/4,h4:f/4,right:0,left:a-h*2,bottom:0,top:f-h*2,r:o,h:f,gap:h},{x:l+o,y:c,w:a,w4:a/4,h4:f/4,left:a/2-h,right:a/2-h,top:f/2-h,bottom:f/2-h,r:o,h:f,gap:h},{x:l+o,y:c,w:a,w4:a/4,h4:f/4,left:0,right:a-h*2,top:0,bottom:f-h*2,r:o,h:f,gap:h}][i[1]=="middle"?1:(i[1]=="top"||i[1]=="left")*2];var m=0,g=0,y=this.path(r(p[i[0]],v)).insertBefore(n);switch(i[0]){case"top":m=e-(l+o+v.left+h);g=t-(c+o+f+o+h);break;case"bottom":m=e-(l+o+v.left+h);g=t-(c-h);break;case"left":m=e-(l+o+a+o+h);g=t-(c+o+v.top+h);break;case"right":m=e-(l-h);g=t-(c+o+v.top+h);break}y.translate(m,g);if(s){s=y.attr("path");y.remove();return{path:s,dx:m,dy:g}}n.translate(m,g);return y}})()