<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>白色留言本</title>
<link href="guestbook/tpl/white/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="main">
<h1><a href="#"><span>我的白色留言本</span></a></h1>
  <div class="boxin">
	<h2 class="tutor">请填写您的留言</h2>
		<form action="<{spUrl c=main a=write}>" method=POST>
		<p>您的名字：<input type=text name='name' size=40></p>
		<p>留言标题：<input type=text name='title' size=40></p>
		<p>留言内容：</p>
		<p><textarea name=contents cols=60 rows=6></textarea></p>
		<p><input type=submit value=" 提交 "></p>
		</form>
    <ul class="list">
 <{foreach from=$results item=one}>
      <li><span><{$one.name}></span><a href="#"><{$one.title}></a><br /><{$one.contents}></li>
<{/foreach}>
    </ul>
  </div>
</div>
  <div id="footer" style="clear:both;">
<select name="选择模板" onchange="location.href=this.options[this.selectedIndex].value;"><option> 模板选择...</option>
  <option value="/?tpl=green">绿色风格</option><option value="/?tpl=blue">蓝色风格</option><option value="/?tpl=green2">绿色风格2</option><option value="/?tpl=white">白色风格</option></select>
  </div>
</div>
</body>
</html>	

