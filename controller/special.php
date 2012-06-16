<?php
class special extends spController
{
	function index() {
		$m_special = spClass("m_special");
		$this->results = $m_special->findAll();
		//var_dump($this->results);

		$this->root_special = $m_special->findAll("root_id = 0");

		import(APP_PATH.'/fckeditor/fckeditor.php');
		$oFCKeditor = new FCKeditor('content') ;
		$oFCKeditor->BasePath	= 'fckeditor/';
		$oFCKeditor->Height = "500";
		$oFCKeditor->Width = "80%";
		//$oFCKeditor->Value	= 'content';
		$this->editor = $oFCKeditor->CreateHtml();

		$this->display("special.tpl");
	}

	function show() {
		if ($id = $this->spArgs("id")) {
			$m_special = spClass("m_special");
			$this->special = $m_special->find(array('id' => $id));

			$root_id = $this->special['root_id'];
			if ($root_id == 0) {
				$root_id  = $id;
			}
			$this->root_special = $m_special->find(array('id' => $root_id));
			
			$this->special_related = $m_special->findall("root_id = $root_id");
			$this->display("special_show.tpl");
		}
	}

	function add() {
		if ($name = $this->spArgs("name")) {
			$date = date('Y-m-d H:i:s',time());
			$newrow = array(
				'name' => $name,
				'content' => $this->spArgs("content"),
				'date' => $date,
				'root_id' => $this->spArgs("root_id"),
			);
			//var_dump($newrow);
			$m_special = spClass("m_special");
			$m_special->create($newrow);
		}
		$this->jump(spUrl('special', 'index'));
	}

	function del() {
		if ($id = $this->spArgs("id")) {
			$m_special = spClass("m_special");
			$conditions = array('id' => $id);
			$m_special->delete($conditions);
		}
		$this->jump(spUrl('special', 'index'));
	}

	function edit() {
		if ($id = $this->spArgs("id")) {
			$conditions = array('id' => $id);
			$m_special = spClass("m_special");

			$this->root_special = $m_special->findAll("root_id = 0");

			if ($this->result = $m_special->find($conditions)) {
				import(APP_PATH.'/fckeditor/fckeditor.php');
				$oFCKeditor = new FCKeditor('content') ;
				$oFCKeditor->BasePath	= 'fckeditor/';
				$oFCKeditor->Height = "500";
				$oFCKeditor->Width = "80%";
				$oFCKeditor->Value	= $this->result['content'];
				$this->editor = $oFCKeditor->CreateHtml();
				$this->display("special_edit.tpl");
			}
			else 
				$this->jump(spUrl('special', 'index'));
		}
		else {
			$this->jump(spUrl('special', 'index'));
		}
	}

	function update() {
		if (($name = $this->spArgs("name")) && ($id= $this->spArgs("id"))) {
			$conditions = array('id' => $id);
			$date = date('Y-m-d H:i:s',time());
			$newrow = array(
				'name' => $name,
				'date' => $date,
				'root_id' => $this->spArgs("root_id"),
				'content' => $this->spArgs("content"),
			);
			$m_special = spClass("m_special");
			$m_special->update($conditions, $newrow);
		}
		$this->jump(spUrl('special', 'index'));
	}
}
?>
