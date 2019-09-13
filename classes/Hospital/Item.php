<?php 
/**
 * @package    TimeExcelindo
 * @author     Teguh Susanto <teguh.susanto@gmail.com>
 * @copyright  2018 TimeExcelindo
 * @version    1.0.0
 * @since      File available since Release 1.0.0
 */

namespace TimeExcelindo\Hospital;

use Db;
use TimeExcelindo\Database\DbQuery;
use TimeExcelindo\ObjectModel;

class Item extends ObjectModel {
	public $testid;
	public $testidparent;
	public $isparent;
	public $ischild;
	public $nametest;

	/**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'tm_item_pemeriksaan',
        'primary' => 'TestID',
        'fields' => array(
			'TestID' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 5),
			'TestIDParent' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 5),
			'isParent' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 1),
			'isChild' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 1),
			'NameTest' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 100),
        )
    );

     /**
     * constructor.
     *
     * @param null $id
     */
    public function __construct($id = null)
    {
        parent::__construct($id);
	}
}