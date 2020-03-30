program kasir_sederhana;
uses crt;
var
  jumlah_pembelian,i          : integer;
  cetak,keluar,input_lagi    : char;
  total_harga,kembalian,bayar : longint;

  nama_barang   : array[1..100] of string;
  harga_satuan  : array[1..100] of longint;
  jumlah_barang : array[1..100] of integer;
  jumlah_harga  : array[1..100] of longint;


procedure input_barang_dibeli;
begin
  write('Nama Barang  : '); readln(nama_barang[jumlah_pembelian]);
  write('Harga Satuan : '); readln(harga_satuan[jumlah_pembelian]);
  write('Jumlah       : '); readln(jumlah_barang[jumlah_pembelian]);
  writeln;
end;

procedure hitung_jumlah_harga;
begin
  for i:=1 to jumlah_pembelian do
  begin
    jumlah_harga[i] := harga_satuan[i] * jumlah_barang[i];
  end;
end;

procedure hitung_total;
begin
  total_harga := 0;
  for i:=1 to jumlah_pembelian do
  begin
    total_harga := total_harga + jumlah_harga[i];
  end;
end;

procedure pembayaran;
begin
  clrscr;
  writeln ('+----------------------------------+');
  writeln ('|     APLIKASI KASIR SEDERHANA     |');
  writeln ('|           PEMBAYARAN             |');
  writeln ('+----------------------------------+');
  writeln;
  writeln('Total Harga = ', total_harga);
  write('Uang bayar  : ');readln(bayar);

  kembalian := bayar - total_harga;

  write('Kembalian   = ', kembalian);
end;

procedure cetak_struk;
begin
  clrscr;
  writeln ('    TOKO BUDI MAKMUR    ');
  writeln ('Jl. A. Yani KM 21 No. 10');
  writeln ('------------------------');

  for i:=1 to jumlah_pembelian-1 do
  begin
    writeln (nama_barang[i]);
    writeln ('   ',harga_satuan[i],' x ',jumlah_barang[i],' = ',jumlah_harga[i]);
  end;

  writeln('-------------------------');
  writeln('Total = ', total_harga);
  writeln('Bayar = ',bayar);
  writeln('Kembalian = ',kembalian);
  writeln('-------------------------');
  writeln('BARANG YANG TELAH DIIBELI');
  writeln('TIDAK DAPAT DIKEMBALIKAN');
  writeln('      TERIMAKASIH       ');
  writeln('-------------------------');
  readln;
end;

{*
 * Program Utama
 *}

begin
  keluar := 'n';
  repeat // perulangan seluruh sistem kasir
    begin
      clrscr;
      jumlah_pembelian:=1;
      input_lagi:='y';

      writeln ('+----------------------------------+');
      writeln ('|     APLIKASI KASIR SEDERHANA     |');
      writeln ('|            Versi 1.0             |');
      writeln ('+----------------------------------+');
      writeln;
      repeat // perulangan input barang
        begin
          input_barang_dibeli;
          jumlah_pembelian:=jumlah_pembelian+1;
          write('input Lagi ? (y/N) : ');input_lagi:=ReadKey;
          writeln;
          writeln('--------------------------------');
          writeln;
        end;
      until ((input_lagi='n') or (input_lagi='N'));

      hitung_jumlah_harga;
      hitung_total;
      pembayaran;
      writeln;
      writeln;
      write ('Cetak struk pembelian ? (Y/n) : ');cetak := ReadKey;
      if ((cetak = 'y') OR (cetak = 'Y')) then cetak_struk;
    end;
    writeln;
    write ('Keluar dari Aplikasi Kasir ? : '); keluar:=ReadKey;
  until ((keluar = 'y') or (keluar='Y'));
end.


