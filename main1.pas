unit Main1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Recordunit;

type
  { TForm1 }
  TForm1 = class(TForm)
    btnlanjut: TButton;
    btnkeluar1: TButton;
    edtnama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblnama: TLabel;
    lblexclam: TLabel;
    lblsapa: TLabel;
    lblprogram: TLabel;
    procedure btnkeluar1Click(Sender: TObject);
    procedure btnlanjutClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

uses
  Main2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnlanjutClick(Sender: TObject);
begin
  if edtnama.text = '' then
  begin
    ShowMessage('Nama tidak boleh kosong!');
    Exit;
  end;

  all.nama := edtnama.text;
  Form2.Show;
end;

procedure TForm1.btnkeluar1Click(Sender: TObject);
begin
  close;
  ShowMessage('Terima Kasih telah menggunakan KAM Ticket Book')
end;

end.

