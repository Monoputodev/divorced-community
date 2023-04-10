<?php

namespace App\Lib;

class CurlRequest
{

    /**
     * GET request using curl
     *
     * @return mixed
     */
    public static function curlContent($url, $header = null)
    {
        if (!extension_loaded('curl')) {
            throw new \Exception('The cURL extension is not loaded. Please enable it in your PHP configuration.');
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        if ($header) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }


    /**
     * POST request using curl
     *
     * @return mixed
     */
    public static function curlPostContent($url, $postData = null, $header = null)
    {
        if (!extension_loaded('curl')) {
            throw new \Exception('The cURL extension is not loaded. Please enable it in your PHP configuration.');
        }

        if (is_array($postData)) {
            $params = http_build_query($postData);
        } else {
            $params = $postData;
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        if ($header) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
}
