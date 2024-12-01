unit Recordunit;

interface

type
  info = record
    nama: string;
    destinasi: array of string;
    kelas: array of string;
    tharga: array of Integer;
    seluruh: Integer;
    tokenbayar: string;
  end;

var
  all : info;
  token : string;

implementation

end.

