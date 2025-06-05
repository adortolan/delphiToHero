inherited PageUsuarios: TPageUsuarios
  Caption = 'PageUsuarios'
  ExplicitLeft = -457
  ExplicitTop = 2
  PixelsPerInch = 96
  TextHeight = 19
  inherited pnlPrincipal: TPanel
    inherited pnlMain: TPanel
      inherited pnlMainBody: TPanel
        inherited pnlMainBodyData: TPanel
          inherited pnlMainBodyDataForm: TPanel
            object StackPanel1: TStackPanel
              Left = 25
              Top = 0
              Width = 336
              Height = 316
              Align = alLeft
              BevelOuter = bvNone
              ControlCollection = <
                item
                  Control = Label1
                end
                item
                  Control = edtCodigo
                end>
              HorizontalPositioning = sphpFill
              TabOrder = 1
              object Label1: TLabel
                Left = 0
                Top = 0
                Width = 336
                Height = 19
                Caption = 'C'#243'digo'
              end
              object edtCodigo: TEdit
                Left = 0
                Top = 21
                Width = 336
                Height = 27
                TabOrder = 0
                Text = 'edtCodigo'
              end
            end
          end
        end
      end
    end
  end
end
