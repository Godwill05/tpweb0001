<?php
    require_once 'config/config.php';
    class Database{
        private $db_host = DB_HOST;
        private $db_name = DB_NAME;
        private $db_user = DB_USER;
        private $db_password = DB_PASSWORD;
        private $conn;

        public function connect() {
            try {
                $this->conn = new PDO('mysql:host={$this->db_host};db_name={$this->db_name}', $this->db_user, $this->db_password);
            } catch (\Throwable $e) {
                echo "Erreur de connexion : " .$e->getMessage();
            }
            return $this->conn;
        }
    }
?>s