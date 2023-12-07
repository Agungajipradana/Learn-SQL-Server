/*
Perintah TRUNCATE TABLE pada SQL Server digunakan untuk menghapus semua data dari sebuah tabel, tetapi tidak menghapus struktur tabel itu sendiri.
Perintah ini dapat menjadi alternatif yang lebih efisien daripada menggunakan DELETE dalam beberapa situasi, terutama ketika Anda ingin menghapus 
seluruh data dari tabel tanpa mempengaruhi struktur tabel atau mempertahankan log transaksi yang besar.

Berikut adalah sintaksis dasar dari perintah TRUNCATE TABLE:

	TRUNCATE TABLE nama_tabel;

nama_tabel: Nama tabel yang akan di-truncate, yaitu menghapus semua baris data dari tabel tersebut.

Contoh penggunaan:

	TRUNCATE TABLE Employee;

Beberapa poin penting terkait TRUNCATE TABLE:

	1.Hanya untuk Tabel:
		Perintah ini hanya dapat digunakan pada tabel. Tidak dapat digunakan pada tampilan (view) atau objek lain.

	2.Tidak Dapat Menggunakan WHERE Clause:
		TRUNCATE TABLE tidak mendukung klausa WHERE. Ini berarti Anda tidak dapat menghapus subset tertentu dari data berdasarkan kondisi tertentu. 
		Jika Anda perlu melakukan penghapusan data berdasarkan kondisi, Anda harus menggunakan perintah DELETE.

	3.Lebih Efisien dari DELETE:
		TRUNCATE TABLE biasanya lebih efisien daripada DELETE, terutama ketika Anda ingin menghapus semua data dari tabel. 
		Ini karena TRUNCATE TABLE tidak menyimpan setiap baris yang dihapus dalam log transaksi dan tidak memicu triger penghapusan baris.

	4.Tidak Mengubah IDENTITY Seed:
		Jika tabel memiliki kolom IDENTITY, TRUNCATE TABLE tidak mengubah nilai seed IDENTITY seperti halnya DELETE. 
		Seed tetap pada nilai yang terakhir digunakan.

Perlu diingat bahwa meskipun TRUNCATE TABLE lebih cepat daripada DELETE dalam kebanyakan kasus, 
Anda harus mempertimbangkan kembali pemilihan antara keduanya tergantung pada kebutuhan spesifik Anda dan dampaknya pada data dan 
lingkungan aplikasi Anda.
*/

-- membuat table "person2"
create table person2(
	person_id int identity not null,
	first_name varchar(50) not null,
	middle_name varchar(50),
	last_name varchar(50),
	birth_date date
)

select * from person2

-- memasukan data ke dalam table "person2"
insert into person2(first_name, middle_name, last_name, birth_date)values('dana',null,'aji','2002-02-23')
insert into person2(first_name, middle_name, last_name, birth_date)values('joko',null,'ruswan','1995-02-23')
insert into person2(first_name, middle_name, last_name, birth_date)values('diki',null,null,'1998-02-23')

-- menghapus data pada table "person2" dimana "person_id=3" menggunakan perintah "delete"
delete from person2 where person_id=3

-- menghapus semua data pada table "person2" menggunakan perintah "delete"
delete from person2 

-- menghapus semua data pada table "person2" menggunakan perintah "truncate"
truncate table person2