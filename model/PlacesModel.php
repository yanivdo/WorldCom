
<?php

class PlacesModel extends Db
{

    private $conn;

    function __construct()
    {
        $this->conn = $this->connect();
    }

    function getPlaces($zipId)
    {
        $sql = "SELECT `name`, `latitude`, `longitude` 
        FROM places 
        WHERE zip_id = ?;";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param(
            "i",
            $zipId
        );
        $dbResult = $stmt->execute();
        $dbResult = $stmt->get_result();
        $result = $this->returnDbData($dbResult);
        $stmt->close();
        return $result;
    }

    function insertNewPlaces($addedPlaces)
    {
        $sql = "INSERT INTO places (`name`, `latitude`, `longitude`, `zip_id`) 
        VALUES $addedPlaces;";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $stmt->close();
    }

}
