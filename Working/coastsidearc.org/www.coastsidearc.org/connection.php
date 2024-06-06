<?php
    define("DB_HOST", 'mysql.pauatk5.dreamhosters.com';
    define("DB_NAME", 'carcmbrlst_20231017';
    define("DB_USER", 'carcuser';
    define("DB_PASS", 'gobbledegook'; 

    function connect() {
        try{
            $db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
            return $db_connection;
        } catch (mysqli_sql_exception $e) {
                echo "Sorry, there was a problem connecting to the database." . $e->getMessage();
                die();
        }
    }
?>
