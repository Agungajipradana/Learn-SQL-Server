-- membuat table mahasiswa
create table mahasiswa(
mahasiswa_id int primary key identity(1,1),
name varchar(100),
phone varchar(15),
address varchar(200),
create_at date)

-- menampilkan semua data pada table mahasiswa
select * from mahasiswa;


