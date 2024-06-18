unit ClinicPlus.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.TabControl, FMX.ListBox, FMX.Layouts, FMX.MultiView,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON,
  FMX.Edit;

type
  TClinicPlusForm = class(TForm)
    TopRCT: TRectangle;
    MenuBTN: TButton;
    Label1: TLabel;
    AtualizarBTN: TButton;
    BottonRCT: TRectangle;
    ScheduleLYT: TLayout;
    SchedulePTH: TPath;
    HomeLYT: TLayout;
    HomePTH: TPath;
    HistoryLYT: TLayout;
    HistoryPTH: TPath;
    AnimeLYT: TLayout;
    AnimeRCT: TRectangle;
    MultiView1: TMultiView;
    MenuLST: TListBox;
    ListBox1: TListBox;
    ListBoxItem: TListBoxItem;
    TListBoxItem: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ContentTBC: TTabControl;
    ScheduleTBC: TTabItem;
    HomeTBC: TTabItem;
    HistoryTBC: TTabItem;
    ScheduleLTV: TListView;
    HistoryLTV: TListView;
    Layout1: TLayout;
    Circle1: TCircle;
    NameLBL: TLabel;
    CPFLBL: TLabel;
    ClienteMTB: TFDMemTable;
    AgendamentoMTB: TFDMemTable;
    HistoricoMTB: TFDMemTable;
    ClienteMTBidcliente: TAutoIncField;
    ClienteMTBcpf: TStringField;
    ClienteMTBnome: TStringField;
    ClienteMTBnascimento: TDateTimeField;
    ClienteMTBfoto: TBlobField;
    AgendamentoMTBidagendamento: TAutoIncField;
    AgendamentoMTBidfuncionario: TIntegerField;
    AgendamentoMTBidcliente: TIntegerField;
    AgendamentoMTBidlocal: TIntegerField;
    AgendamentoMTBidadmin: TIntegerField;
    AgendamentoMTBdata_agendamento: TDateField;
    AgendamentoMTBhora_agendamento: TTimeField;
    AgendamentoMTBdata_atendimento: TDateField;
    AgendamentoMTBhora_atendimento: TTimeField;
    AgendamentoMTBdata_confirmacao: TDateTimeField;
    AgendamentoMTBdata_cadastro: TDateTimeField;
    AgendamentoMTBfg_status: TStringField;
    AgendamentoMTBprofissional: TStringField;
    AgendamentoMTBpaciente: TStringField;
    AgendamentoMTBlocal: TStringField;
    HistoricoMTBidagendamento: TAutoIncField;
    HistoricoMTBidfuncionario: TIntegerField;
    HistoricoMTBidcliente: TIntegerField;
    HistoricoMTBidlocal: TIntegerField;
    HistoricoMTBidadmin: TIntegerField;
    HistoricoMTBdata_confirmacao: TDateTimeField;
    HistoricoMTBid_agendamento: TDateField;
    HistoricoMTBdata_atendimento: TDateField;
    HistoricoMTBhora_atendimento: TTimeField;
    HistoricoMTBdata_cadastro: TDateTimeField;
    HistoricoMTBfg_status: TStringField;
    HistoricoMTBprofissional: TStringField;
    HistoricoMTBpaciente: TStringField;
    HistoricoMTBlocal: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    HistoricoMTBdata_agendamento: TDateField;
    HistoricoMTBhora_agendamento: TTimeField;
    TLabel: TLabel;
    Label2: TLabel;
    IDEDT: TEdit;
    Label3: TLabel;
    CPFEDT: TEdit;
    Button1: TButton;
    ListBoxItem1: TListBoxItem;
    LoginFotoCir: TCircle;
    procedure ScheduleLYTClick(Sender: TObject);
    procedure HomeLYTClick(Sender: TObject);
    procedure ScheduleLTVUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ScheduleLTVButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure AtualizarBTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HistoryLYTClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetAgendamentoAtivo (const AToken: string);
    procedure GetHistorico (const AToken: string);
    procedure GetCliente (const Atoken: String);
    procedure LoadCliente (const AToken: String);
    procedure ChangeSchedule (const AID: Integer; JSON: TJSONObject) ;
    procedure Login (const ID, CPF: String);
  end;


