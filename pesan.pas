unit Pesan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Recordunit;

type

  { TForm4 }

  TForm4 = class(TForm)
    btnpilih: TButton;
    btntoken: TButton;
    btnhapus: TButton;
    btnkembali: TButton;
    cbdes: TComboBox;
    cbkel: TComboBox;
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblprogram: TLabel;
    lblsapa4: TLabel;
    mhasil: TMemo;
    procedure btnhapusClick(Sender: TObject);
    procedure btnkembaliClick(Sender: TObject);
    procedure btnpilihClick(Sender: TObject);
    procedure btntokenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblprogramClick(Sender: TObject);
  private
    procedure TampilkanHasil(pdest, pkel: string; pjumlah, ptotal: Integer);
    function generatetoken(TLength: Integer): string;
    function HitungHarga(fdest, fkel : string): integer;
  public

  end;

var
  Form4: TForm4;
  TotalHarga, TotalKeseluruhan : longint;

implementation

uses
  Main2;

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin

end;

function TForm4.HitungHarga(fdest, fkel: string): Integer;
begin
  if (fdest = 'Siantar') and (fkel = 'VIP') then
    Result := 500000
  else if (fdest = 'Siantar') and (fkel = 'Bisnis') then
    Result := 350000
  else if (fdest = 'Siantar') and (fkel = 'Ekonomi') then
    Result := 200000
  else if (fdest = 'Tebing Tinggi') and (fkel = 'VIP') then
    Result := 400000
  else if (fdest = 'Tebing Tinggi') and (fkel = 'Bisnis') then
    Result := 250000
  else if (fdest = 'Tebing Tinggi') and (fkel = 'Ekonomi') then
    Result := 150000
  else if (fdest = 'Kisaran') and (fkel = 'VIP') then
    Result := 600000
  else if (fdest = 'Kisaran') and (fkel = 'Bisnis') then
    Result := 450000
  else if (fdest = 'Kisaran') and (fkel = 'Ekonomi') then
    Result := 300000
  else
    Result := 0;
end;

function TForm4.generatetoken(TLength: Integer): string;
const
  chars = '0123456789';
var
  i, index: Integer;
  temp : string;
begin
  Randomize;
  temp := '';
  index := system.Length(Chars);
  for i := 1 to TLength do
    begin
    temp := temp + Chars[Random(index)+1];
    if ((i mod 4 = 0) and (i < Tlength)) then
      temp := temp + ' ';
    end;
  Result := temp;
end;

procedure TForm4.TampilkanHasil(pdest, pkel: string; pjumlah, ptotal: Integer);
begin
  mhasil.Lines.Add('-------- Tiket Kereta Api --------');
  mhasil.Lines.Add('');
  mhasil.Lines.Add('Destinasi   : Medan -> ' + pdest);
  mhasil.Lines.Add('Kelas       : ' + pkel);
  mhasil.Lines.Add('Jumlah Tiket: ' + IntToStr(pjumlah));
  mhasil.Lines.Add('Total Harga : Rp.' + IntToStr(ptotal));
  mhasil.Lines.Add('');
  mhasil.Lines.Add('Total Keseluruhan: Rp.' + IntToStr(TotalKeseluruhan));
  mhasil.Lines.Add('');
end;

procedure TForm4.btnkembaliClick(Sender: TObject);
begin
  Form2.show;
end;

procedure TForm4.btnpilihClick(Sender: TObject);
var
  dest, kel : string;
  jtiket, HargaTiket : integer;
begin
  if (cbdes.ItemIndex = -1) or (cbkel.ItemIndex = -1) then
  begin
    ShowMessage('Silakan pilih destinasi dan kelas terlebih dahulu!');
    Exit;
  end;

  if edt1.Text = '' then
  begin
    ShowMessage('Silakan masukkan jumlah tiket!');
    Exit;
  end;

  dest := cbdes.Text;
  kel := cbkel.Text;
  jtiket := StrToIntDef(edt1.Text, 0);

  if jtiket <= 0 then
  begin
    ShowMessage('Jumlah tiket harus lebih dari 0!');
    Exit;
  end;

  HargaTiket := HitungHarga(dest, kel);
  TotalHarga := HargaTiket * jtiket;
  TotalKeseluruhan := TotalKeseluruhan + TotalHarga;


  TampilkanHasil(dest, kel, jtiket, TotalHarga);

  SetLength(all.destinasi, Length(all.destinasi) + 1);
  all.destinasi[High(all.destinasi)] := dest;
  SetLength(all.kelas, Length(all.kelas) + 1);
  all.kelas[High(all.kelas)] := kel;
  SetLength(all.tharga, Length(all.tharga) + 1);
  all.tharga[High(all.tharga)] := TotalHarga;
  all.seluruh := all.seluruh + TotalHarga;

  edt1.Text := '';
  btnpilih.Caption := 'Pesan Lagi';
end;

procedure TForm4.btntokenClick(Sender: TObject);
begin
  if Length(all.destinasi) = 0 then
  begin
    ShowMessage('Lakukan Pemesanan terlebih dahulu!');
    Exit;
  end;

  btnpilih.visible := false;
  btntoken.visible := false;
  btnhapus.visible := false;
  mhasil.lines.Add('Ini adalah token pembayaran tiket Anda');
  mhasil.Lines.add(' ');
  all.tokenbayar := generatetoken (12);
  mhasil.Lines.add(all.tokenbayar);
  mhasil.Lines.add(' ');
  mhasil.Lines.add('Masukkan token tersebut dalam menu bayar');
end;

procedure TForm4.btnhapusClick(Sender: TObject);
begin
  mhasil.Clear;
  TotalKeseluruhan := 0;
  btnpilih.Caption :='Pesan';

  SetLength(all.destinasi, 0);
  SetLength(all.kelas, 0);
  SetLength(all.tharga, 0);
  all.seluruh := 0;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  lblsapa4.caption := ' Silahkan lakukan pemesanan tiket';
end;

procedure TForm4.lblprogramClick(Sender: TObject);
begin

end;

end.

