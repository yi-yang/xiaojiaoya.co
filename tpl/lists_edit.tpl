<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改新闻种类</title>
</head>
<body>
<div id="main">
<h1><a href="#"><span>修改新闻种类</span></a></h1>
  <div class="boxin">
	<h2 class="tutor">请填写新闻种类</h2>
		<form action="<{spUrl c=lists a=update}>" method=POST>
		<p>id: <input type=text name='id' size=40 readonly value="<{$result.id}>" > </p>
		<p>name：<input type=text name='name' size=40 value="<{$result.name}>"></p>
	<p>上层list：<select name="root_id">
	<option value="0"></option>
		<{foreach from=$lists_all item=iter}>
			<{if $iter.root_id == 0}>
			<option value="<{$iter.id}>" 
				<{if $iter.id == $result.root_id}>
				selected
				<{/if}>
			><{$iter.name}></option>
			<{/if}>
		<{/foreach}>
	</select>
	</p>
		<p><input type=submit value=" 提交 "></p>
		</form>
		<a href="<{spUrl c=lists}>">return</a>
  </div>
</div>
</body>
</html>	
