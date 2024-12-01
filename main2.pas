unit Main2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Recordunit;

type

  { TForm2 }

  TForm2 = class(TForm)
    btnkembali1: TButton;
    btnbayar: TButton;
    btnpesan: TButton;
    lblketpesan: TLabel;
    lblketbayar: TLabel;
    lblprogram: TLabel;
    lblsapa2: TLabel;
    procedure btnbayarClick(Sender: TObject);
    procedure btnkembali1Click(Sender: TObject);
    procedure btnpesanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblsapa2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses
  Main1, Pesan, Bayar;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormShow(Sender: TObject);
begin
  lblsapa2.caption := 'Halo ' + all.nama + ', silahkan pilih menu dibawah ini';
end;

procedure TForm2.lblsapa2Click(Sender: TObject);
begin

end;

procedure TForm2.btnpesanClick(Sender: TObject);
begin
  Form4.show;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.btnkembali1Click(Sender: TObject);
begin
  Form1.Show;
end;


procedure TForm2.btnbayarClick(Sender: TObject);
begin
  Form5.show;
end;

end.

