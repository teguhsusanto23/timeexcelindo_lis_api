<?php
/**
 * @package    PHP Advanced API Guide
 * @author     Teguh Susanto <teguh.susanto@gmail.com>
 * @copyright  2019 TimeExcelindo
 * @version    1.0.0
 * @since      File available since Release 1.0.0
 */

namespace TimeExcelindo;

use TimeExcelindo\Api;

abstract class Route
{
    /**
     * @var \Slim\Slim
     */
    protected $api;

    public function __construct(Api $api)
    {
        $this->api = $api;
    }
}
