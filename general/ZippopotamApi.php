<?php

class ZippopotamApi{

    function getPlacesApi($countryCode, $zipCode){
        $curl_handle=curl_init();
        $url = "http://api.zippopotam.us/" . $countryCode . "/" . $zipCode;
        curl_setopt($curl_handle, CURLOPT_URL,$url);
        curl_setopt($curl_handle, CURLOPT_CONNECTTIMEOUT, 2);
        curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($curl_handle);
        $result = json_decode($result, TRUE);
        curl_close($curl_handle);
        return $result;
    }
}
