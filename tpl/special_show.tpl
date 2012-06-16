<{include file="header.tpl"}>

<div align="center">
<div id="body">
<div class="table">


<div id="left">

 
  
<style>
ul { padding:0; margin:0;}
#main1,#main2 { width:244px; height:28px; line-height:28px; padding-left:5px; background:#ccc; cursor:pointer; border-bottom:1px solid #fff;}
#child1,#child2 { width:248px; background:#eee;}
#child1 ul li,#child2 ul li { padding-left:5px; border-bottom:1px solid #fff; line-height:180%;}
#child1 ul li a,#child2 ul li a { color:#666;}
</style>

 
 <div>
 
 
	<div class="border_no_top" style="height:auto;">
		<div class="notice-marquee"   style="line-height:18px;text-align:left;">
		
	 
		
		
		 
<div id="main1" onClick="document.getElementById('child1').style.display=(document.getElementById('child1').style.display =='none')?'':'none'" ><img src="jh.gif" border="0"><{$root_special.name}></a></div>
<div id="child1"  >
<ul>

<{foreach from=$special_related item=one}>
<{if $one.root_id != 0}>
<li><a href="<{spUrl c=special a=show id=$one.id}>"><{$one.name}></a></li> 
<{/if}>
<{/foreach}>
			 
</ul>
</div>
 
		
		
		
		
		
		
		
		
		
		
 
   
				
		 
		</div>
	</div>
 
</div>
 
<div class="space_between"><div class="space_between"></div></div>
 
 
 
 	
 
 
 
 
  
 

 
<div id="rightcolumn">

 
	
<h1>联系我们</h1>

<p>
电话：010-84813528  84812591<br>
邮编：100012<br>

地址：北京市朝阳区立水桥路8号<br>
 
邮箱：bjdykid@126.com<br>

<!--<a href="special.php?id=26" target="_blank"><img src=files/blog.gif></a>-->
</p>	
		
							
 </div>



</div>

<div id="right">
	<div class="global_sub"><{$special.name}></div>
	<div class="border_no_top">
		<div style="padding:5px;">
			<div  style="line-height:20pt;text-indent:2em;"><div><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-bidi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">
<{$special.content}>
</span></div></div>
		</div>
	</div>
</div>
<div style="clear:both;"></div>

</div>
</div>
</div>


<{include file="footer.tpl"}>
