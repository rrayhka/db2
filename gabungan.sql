-- Membuat table kitas atau kitap
CREATE TABLE IF NOT EXISTS kitas (
    noKitas CHAR(11) PRIMARY KEY NOT NULL,
    detailKitas VARCHAR(20)
);


create table if not exists paspor (
    noPaspor Char(9) primary key not null,
    detailPaspor Varchar(20)
);

create table if not exists gender(
    idGender Char(1) primary key not null,
    nameGender Varchar(20)
);

create table if not exists agama(
    idAgama Char(1) primary key not null,
    nameAgama Varchar(20)
);

create table if not exists pendidikan(
    idPendidikan Char(1) primary key not null,
    namePendidikan Varchar(20)
);

create table if not exists maried(
    idMaried Char(1) primary key not null,
    dateMaried Date,
    StatusMaried Varchar(20)
);

create table if not exists citizenship(
    idCitizenship Char(1) primary key not null,
    nameCitizenship Varchar(20)
);

create table if not exists pekerjaan(
    idPekerjaan Char(2) primary key not null,
    namePekerjaan Varchar(20)
);

create table if not exists blood(
    idBlood Char(2) primary key not null,
    nameBlood Varchar(20)
);

-- table di bawah ini untuk data wilayah

create table if not exists provinsi(
    idProvinsi Char(2) primary key not null,
    nameProvinsi Varchar(20)
);

create table if not exists kabupaten(
    idKabupaten Char(4) primary key not null,
    nameKabupaten Varchar(20)
);

create table if not exists kecamatan(
    idKecamatan Char(6) primary key not null,
    nameKecamatan Varchar(20),
    kodePos Char(5)
);

create table if not exists kelurahan(
    idKelurahan Char(8) primary key not null,
    nameKelurahan Varchar(20)
);

create table if not exists dusun(
    idDusun Char(10) primary key not null,
    nameDusun Varchar(20)
);

-- table di bawah ini untuk pejabat, akta, ktp

create table if not exists jabatan(
    idJabatan Char(5) primary key not null,
    nameJabatan Varchar(20)
);

create table if not exists pejabat(
    NIP Char(18) primary key not null,
    namePejabat Varchar(50),
    startMenjabat Date,
    endMenjabat Date
);

create table if not exists akta(
    idAkta Char(16) primary key not null,
    tanggalKeluar Date,
    anakKe Char(2),
    noAl Char(10),
    noReg Char(10)
);

create table if not exists ktp(
    noKTP Char(16) primary key not null,
    tanggalPembuatan Date,
    tandaTangan blob,
    fotoKtp blob
);

-- table di bawah ini untuk kartu keluarga

create table if not exists kartuKeluarga(
    noKK Char(16) primary key not null,
    alamat Varchar(50),
    tanggalKeluar Date,
    rt Char(3),
    rw Char(3)
);

create table if not exists anggotaKeluarga(
    NIK Char(16) primary key not null,
    namaAnggota Varchar(50),
    tanggalLahir Date
);

create table if not exists hubunganKeluarga(
    idHubungan Char(2) primary key not null,
    nameHubungan Varchar(20)
);

-- alter table kabupaten
ALTER TABLE kabupaten
ADD COLUMN idProvinsi CHAR(2),
ADD CONSTRAINT FK_1PROV_MKAB FOREIGN KEY (idProvinsi) REFERENCES provinsi (idProvinsi) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table kecamatan
ALTER TABLE kecamatan
ADD COLUMN idProvinsi CHAR(2),
ADD COLUMN idKabupaten CHAR(4),
ADD CONSTRAINT FK_1KAB_MKEC FOREIGN KEY (idKabupaten) REFERENCES kabupaten (idKabupaten) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1PROV_MKEC FOREIGN KEY (idProvinsi) REFERENCES provinsi (idProvinsi) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table kelurahan
ALTER TABLE kelurahan
ADD COLUMN idProvinsi CHAR(2),
ADD COLUMN idKabupaten CHAR(4),
ADD COLUMN idKecamatan CHAR(6),
ADD CONSTRAINT FK_1PROV_MKEL FOREIGN KEY (idProvinsi) REFERENCES provinsi (idProvinsi) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KAB_MKEL FOREIGN KEY (idKabupaten) REFERENCES kabupaten (idKabupaten) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KEC_MKEL FOREIGN KEY (idKecamatan) REFERENCES kecamatan (idKecamatan) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table dusun
ALTER TABLE dusun
ADD COLUMN idProvinsi CHAR(2),
ADD COLUMN idKabupaten CHAR(4),
ADD COLUMN idKecamatan CHAR(6),
ADD COLUMN idKelurahan CHAR(8),
ADD CONSTRAINT FK_1PROV_MDUS FOREIGN KEY (idProvinsi) REFERENCES provinsi (idProvinsi) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KAB_MDUS FOREIGN KEY (idKabupaten) REFERENCES kabupaten (idKabupaten) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KEC_MDUS FOREIGN KEY (idKecamatan) REFERENCES kecamatan (idKecamatan) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KEL_MDUS FOREIGN KEY (idKelurahan) REFERENCES kelurahan (idKelurahan) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table jabatan
ALTER TABLE jabatan
ADD COLUMN NIP CHAR(18),
ADD CONSTRAINT FK_1NIP_MJAB FOREIGN KEY (NIP) REFERENCES pejabat (NIP) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table ktp
ALTER TABLE ktp
ADD COLUMN NIK CHAR(16),
ADD CONSTRAINT FK_1NIK_1KTP FOREIGN KEY (NIK) REFERENCES anggotaKeluarga (NIK) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table akta
ALTER TABLE akta
ADD COLUMN NIK CHAR(16),
ADD COLUMN NIP CHAR(18),
ADD COLUMN ang_NIK CHAR(16),  salahnya belum ada kolom di anggotaKeluarga
ADD CONSTRAINT FK_1NIP_MAKTA FOREIGN KEY (NIP) REFERENCES pejabat (NIP) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1NIK_MAKTA FOREIGN KEY (ang_NIK) REFERENCES anggotaKeluarga (NIK) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_2NIK_MAKTA FOREIGN KEY (NIK) REFERENCES anggotaKeluarga (NIK) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table kartuKeluarga
ALTER TABLE kartuKeluarga
ADD COLUMN NIP CHAR(18),
ADD CONSTRAINT FK_1NIP_MKK FOREIGN KEY (NIP) REFERENCES pejabat (NIP) ON DELETE RESTRICT ON UPDATE CASCADE;

