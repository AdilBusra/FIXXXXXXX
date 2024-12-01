unit Bayar;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Recordunit;

type

  { TForm5 }

  TForm5 = class(TForm)
    btncek: TButton;
    btnkembali5: TButton;
    btnbayar: TButton;
    edttb: TEdit;
    lbltb: TLabel;
    lblprogram: TLabel;
    lblsapa5: TLabel;
    mbayar: TMemo;
    procedure btncekClick(Sender: TObject);
    procedure btnkembali5Click(Sender: TObject);
    procedure btnbayarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure TampilkanData;
    function cektoken(inputtoken: string): Boolean;
  public

  end;

var
  Form5: TForm5;

implementation

uses
  Main2;

{$R *.lfm}

{ TForm5 }

procedure TForm5.FormCreate(Sender: TObject);
begin
  btnbayar.visible := false;
end;

procedure TForm5.btncekClick(Sender: TObject);
begin
  if cektoken(edttb.Text) then
  begin
    ShowMessage('Token valid! Menampilkan data pembelian...');
    TampilkanData;
    btnbayar.visible := true
  end
  else
  begin
    ShowMessage('Token tidak valid. Silakan coba lagi.');
    mbayar.Lines.Clear;
  end;
end;

procedure TForm5.btnkembali5Click(Sender: TObject);
begin
  Form2.show;
end;

procedure TForm5.btnbayarClick(Sender: TObject);
begin
  showmessage('Terima Kasih telah menggunakan layanan Kami, nikmati perjalanan Anda');
  Application.Terminate;
end;

function TForm5.cektoken(inputtoken: string): Boolean;
begin
  Result := (inputtoken = all.tokenbayar);
end;


procedure TForm5.TampilkanData;
var
  i: Integer;
begin
  mbayar.Lines.Clear;
  mbayar.Lines.Add('-------- Detail Pembelian --------');
  mbayar.Lines.Add('Nama: ' + all.nama);
  mbayar.Lines.Add('Token: ' + all.tokenbayar);
  mbayar.Lines.Add('');
  for i := 0 to High(all.destinasi) do
  begin
    mbayar.Lines.Add('Destinasi: Medan -> ' + all.destinasi[i]);
    mbayar.Lines.Add('Kelas: ' + all.kelas[i]);
    mbayar.Lines.Add('Harga: Rp.' + IntToStr(all.tharga[i]));
    mbayar.Lines.Add('');
  end;
  mbayar.Lines.Add('Total Keseluruhan: Rp.' + IntToStr(all.seluruh));
  mbayar.Lines.Add('');
  mbayar.Lines.Add('Silahkan Bayar');
end;


end.

