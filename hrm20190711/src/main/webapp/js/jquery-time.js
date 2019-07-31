(function($){
	// 为jQuery添加对象的方法
	$.fn.extend({
		runTime : function(){
			var d = new Date();
			var arr = new Array();
			arr.push(d.getFullYear() + "年");
			arr.push(this.calc(d.getMonth() + 1) + "月");
			arr.push(this.calc(d.getDate()) + "日&nbsp;&nbsp;");
			arr.push(this.weeks[d.getDay()] + "&nbsp;&nbsp;");
			arr.push(this.calc(d.getHours()) + ":");
			arr.push(this.calc(d.getMinutes()) + ":");
			arr.push(this.calc(d.getSeconds()));
			this.html(arr.join(""));
			var t = this;
			setTimeout(function(){
				t.runTime();
			}, 1000);
		},
		calc : function(str){
			return str > 9 ? str : "0" + str;
		},
		weeks : ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
	});
})(jQuery);