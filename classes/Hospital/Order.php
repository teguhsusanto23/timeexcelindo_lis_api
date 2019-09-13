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

class Order extends ObjectModel {
	public $registrationno;
	public $medicalrecordno;
	public $orderControl;
	public $alternatepatientid;
	public $patientname;
	public $patientaddress;
	public $patienttype;
	public $birthdate;
	public $sex;
	public $hisordernumber;
	public $labnumber;
	public $orderdate;
	public $unitcode;
	public $unitname;
	public $cliniciancode;
	public $clinicianname;
	public $roomno;
	public $priority;
	public $paymentstatus;
	public $comment;
	public $visitno;

	/**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'tm_kunjungan_pasien',
        'primary' => 'HISOrderNumber',
        'fields' => array(
			'RegistrationNo' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 50),
			'MedicalRecordNo' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 20),
			'OrderControl' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 2),
			'AlternatePatientID' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 50),
			'PatientName' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 100),
			'PatientAddress' => array('type' => self::TYPE_STRING, 'required' => true, 'validate' => 'isString', 'size' => 200),
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