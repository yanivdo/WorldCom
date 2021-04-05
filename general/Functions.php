<?php
include './view/PlacesView.php';
class Functions
{
    function getPage($location)
    {
        $page = new PlacesView();
        switch ($location) {
            case '/':
                $pageData = $page->createView();
                break;
        }

        return $pageData;
    }

    function ajaxToFunction($location)
    {
        $locationArray = explode('/', $location);
        $view = $locationArray[1] . 'View';
        $function = $locationArray[2] . 'Ajax';
        $ajaxCall = new $view();
        $result = $ajaxCall->$function($_POST);
        return $result;
    }
}
