<?php

include_once './controller/PlacesController.php';
include_once './view/view.php';
class PlacesView extends View
{
    private $userController;
    function __construct()
    {
        $this->userController = new PlacesController();
    }
    function createView()
    {
        $data = $this->userController->buildView();
        $innerHtml = '';
        foreach ($data as $singleData) {
            $innerHtml .= $this->createTemplate("./template/general/option.html", [
                'id' => $singleData['id'],
                'value' => $singleData['country_code'],
                'name' => $singleData['country'],
            ]);
        }
        $html = $this->createTemplate("./template/places/index.html", [
            'countrySelect' => $innerHtml
        ]);
        $finalePage = $this->attachToIndex($html);
        return $finalePage;
    }

    function searchPlaceAjax($data)
    {
        $result = $this->userController->placeAjaxController($data);
        if ($result['code'] == 0) {
            $innerHtml = '';
            foreach ($result['data']['places'] as $key => $singlePlace) {
                $innerHtml .= $this->createTemplate(
                    "./template/general/tableInner.html",
                    [
                        'name' => $singlePlace['place name'],
                        'lat' => $singlePlace['latitude'],
                        'long' => $singlePlace['longitude'],
                    ]
                );
            }
            $html = $this->createTemplate("./template/general/table.html", [
                'tableInner' => $innerHtml
            ]);
        } else {
            $html = $this->createTemplate("./template/general/errorMsg.html", []);
        }
        return $html;
    }
}
