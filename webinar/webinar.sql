
<?php

$servername = "webinar_sql";
$username = "root";
$password = "{{ password }}";
$number = rand(1,10);

$conn = new mysqli($servername, $username, $password, 'webinar');

if ($conn -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}

$sql = "SELECT firstname.id, firstname.firstname, lastname FROM lastnames INNER JOIN firstname ON firstname.id = lastnames.id WHERE firstname.id=$number";
$host = "SELECT @@hostname;";

$result = $conn->query($sql);
$hostname = $conn->query($host);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    echo $row["firstname"]. " " . $row["lastname"]. " from ";
  }
} else {
  echo "0 results";
}

if ($hostname->num_rows > 0) {
  while($row = $hostname->fetch_assoc()) {
    echo $row["@@hostname"] ;
  }
} else {
  echo "0 results";
}

$conn->close();

?>
