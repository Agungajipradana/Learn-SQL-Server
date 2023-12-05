/*
Dalam SQL Server, Anda dapat menggunakan perintah RENAME dan DROP untuk mengubah nama atau menghapus tabel, masing-masing. 
Berikut adalah penjelasan singkat tentang keduanya:

RENAME TABLE:
Perintah RENAME digunakan untuk mengganti nama sebuah tabel. Namun, perlu diperhatikan bahwa perintah RENAME tidak selalu didukung di semua 
sistem manajemen basis data (DBMS). Untuk SQL Server, Anda lebih umum menggunakan prosedur yang melibatkan sp_rename. Contohnya:

	EXEC sp_rename 'nama_tabel_sebelum', 'nama_tabel_setelah';

Contoh:

	EXEC sp_rename 'Employee', 'Employee_backup';

Perintah tersebut akan mengubah nama tabel "Employee" menjadi "Employee_backup."

DROP TABLE:
Perintah DROP digunakan untuk menghapus tabel beserta seluruh data dan strukturnya.
Perlu diperhatikan bahwa penghapusan tabel bersifat permanen dan tidak dapat dipulihkan. Contohnya:

	DROP TABLE nama_tabel;

Contoh:

	DROP TABLE Employee;

Perintah tersebut akan menghapus tabel "Employee" beserta seluruh data yang ada di dalamnya.
Pastikan untuk sangat berhati-hati saat menggunakan perintah DROP TABLE, terutama pada lingkungan produksi, 
karena data yang dihapus tidak dapat dikembalikan tanpa backup.

DROP TABLE IF EXISTS:

Perintah ini memberikan opsi aman. Jika tabel "contoh_tabel" sudah ada, maka tabel tersebut akan dihapus.
Jika tabel "contoh_tabel" tidak ada, pernyataan ini tidak menyebabkan kesalahan, dan eksekusi skrip melanjutkan tanpa masalah.
Ini memberikan fleksibilitas dan menghindari potensi kesalahan yang terkait dengan penghapusan tabel yang tidak ada.

	DROP TABLE IF EXISTS contoh_tabel;

Dengan menggunakan IF EXISTS, Anda dapat menghindari kesalahan yang disebabkan oleh upaya menghapus tabel yang belum ada.
Ini dapat menjadi pendekatan yang lebih aman dan dapat diandalkan, terutama dalam skenario di mana tidak selalu pasti apakah tabel tersebut
sudah ada atau belum.
*/

-- merubah nama table "person" menjadi "person2"
exec sp_rename 'person', 'person2'

select * from person2

-- merubah nama table "person2" menjadi "person"
exec sp_rename 'person2','person'

select * from person

-- menghapus table "person2"
drop table person2

-- menghapus table "person2" menggunakan "if exists"
drop table if exists person2