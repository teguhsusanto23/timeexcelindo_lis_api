<?php
/**
 * @package    PHP Advanced API Guide
 * @author     Teguh Susanto <teguh.susanto@gmail.com>
 * @copyright  2019 TimeExcelindo
 * @version    1.0.0
 * @since      File available since Release 1.0.0
 */

namespace TimeExcelindo\v1;

use Db;
use TimeExcelindo\Route;
use TimeExcelindo\Database\DbQuery;
use TimeExcelindo\Hospital\Item as ItemObject;
use TimeExcelindo\Util\ArrayUtils;
use TimeExcelindo\Validate;

class Item extends Route {

	public function getItems() {
		$api = $this->api;
		$sql = 'select a.*,b.NameTest AS NameTestParent FROM tm_item_pemeriksaan a LEFT JOIN tm_item_pemeriksaan b ON a.TestIDParent=b.TestID';
		$items = Db::getInstance()->executeS($sql);
		$data = array();
		$datarow = array();
		foreach ($items as $row) {
			$datarow = array('ID'=>$row['TestID'],
			'Name'=>$row['NameTest'],
			'Parent'=>$row['NameTestParent'],
			'IsParent'=>$row['IsParent'],
			'IsChild'=>$row['isChild']);
			array_push($data,$datarow);
		}
		return $api->response([
			'success' => true,
			'data' => $data,
			'count' => count($items),
		]);
	}
		public function getSubItems() {
		$api = $this->api;
		$sql = 'SELECT a.TestIDParent,b.NameTest AS NameTestParent,a.TestID,c.NameTest AS NameTestChild 
		        FROM tm_sub_item_pemeriksaan a 
				INNER JOIN tm_item_pemeriksaan b ON a.TestIDParent=b.TestID 
		        INNER JOIN tm_item_pemeriksaan c ON a.TestID=c.TestID';
		$items = Db::getInstance()->executeS($sql);
		$data = array();
		$datarow = array();
		foreach ($items as $row) {
			$datarow = array(
			'IDParent'=>$row['TestIDParent'],
			'Parent'=>$row['NameTestParent'],
			'IDChild'=>$row['TestID'],
			'Child'=>$row['NameTestChild']);
			array_push($data,$datarow);
		}
		return $api->response([
			'success' => true,
			'data' => $data,
			'count' => count($items),
		]);
	}

}