-- alter table anggotaKeluarga
ALTER TABLE anggotaKeluarga
ADD COLUMN noKTP CHAR(16),
ADD COLUMN idBlood CHAR(2),
ADD COLUMN idPendidikan CHAR(1),
ADD COLUMN noKitas CHAR(11),
ADD COLUMN idCitizenship CHAR(1),
ADD COLUMN idGender CHAR(1),
ADD COLUMN idPekerjaan CHAR(2),
ADD COLUMN idAgama CHAR(1),
ADD COLUMN idMaried CHAR(1),
ADD COLUMN idDusun CHAR(10),
ADD COLUMN idKelurahan CHAR(8),
ADD COLUMN idKecamatan CHAR(6),
ADD COLUMN idKabupaten CHAR(4),
ADD COLUMN idProvinsi CHAR(2),
ADD COLUMN idHubungan CHAR(2),
ADD COLUMN noPaspor CHAR(9),
ADD COLUMN noKK CHAR(16),
ADD COLUMN dusKabupaten CHAR(4),
ADD COLUMN kabProvinsi CHAR(2),
ADD CONSTRAINT FK_1KTP_1AK FOREIGN KEY (noKTP) REFERENCES ktp (noKTP) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_AK_1BLOOD FOREIGN KEY (idBlood) REFERENCES blood (idBlood) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_MPEND FOREIGN KEY (idPendidikan) REFERENCES pendidikan (idPendidikan) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KITAS_1AK FOREIGN KEY (noKitas) REFERENCES kitas (noKitas) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1CITIZEN FOREIGN KEY (idCitizenship) REFERENCES citizenship (idCitizenship) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1GENDER FOREIGN KEY (idGender) REFERENCES gender (idGender) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1PEKERJAAN FOREIGN KEY (idPekerjaan) REFERENCES pekerjaan (idPekerjaan) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1AGAMA FOREIGN KEY (idAgama) REFERENCES agama (idAgama) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1MARIED FOREIGN KEY (idMaried) REFERENCES maried (idMaried) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1DUSUN FOREIGN KEY (idDusun, idKelurahan, idKecamatan, idKabupaten, idProvinsi, dusKabupaten) REFERENCES dusun (idDusun, idKelurahan, idKecamatan, idKabupaten, idProvinsi) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1KabProv FOREIGN KEY (idProvinsi, kabProvinsi) REFERENCES kabupaten (idProvinsi, idKabupaten) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1AK_1HUBUNGAN FOREIGN KEY (idHubungan) REFERENCES hubunganKeluarga (idHubungan) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1PASPOR_1AK FOREIGN KEY (noPaspor) REFERENCES paspor (noPaspor) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_1KK_1AK FOREIGN KEY (noKK) REFERENCES kartuKeluarga (noKK) ON DELETE RESTRICT ON UPDATE CASCADE;

-- ALTER TABLE anggotakeluarga
-- ADD CONSTRAINT FK_1DUSUN_MAK FOREIGN KEY (idDusun) REFERENCES dusun (idDusun) ON DELETE RESTRICT ON UPDATE CASCADE,
-- ADD CONSTRAINT FK_1KELURAHAN_MAK FOREIGN KEY (idKelurahan) REFERENCES kelurahan (idKelurahan) ON DELETE RESTRICT ON UPDATE CASCADE,
-- ADD CONSTRAINT FK_1KEC_MAK FOREIGN KEY (idKecamatan) REFERENCES kecamatan (idKecamatan) ON DELETE RESTRICT ON UPDATE CASCADE,
-- ADD CONSTRAINT FK_1KAB_MAK FOREIGN KEY (idKabupaten) REFERENCES kabupaten (idKabupaten) ON DELETE RESTRICT ON UPDATE CASCADE;

