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
use TimeExcelindo\Hospital\Order as ProductObject;
use TimeExcelindo\Util\ArrayUtils;
use TimeExcelindo\Validate;

class Order extends Route {

	public function getOrders() {
		$api = $this->api;

		// Build query
		$sql = new DbQuery();
		// Build SELECT
		$sql->select(' tm_kunjungan_pasien.*');
		// Build FROM
		$sql->from('tm_kunjungan_pasien');
		$orders = Db::getInstance()->executeS($sql);

		return $api->response([
			'success' => true,
			'data' => $orders,
			'count' => count($orders),
		]);
	}

}


