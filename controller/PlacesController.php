<?php

include './model/ZipcodeModel.php';
include './model/placesModel.php';
include './general/zippopotamApi.php';
class PlacesController
{

  private $zipcodeModel;
  private $placesModel;
  private $zippopotamApi;

  function __construct()
  {
    $this->zipcodeModel = new ZipcodeModel();
    $this->placesModel = new PlacesModel();
    $this->zippopotamApi = new ZippopotamApi();
  }


  function buildView()
  {
    $data = new stdClass;
    $data = $this->zipcodeModel->getZipcodeData();
    return $data;
  }

  function placeAjaxController($postData)
  {

    $code = 0;
    $zipDetails = $this->zipcodeModel->getexistingZipcode($postData['countryCode'], $postData['zipCode']);
    if (empty($zipDetails)) {
      $result = $this->getPlaceByZipcode($postData['countryCode'], $postData['zipCode']);
      $code = $result['code'];
      $places = $result['data'];
    } else {
      $zipId = $zipDetails[0]['id'];
      $data = $this->placesModel->getPlaces($zipId);

      foreach ($data as $singleData) {
        $places['places'][] = [
          'place name' => $singleData['name'],
          'latitude' => $singleData['latitude'],
          'longitude' => $singleData['longitude']
        ];
      }
    }
    return ['data' => $places, 'code' => $code];
  }

  function getPlaceByZipcode($countryCode, $zipCode)
  {
    $errCode = 404;
    $zipId = 0;
    $apiData = $this->zippopotamApi->getPlacesApi($countryCode, $zipCode);
    if (!empty($apiData)) {
      $zipId = $this->zipcodeModel->addNewZipcode($apiData['post code'],
      $apiData['country'], $apiData['country abbreviation']);
      $zipId = $zipId[0]['id'];

      $preparePlacesDB = '';
      foreach ($apiData['places'] as $key => $singlePlace) {
        $addedCode = ',';
        if (end($apiData['places'])['place name'] == $singlePlace['place name']) {
          $addedCode = '';
        }
        $preparePlacesDB .= '("' . $singlePlace['place name'] . '", ' . $singlePlace['latitude'] . ', ' . $singlePlace['longitude'] . ', ' . $zipId . ')' . $addedCode;
      }
      $this->placesModel->insertNewPlaces($preparePlacesDB);
      $errCode = 0;
    }
    return ['id' => $zipId, 'data' => $apiData, 'code' => $errCode];
  }
}
