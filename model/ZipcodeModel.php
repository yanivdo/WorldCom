
<?php

class ZipcodeModel extends Db
{

    private $conn;

    function __construct()
    {
        $this->conn = $this->connect();
    }

    function getZipcodeData()
    {
        $sql = "SELECT `id`, `country`, `country_code`, `zip`
        FROM zip_code
        GROUP BY country_code
        ORDER BY country ASC;";
        $stmt = $this->conn->prepare($sql);
        $dbResult = $stmt->execute();
        $dbResult = $stmt->get_result();
        $result = $this->returnDbData($dbResult);
        $stmt->close();
        return $result;
    }

    function getexistingZipcode($countryCode, $zipcode)
    {
        $sql = "SELECT `id`, `country`, `country_code`, `zip`
        FROM zip_code
        WHERE country_code = ? 
        AND zip = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param(
            "ss",
            $countryCode,
            $zipcode,
        );
        $dbResult = $stmt->execute();
        $dbResult = $stmt->get_result();
        $result = $this->returnDbData($dbResult);
        $stmt->close();
        return $result;
    }

    function addNewZipcode($zipCode, $name, $countryCode)
    {
        $sql = "INSERT INTO zip_code (`country`, `country_code`, `zip`)
        VALUES (?,?,?);";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param(
            "sss",
            $name,
            $countryCode,
            $zipCode,
        );
        $stmt->execute();
        $stmt->close();
        $sql = "SELECT LAST_INSERT_ID() as id;";
        $dbResult = $this->conn->query($sql);
        $result = $this->returnDbData($dbResult);
        return $result;
    }
}
