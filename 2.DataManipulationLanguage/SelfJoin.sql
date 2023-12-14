/*
Self join adalah jenis penggabungan di SQL Server di mana tabel yang sama digabungkan dengan dirinya sendiri. 
Ini terjadi ketika kita memiliki kolom di dalam tabel yang memiliki hubungan dengan kolom lain di tabel yang sama. 
Self join sering digunakan untuk menangani skenario di mana kita memiliki hierarki atau struktur yang diwakili dalam satu tabel.

Contoh umum dari self join adalah ketika kita memiliki tabel karyawan yang mencakup informasi tentang karyawan dan manajernya. 
Dalam hal ini, kita mungkin memiliki kolom employee_id dan manager_id di dalam tabel yang merujuk ke kolom employee_id yang lain 
di tabel yang sama.

Berikut adalah contoh sintaks self join:

	-- Self join pada tabel karyawan
	SELECT 
		A.employee_id AS employee_id,
		A.employee_name AS employee_name,
		B.employee_id AS manager_id,
		B.employee_name AS manager_name
	FROM employee AS A
	JOIN employee AS B ON A.manager_id = B.employee_id;

Penjelasan untuk setiap bagian dari sintaks di atas:

	- FROM employee AS A: Menentukan tabel utama yang akan diambil data dari (tabel kiri) dan memberikan alias A ke tabel tersebut.

	- JOIN employee AS B ON A.manager_id = B.employee_id: Melakukan JOIN dengan tabel kedua (tabel kanan) yaitu employee 
	menggunakan kolom manager_id dari tabel utama (A) dan kolom employee_id dari tabel kedua (B) sebagai kondisi penggabungan.

Dalam contoh ini, kita mendapatkan daftar karyawan beserta informasi tentang manajernya menggunakan self join. 
Self join membantu dalam mengekspresikan hubungan hierarki di dalam tabel yang sama.
*/

select * from employee

-- Menambahkan kolom manager_id ke dalam tabel employee
ALTER TABLE employee
ADD manager_id int;

-- Menambahkan constraint foreign key ke kolom manager_id
ALTER TABLE employee
ADD CONSTRAINT fk_manager_id_employee FOREIGN KEY (manager_id) REFERENCES employee(emp_id);

-- Menetapkan nilai manager_id untuk baris dengan emp_id=23
UPDATE employee
SET manager_id = 23
WHERE emp_id = 22

/*
- employee as A: 
	Ini adalah tabel pertama (atau versi pertama dari tabel yang diberi alias A).

- employee as B: 
	Ini adalah tabel kedua (atau versi kedua dari tabel yang diberi alias B).

Penggabungan (INNER JOIN) dilakukan berdasarkan kondisi A.emp_id = B.manager_id. 
Ini berarti baris dari tabel A hanya akan dipertahankan jika emp_id dari baris tersebut sesuai dengan nilai manager_id dari 
baris di tabel B.

Contoh praktisnya adalah mengambil baris dari tabel employee yang memiliki supervisor atau manager. 
Dengan kata lain, setiap baris (pegawai) akan dipasangkan dengan baris lain yang memiliki emp_id yang sesuai dengan 
nilai manager_id-nya.

Misalnya, jika ada baris dengan emp_id = 1 dan manager_id = 1, maka baris ini akan dipertahankan dalam hasil, 
karena ada baris lain di tabel yang memiliki emp_id yang sama dengan nilai manager_id (yaitu, emp_id = 1).

Self join berguna dalam situasi di mana Anda memiliki relasi hierarkis di dalam satu tabel, 
seperti dalam struktur organisasi di mana satu karyawan dapat menjadi atasan dari karyawan lain.
*/
select * 
from employee		as A
inner join employee as B on A.emp_id = B.manager_id


/*
- employee as A: 
	Ini adalah tabel pertama (atau versi pertama dari tabel yang diberi alias A).

- employee as B: 
	Ini adalah tabel kedua (atau versi kedua dari tabel yang diberi alias B).

Penggabungan (INNER JOIN) dilakukan berdasarkan kondisi A.emp_id = B.manager_id. Ini berarti baris dari tabel A 
hanya akan dipertahankan jika emp_id dari baris tersebut sesuai dengan nilai manager_id dari baris di tabel B.

Pada hasilnya, Anda memilih kolom name dan address dari tabel A (karyawan) dan juga kolom name dari tabel B (manager). 
Kolom B.name diberi alias sebagai "Manager" untuk membedakan antara kolom name dari karyawan dan kolom name dari manajer.

Hasilnya akan menampilkan informasi karyawan bersama dengan nama manajernya, yang diperoleh melalui self join 
berdasarkan hubungan antara emp_id dan manager_id. Misalnya, jika seorang karyawan memiliki emp_id = 1 dan manager_id = 2, 
maka hasilnya akan menampilkan informasi tentang karyawan tersebut dan nama manajernya yang memiliki emp_id = 2.
*/
select 
	A.name,
	A.address,
	B.name as Manager
from employee		as A
inner join employee as B on A.emp_id = B.manager_id