const
  EnderecoServidor = 'http://localhost:9000/';
  EnderecoServidorAgendamento = 'http://localhost:9000/agendamento;';
//  Token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MTg3MTA2OTMs' +
//  'ImV4cCI6MTcxODc5NzA5MywiaXNzIjoibG9jYWxob3N0IiwiaWQiOiIxIiwibm9tZSI6IkRFTklMU0'+
// ' 9OIE1PUklMSU4iLCJjcGYiOiI0NDQuNDQ0LjQ0NC00NCIsIm5hc2NpbWVudG8iOiIxOFwvMTB'+
//  'cLzE5NzIifQ.uLlydIn7P-JE2Dg0ZZOjodfBEpU2LiachrcW7lwL_Eo';
var
  ClinicPlusForm: TClinicPlusForm;
  UserID: Integer;
  Token: String;


implementation

uses FMX.Ani, RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D, DataSet.Serialize, System.threading;

{$R *.fmx}

procedure TClinicPlusForm.AtualizarBTNClick(Sender: TObject);

begin
//   TTask.Run(procedure
//   begin
//     GetAgendamentoAtivo(Token);
//     GetHistorico(Token);
//     GetCliente(Token);
//     LoadCliente(Token);
//   end);
   MultiView1.ShowMaster;
   IDEDT.SetFocus;
end;

procedure TClinicPlusForm.Button1Click(Sender: TObject);
begin

  if (IDEDT.Text = '') or (CPFEDT.Text = '') then
  raise Exception.Create('Informe o ID e o CPF');

  begin
    Login(IDEDT.Text, CPFEDT.Text);

    LoadCliente(Token);
    GetAgendamentoAtivo(Token);
    GetHistorico(Token);

    TThread.Synchronize(TThread.Current, procedure begin
      LoginFotoCIR.Fill.Bitmap.Assign( Circle1.Fill.Bitmap ) ;

      MultiView1.HideMaster;
    end);
  end;
end;

procedure TClinicPlusForm.ChangeSchedule(const AID: Integer; JSON: TJSONObject);
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento')
    .ResourceSuffix(AID.ToString)
    .AddBody(JSON, False)
    .Accept('application/json')
    .Put;
end;

procedure TClinicPlusForm.FormCreate(Sender: TObject);
begin
 TDataSetSerializeConfig.GetInstance.CaseNameDefinition :=TCaseNameDefinition.cndLower;
 AnimeRCT.Position.X := HomeLYT.Position.X;
//userID:=1
end;

procedure TClinicPlusForm.GetAgendamentoAtivo(const Atoken: string);
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento')
    .AddHeader('Authorization', AToken, [poDoNotEncode])
    .AddParam( 'fg_status','a')
//    .AddParam('idcliente', User.ToString)
    .Accept('application/json')
//    .DataSetAdapter(AgendamentoMTB)
     .Adapters(TDataSetSerializeAdapter.New(AgendamentoMTB))
    .Get;
end;

procedure TClinicPlusForm.GetCliente(const AToken: string);
begin
  TRequest.New.BaseURL(EnderecoServidor+'cliente')
  .AddHeader('Authorization', AToken, [poDoNotEncode])
//     .ResourceSuffix(ID.ToString)
     .Accept('application/json')
//     .DataSetAdapter (ClienteMTB)
     .Adapters(TDataSetSerializeAdapter.New(ClienteMTB))
     .Get;
end;

procedure TClinicPlusForm.GetHistorico(const AToken: string);
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento')
  .AddHeader('Authorization', AToken, [poDoNotEncode])
//  .AddParam('idcliente' ,User.ToString)
  .Accept('application/json')
//  .DataSetAdapter (HistoricoMTB)
  .Adapters(TDataSetSerializeAdapter.New(HistoricoMTB))
  .Get;
end;

procedure TClinicPlusForm.HistoryLYTClick(Sender: TObject);
begin
  TAnimator
    .AnimateFloat (  AnimeRCT , 'position.x' , HistoryLYT.Position.X, 0.5,
    TAnimationType.Out, TInterpolationType.Bounce);

  ContentTBC
    .SetActiveTabWithTransitionAsync ( HistoryTBC, TTabTransition.Slide, TTabTransitionDirection.Normal, nil );
end;

procedure TClinicPlusForm.HomeLYTClick(Sender: TObject);
var
TabDirection: TTabTransitionDirection;

