/*! Copyright (c) 2010 Brandon Aaron (http://brandonaaron.net)
* Licensed under the MIT License (LICENSE.txt).
*
* Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
* Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
* Thanks to: Seamus Leahy for adding deltaX and deltaY
*
* Version: 3.0.4
*
* Requires: 1.2.2+
*/
(function(a){function b(b){var c=b||window.event,e=[].slice.call(arguments,1),f=0,g=0,h=0;return b=a.event.fix(c),b.type="mousewheel",b.wheelDelta&&(f=b.wheelDelta/120),b.detail&&(f=-b.detail/3),h=f,c.axis!==undefined&&c.axis===c.HORIZONTAL_AXIS&&(h=0,g=-1*f),c.wheelDeltaY!==undefined&&(h=c.wheelDeltaY/120),c.wheelDeltaX!==undefined&&(g=-1*c.wheelDeltaX/120),e.unshift(b,f,g,h),a.event.handle.apply(this,e)}var c=["DOMMouseScroll","mousewheel"];a.event.special.mousewheel={setup:function(){if(this.addEventListener)for(var a=c.length;a;)this.addEventListener(c[--a],b,!1);else this.onmousewheel=b},teardown:function(){if(this.removeEventListener)for(var a=c.length;a;)this.removeEventListener(c[--a],b,!1);else this.onmousewheel=null}},a.fn.extend({mousewheel:function(a){return a?this.bind("mousewheel",a):this.trigger("mousewheel")},unmousewheel:function(a){return this.unbind("mousewheel",a)}})})(jQuery)