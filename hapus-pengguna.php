<?php include './includes/api.php';
akses_pengguna(array(0,1,2,3,4));
if (!empty($_GET)) {
    @$username = $_GET['username'];
    $q = $conn->prepare("DELETE FROM masuk WHERE pengguna='$username'");
    $q->execute();
    $q = $conn->prepare("DELETE FROM pengguna WHERE username='$username'");
    $q->execute();
    header('Location: ./manajemen-pengguna');
} else header('Location: ./manajemen-pengguna');