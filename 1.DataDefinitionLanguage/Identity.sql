/* identity(1,1) digunakan untuk auto increment dan (1,1) id dimulai dari angka 1 dan 
	1 untuk jumlah penambahan setiap ada data baru. Ketika menggunakan identity, tipe datanyanya harus int (numeric)
*/

-- membuat table mahasiswa dengan identity
create table mahasiswa(
mahasiswa_id int primary key identity(1,1),
name varchar(100),
phone varchar(15),
address varchar(200),
create_at date);

-- menampilkan semua isi dari table mahasiswa
select * from mahasiswa;

-- memasukan data ke dalam table mahasiswa
insert into mahasiswa(name)values('dana');
insert into mahasiswa(name)values('budi');

-- memasukan data ke dalam table mahasiswa dengan id dimasukan secara manual
insert into mahasiswa(mahasiswa_id,name)values(3,'dana');

/*
ketika memasukan id secara manual maka akan muncul error: Cannot insert explicit value for identity column in table 
'mahasiswa' when IDENTITY_INSERT is set to OFF. Karena pada awal membuat table, kolom mahasiswa_id sudah diset menjadi identity.
Untuk memasukan id secara manual maka harus melakukan perintah "set identity_insert mahasiswa on". 
*/

-- set identity_insert mahasiswa on untuk mengatur agar id dapat dimasukkan secara manual
set identity_insert mahasiswa on

-- memasukan data ke dalam table mahasiswa dengan id secara identity tetapi dalam keadaan "set identity_insert mahasiswa on"
insert into mahasiswa(name)values('ari');

/*
ketika memasukan id secara identity tetapi dalam keadaan "set identity_insert mahasiswa on" maka akan muncul error:
Explicit value must be specified for identity column in table 'mahasiswa' either when IDENTITY_INSERT is set to ON or when a 
replication user is inserting into a NOT FOR REPLICATION identity column. Karena pada kolom mahasiswa_id sudah diganti menjadi 
"set identity_insert mahasiswa on" yang dimana id hanya dapat dimasukan secara manual. Ketika ingin membuat id menjadi identity kembali
maka lakukan perintah "set identity_insert mahasiswa off"
*/

-- set identity_insert mahasiswa off untuk mengatur agar id dapat dimasukkan secara identity
set identity_insert mahasiswa off

-- memasukan data ke dalam table mahasiswa dengan id secara identity dalam keadaan "set identity_insert mahasiswa off"
insert into mahasiswa(name)values('ariana');