program StokWarung;
uses crt;

const
  MAX = 50;
  BATAS_HAMPIR_HABIS = 5;

type
  PBarang = ^TBarang;
  TBarang = record
    nama : string[30];
    jumlah : integer;
    hargaModal : longint;
  end;

var
  data : array[1..MAX] of PBarang;
  n : integer;

function HitungNilaiBarang(jumlah: integer; harga: longint): longint;
begin
  HitungNilaiBarang := jumlah * harga;
end;

function TotalModalStok: longint;
var
  i : integer;
  total : longint;
begin
  total := 0;
  for i := 1 to n do
    total := total + HitungNilaiBarang(data[i]^.jumlah, data[i]^.hargaModal);

  TotalModalStok := total;
end;

procedure InputBarang;
var
  i : integer;
begin
  clrscr;
  write('Berapa jumlah jenis barang? '); 
  readln(n);

  for i := 1 to n do
  begin
    new(data[i]);   

    writeln;
    writeln('Data Barang ke-', i);
    write('Nama Barang            : '); readln(data[i]^.nama);
    write('Jumlah Stok            : '); readln(data[i]^.jumlah);
    write('Harga Modal (per item) : '); readln(data[i]^.hargaModal);
  end;

  writeln;
  writeln('>> Data berhasil dimasukkan!');
  readln;
end;


var
  pilih, i : integer;
begin
  repeat
    clrscr;
    writeln(' sistem manajemen stok warung ');
    writeln('1. Input Data Barang');
    writeln('2. Tampilkan Stok');
    writeln('3. Tampilkan barang menipis');
    writeln('4. Hitung Total Modal Stok');
    writeln('5. Keluar');
    writeln;

    write('Pilih menu: '); 
    readln(pilih);

    case pilih of

      
      1: InputBarang;

     
      2: begin
           clrscr;
           writeln('=== DAFTAR SEMUA BARANG ===');
           for i := 1 to n do
           begin
             writeln(i, '. ', data[i]^.nama,
             ' | Stok: ', data[i]^.jumlah,
             ' | Harga: Rp', data[i]^.hargaModal,
             ' | Nilai Total: Rp', HitungNilaiBarang(data[i]^.jumlah, data[i]^.hargaModal));
           end;
           readln;
         end;

      3: begin
           clrscr;
           writeln('=== BARANG HAMPIR HABIS (Stok < ', BATAS_HAMPIR_HABIS, ') ===');
           for i := 1 to n do
             if data[i]^.jumlah < BATAS_HAMPIR_HABIS then
               writeln('- ', data[i]^.nama, ' (Stok: ', data[i]^.jumlah, ')');
           readln;
         end;

      
      4: begin
           clrscr;
           writeln('=== TOTAL NILAI MODAL SELURUH STOK ===');
           writeln('Total Modal: Rp', TotalModalStok);
           readln;
         end;

    end;

  until pilih = 5;

  writeln('Program selesai. Terima kasih!');
end;

begin
  MenuUtama;
end.