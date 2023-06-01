unit Unit1;

interface
{.$DEFINE OLD_BEHAVIOR}
uses
  Windows
  , Messages
  , SysUtils
  , Variants
  , Classes
  , Graphics
  , Controls
  , Forms
  , Dialogs
  , StdCtrls
  , ExtCtrls
  {$IFDEF OLD_BEHAVIOR}
  , pngimage
  , jpeg
  {$ELSE}
  , Vcl.Imaging.pngimage
  , Vcl.Imaging.jpeg
  {$ENDIF}
  ;

type
  TForm1 = class(TForm)
    img1: TImage;
    btnLoad: TButton;
    btnClear: TButton;
    oDlg: TOpenDialog;
    btnNewLoad: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnNewLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnClearClick(Sender: TObject);
begin
  if Assigned(img1.Picture.Graphic) then
    if not img1.Picture.Graphic.Empty
      then img1.Picture.Graphic:= nil;
end;

procedure TForm1.btnLoadClick(Sender: TObject);
var
  ms: TMemoryStream;
  bm: TBitmap;
  png: TPngImage;
  jpg: TJPEGImage;
begin
  {$IFNDEF OLD_BEHAVIOR} Exit;{$ENDIF}
  bm:= TBitmap.Create;
  png:= TPngImage.Create;
  jpg:= TJPEGImage.Create;
  ms:= TMemoryStream.Create;
  ms.Clear;
  try
    try
      if oDlg.Execute then
      begin
        ms.LoadFromFile(oDlg.FileName);
        ms.Position:= 0;

        if (ExtractFileExt(oDlg.FileName) = '.png') then
        begin
//          img1.Picture.LoadFromFile(oDlg.FileName);
          png.LoadFromStream(ms);
          img1.Picture.Assign(png);
        end;
        if ((ExtractFileExt(oDlg.FileName) = '.jpg') or (ExtractFileExt(oDlg.FileName) = '.jpeg')) then
        begin
//          img1.Picture.LoadFromFile(oDlg.FileName);
          jpg.LoadFromStream(ms);
          img1.Picture.Assign(jpg);
        end;

        if (ExtractFileExt(oDlg.FileName) = '.bmp') then
        begin
//          img1.Picture.Bitmap.LoadFromFile(oDlg.FileName);
          img1.Picture.Bitmap.LoadFromStream(ms);
//          bm.LoadFromStream(ms);
//          img1.Picture.Bitmap:= bm;
        end;
      end;
    except
      on E: Exception do
      begin
        img1.Picture.Graphic:= nil;
        ShowMessage(e.Message);
      end;
    end;

  finally
    ms.Free;
    jpg.Free;
    png.Free;
    bm.Free;
  end;

end;

procedure TForm1.btnNewLoadClick(Sender: TObject);
var
  ms: TMemoryStream;
begin
{$IFDEF OLD_BEHAVIOR} Exit;{$ENDIF}
  ms:= TMemoryStream.Create;

  try
    try
      ms.Clear;
      if oDlg.Execute then
      begin
        ms.LoadFromFile(oDlg.FileName);
        ms.Position:= 0;
        img1.Picture.LoadFromStream(ms);
      end;
    except
      on E: Exception do
      begin
        img1.Picture.Graphic:= nil;
        ShowMessage(e.Message);
      end;
    end;
  finally
    FreeAndNil(ms);
  end;

//
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  oDlg.Filter:= 'Graphic (*.png;*.bmp;*.jpeg;*.jpg;|*.png;*.bmp;*.jpeg;*.jpg;|PNG Files (*.png)|*.png|Bitmap Files (*.bmp)|*.bmp|JPEG Files (*.jpeg;*.jpg)|*.jpeg;*.jpg';
end;

end.
