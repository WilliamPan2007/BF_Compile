VERSION 5.00
Begin VB.Form main 
   Caption         =   "IDE"
   ClientHeight    =   5430
   ClientLeft      =   5775
   ClientTop       =   3105
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5430
   ScaleWidth      =   8760
   Begin VB.CommandButton Setting 
      Caption         =   "����"
      Height          =   350
      Left            =   8050
      TabIndex        =   5
      Top             =   5100
      Width           =   700
   End
   Begin VB.CommandButton save 
      Caption         =   "����"
      Height          =   855
      Left            =   7920
      TabIndex        =   4
      Top             =   3600
      Width           =   495
   End
   Begin VB.TextBox fileplace 
      Height          =   350
      Left            =   7200
      TabIndex        =   3
      Top             =   3100
      Width           =   1500
   End
   Begin VB.CommandButton open 
      Caption         =   "��"
      Height          =   855
      Left            =   7320
      TabIndex        =   2
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton RUN 
      Caption         =   "RUN"
      Height          =   735
      Left            =   7280
      TabIndex        =   1
      Top             =   600
      Width           =   1350
   End
   Begin VB.TextBox code 
      Height          =   4695
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      ToolTipText     =   "Code Here"
      Top             =   240
      Width           =   7000
   End
End
Attribute VB_Name = "main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

End Sub

Private Sub open_Click()
    Open "C:\BFFiles\" & fileplace.Text & ".bf" For Input As #1     '�򿪴�XXX·����XXX�ļ���˫�������ʾ�ļ�λ�ú��ļ�����
    Do While Not EOF(1)
        Line Input #1, s
        code.Text = s
    Loop     'Do...Loop��ʾѭ����ȡ�ļ������ݣ�����Text1.Text=����
    Close #1     '�ر�
End Sub

Private Sub RUN_Click()
    If isAutoSave = True Then Call save_Click
    Dim fullpath As String
    If Right(App.Path, 1) = "\" Then
        fullpath = App.Path + "GC.exe"
    Else
        fullpath = App.Path + "\" + "GC.exe"
    End If
    Shell fullpath & " " & "C:\BFFiles\" & fileplace.Text & ".bf"
End Sub

Private Sub save_Click()
    Dim lj As String
    lj = "C:\BFFiles\" & fileplace.Text & ".bf"
        Open lj For Output As #1
        Print #1, code.Text
        Close #1
End Sub

Private Sub Text2_Change()

End Sub

Private Sub Setting_Click()
    Settings.Show
End Sub
