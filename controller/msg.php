<?php
class msg extends spController
{
	function index() {
		$m_msg = spClass("m_msg");
		if ($list_id = $this->spArgs("list_id")) {
			$sql = "SELECT msg.id, msg.list_id, msg.title, msg.date, lists.name as list_name FROM `msg` , `lists` WHERE msg.list_id = lists.id AND msg.list_id = $list_id";
		}
		else {
			$sql = "SELECT msg.id, msg.list_id, msg.title, msg.date, lists.name as list_name FROM `msg` , `lists` WHERE msg.list_id = lists.id";
		}
		$this->results = $m_msg->findSql($sql);

		$m_lists = spClass("m_lists");
		$this->lists= $m_lists->findAll();

		import(APP_PATH.'/fckeditor/fckeditor.php');
		$oFCKeditor = new FCKeditor('content') ;
		$oFCKeditor->BasePath	= 'fckeditor/';
		$oFCKeditor->Height = "500";
		$oFCKeditor->Width = "80%";
		//$oFCKeditor->Value	= 'content';
		$this->editor = $oFCKeditor->CreateHtml();

		$this->display("msg.tpl");
	}

	function show() {
		if ($id = $this->spArgs("id")) {
			$m_msg = spClass("m_msg");
			$conditions = array('id' => $id);
			$this->msg = $m_msg->find($conditions);

			$click = $this->msg['click'] + 1;
			$newrow = array('click' => $click);
			$m_msg->update($conditions, $newrow);
	
			$this->display("msg_show.tpl");
		}
		else {
			$this->jump(spUrl('main')); 
		}
	}

	function add() {
		if (($title = $this->spArgs("title"))
			 && ($content = $this->spArgs("content"))) {
			$list_id = $this->spArgs("list_id");
			$date = date('Y-m-d H:i:s',time());
			$newrow = array(
				'title' => $title,
				'content' => $content,
				'click' => 0,
				'date' => $date,
				'list_id' => $list_id,
			);
			//var_dump($newrow);
			$m_msg = spClass("m_msg");
			$m_msg->create($newrow);
		}
		$this->jump(spUrl('msg', 'index'));
	}

	function del() {
		if ($id = $this->spArgs("id")) {
			$m_msg = spClass("m_msg");
			$conditions = array('id' => $id);
			$m_msg->delete($conditions);
		}
		$this->jump(spUrl('msg', 'index'));
	}

	function edit() {
		if ($id = $this->spArgs("id")) {
			$conditions = array('id' => $id);
			$m_msg = spClass("m_msg");

			$m_lists = spClass("m_lists");
			$this->lists_all = $m_lists->findAll();

			if ($this->result = $m_msg->find($conditions)) {
				import(APP_PATH.'/fckeditor/fckeditor.php');
				$oFCKeditor = new FCKeditor('content') ;
				$oFCKeditor->BasePath	= 'fckeditor/';
				$oFCKeditor->Height = "500";
				$oFCKeditor->Width = "80%";
				$oFCKeditor->Value	= $this->result['content'];
				$this->editor = $oFCKeditor->CreateHtml();

				$this->display("msg_edit.tpl");
			}
			else {
				$this->jump(spUrl('msg', 'index'));
			}
		}
		else {
			$this->jump(spUrl('msg', 'index'));
		}
	}

	function update() {
		if ($id = $this->spArgs("id")) {
			$conditions = array('id' => $id);
			$title = $this->spArgs("title");
			$content = $this->spArgs("content");
			$list_id = $this->spArgs("list_id");
			$date = date('Y-m-d H:i:s',time());
			$newrow = array(
				'title' => $title,
				'content' => $content,
				'date' => $date,
				'list_id' => $list_id,
			);
			//var_dump($newrow);
			$m_msg = spClass("m_msg");
			$m_msg->update($conditions, $newrow);
		}
		$this->jump(spUrl('msg', 'index'));
	}
}
?>