begin
  if ContentTBC.ActiveTab.Index > HomeTBC.Index then TabDirection := TTabTransitionDirection.Reversed
  else
  TabDirection := TTabTransitionDirection.normal;

  TAnimator
    .AnimateFloat ( AnimeRCT, 'position.x', HomeLYT.Position.X, 0.5, TAnimationType.Out, TInterpolationType.Bounce );

  ContentTBC
   .SetActiveTabWithTransitionAsync ( HomeTBC, TTabTransition.Slide, TabDirection, nil );
end;

procedure TClinicPlusForm.LoadCliente(const AToken: string);
var
  FotoStream: TMemoryStream;
  BrushBmp: TBrushBitMap;
begin
  GetCliente (AToken);

  TThread.Synchronize (TThread.CurrentThread, procedure
  begin
    NameLBL.Text := ClienteMTBnome.AsString;
    CPFLBL.Text := ClienteMTBCPF.AsString;

    FotoStream := TMemoryStream.Create;
    BrushBmp := TBrushBitmap.Create;

    try
      ClienteMTBFoto.SaveToStream(FotoStream);
      BrushBmp.Bitmap.LoadFromStream(FotoStream);
      BrushBmp.WrapMode := TWrapMode.TileStretch;
      Circle1.Fill.Bitmap.Assign(BrushBmp);
    finally
       FotoStream.Free;
       BrushBmp.Free;
    end;
  end);

end;

procedure TClinicPlusForm.Login(const ID, CPF: String);
var
  JSON: TJSONObject;
  Resposta: IResponse;
begin
  JSON := TJSONObject.Create;
  try
    JSON.AddPair('idcliente', ID);
    JSON.AddPair('cpf', cpf);
    try
      Resposta := TRequest.New
                     .BaseURL(EnderecoServidor+'token')
                     .AddBody(JSON, False)
                     .Accept('aplication/json')
                     .Post;
    if Resposta.StatusCode = 200 then begin

      Token := 'Bearer  ' +Resposta.Content;
    end
    else begin
      ShowMessage ('Falha na autebticação: ' +Resposta.Content);
    end;
    except
     On E:Exception do begin
       ShowMessage('Falha no login: ' +E.Message);
     end;
    end;
    finally
       JSON.Free;

    end;


  end;



procedure TClinicPlusForm.ScheduleLTVButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
var
  JSON: TJSONObject;
begin
   if AObject.Name.ToLower = 'confirmaButton' then
   begin
     AgendamentoMTB.Edit;
     AgendamentoMTBfg_status.AsString := 'C';
     AgendamentoMTBdata_confirmacao.Value := NOW;
     AgendamentoMTB.Post;
     JSON := AgendamentoMTB.ToJSONObject () ;
     ChangeSchedule (AgendamentoMTBidagendamento.Value, JSON);
     JSON.Free;
   end;

   if AObject.Name.ToLower = 'cancelabuttorn' then
   begin
     AgendamentoMTB.Edit;
     AgendamentoMTBfg_status.AsString := 'I';
     AgendamentoMTBdata_confirmacao.Value := NOW;
     AgendamentoMTB.Post;
     JSON := AgendamentoMTB.ToJSONObject () ;
     ChangeSchedule (AgendamentoMTBidagendamento.Value, JSON);
     JSON.Free;
   end;

   TTask.Run(procedure
   begin
     Sleep (50);
     AgendamentoMTB.EmptyDataSet;
     HistoricoMTB.EmptyDataSet;
     GetAgendamentoAtivo(Token);
     GetHistorico(Token);
   end) ;
end;

procedure TClinicPlusForm.ScheduleLTVUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
   AItem.Objects.DrawableByName ('ConfirmaButton') .Height := 37;
   AItem.Objects.DrawableByName ('CancelaButton')  .Height := 37;
end;

procedure TClinicPlusForm.ScheduleLYTClick(Sender: TObject);
begin
  TAnimator
    .AnimateFloat (  AnimeRCT , 'position.x' , ScheduleLYT.Position.X, 0.5,
    TAnimationType.Out, TInterpolationType.Bounce);

  ContentTBC
    .SetActiveTabWithTransitionAsync ( ScheduleTBC, TTabTransition.Slide, TTabTransitionDirection.Reversed, nil );
end;

END.
