/*
 * jQuery Asynchronous Plugin 1.0 RC1
 *
 * Copyright (c) 2008 Vincent Robert (genezys.net)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 */
(function(a){a.whileAsync=function(a){var b=Math.abs(a.delay)||10,c=isNaN(a.bulk)?500:Math.abs(a.bulk),d=a.test||function(){return!0},e=a.loop||function(){},f=a.end||function(){};(function(){var a=!1,g=new Date;while(a=d()){e();if(c===0||new Date-g>c)break}a?setTimeout(arguments.callee,b):f()})()},a.eachAsync=function(b,c){var d=0,e=b.length,f=c.loop||function(){};a.whileAsync(a.extend(c,{test:function(){return d<e},loop:function(){var a=b[d];return f.call(a,d++,a)}}))},a.fn.eachAsync=function(b){return a.eachAsync(this,b),this}})(jQuery)