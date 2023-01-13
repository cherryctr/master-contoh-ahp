<?php
include './includes/api.php';
akses_pengguna(array(0,1,2,3,4));

if (!empty($_POST)) {
    $pesan_error = array();
    $nama = $_POST['nama'];
    $alamat = $_POST["alamat"];
    $telp = $_POST["telp"];
    $fax = $_POST["fax"];
    $email = $_POST["email"];
    if ($nama=='') array_push($pesan_error, 'Nama tidak boleh kosong');

    if (empty($pesan_error)) {
        $q = $conn->prepare("INSERT INTO alternatif VALUE (NULL, '$nama','$alamat','$telp','$fax','$email')");
        $q->execute();
        header('Location: ./list-alternatif');
    }
}
include './includes/header.php';
?>
<div class="container-fluid">
<h3 class="m-0 font-weight-bold text-primary"><span class="fas fa-plus-circle"></span> Tambah Alternatif</h3><hr>
<form method="post" class="mx-auto" style="max-width:400px" autocomplete="off">

    <label class="mr-sm-2" for="nama">Nama Alternatif</label>
    <input id="nama" name="nama" class="form-control mb-2 mr-sm-2" type="text">

    <label for="alamat">Alamat</label>
    <input type="text" name="alamat" id="alamat" class="form-control" required="on">

    <label for="telp">No. Telp</label>
    <input type="text" name="telp" id="telp" class="form-control" required="on">

    <label for="fax">No. Fax</label>
    <input type="text" name="fax" id="fax" class="form-control" required="on">

    <label for="email">Alamat Email</label>
    <input type="text" name="email" id="email" class="form-control" required="on">

        <br />
    
    <button class="btn btn-primary" type="submit"><span class="fas fa-plus-circle"></span> Tambah</button>
    <button class="btn btn-danger" type="reset" onclick="location.href='./list-alternatif'"><span class="fas fa-times"></span> Batal</button>
    <?php if (!empty($pesan_error)) {
        echo '<hr><div class="alert alert-dismissable alert-danger"><ul>';
        foreach ($pesan_error as $x) {
            echo '<li>'.$x.'</li>';
        }
        echo '</ul></div>';
    }
    ?>
</form>
</div>
<?php include './includes/footer.php';?>