Attribute VB_Name = "modNuevoTimer"
'Argentum Online 0.11.6
'Copyright (C) 2002 Márquez Pablo Ignacio
'
'This program is free software; you can redistribute it and/or modify
'it under the terms of the Affero General Public License;
'either version 1 of the License, or any later version.
'
'This program is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'Affero General Public License for more details.
'
'You should have received a copy of the Affero General Public License
'along with this program; if not, you can find it at http://www.affero.org/oagpl.html
'
'Argentum Online is based on Baronsoft's VB6 Online RPG
'You can contact the original creator of ORE at aaron@baronsoft.com
'for more information about ORE please visit http://www.baronsoft.com/
'
'
'You can contact me at:
'morgolock@speedy.com.ar
'www.geocities.com/gmorgolock
'Calle 3 número 983 piso 7 dto A
'La Plata - Pcia, Buenos Aires - Republica Argentina
'Código Postal 1900
'Pablo Ignacio Márquez

Option Explicit

'
' Las siguientes funciones devuelven TRUE o FALSE si el intervalo
' permite hacerlo. Si devuelve TRUE, setean automaticamente el
' timer para que no se pueda hacer la accion hasta el nuevo ciclo.
'

' CASTING DE HECHIZOS
Public Function IntervaloPermiteLanzarSpell(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteLanzarSpell_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()

102     If TActual - UserList(UserIndex).Counters.TimerLanzarSpell >= UserList(UserIndex).Intervals.Magia Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerLanzarSpell = TActual
                ' Actualizo spell-attack
108             UserList(UserIndex).Counters.TimerMagiaGolpe = TActual

            End If

110         IntervaloPermiteLanzarSpell = True
        Else
112         IntervaloPermiteLanzarSpell = False

        End If

        
        Exit Function

IntervaloPermiteLanzarSpell_Err:
114     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteLanzarSpell", Erl)

        
End Function

Public Function IntervaloPermiteAtacar(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteAtacar_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()

102     If TActual - UserList(UserIndex).Counters.TimerPuedeAtacar >= UserList(UserIndex).Intervals.Golpe Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerPuedeAtacar = TActual
                ' Actualizo attack-spell
108             UserList(UserIndex).Counters.TimerGolpeMagia = TActual
                ' Actualizo attack-use
110             UserList(UserIndex).Counters.TimerGolpeUsar = TActual

            End If

112         IntervaloPermiteAtacar = True
        Else
114         IntervaloPermiteAtacar = False

        End If

        
        Exit Function

IntervaloPermiteAtacar_Err:
116     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteAtacar", Erl)

        
End Function

Public Function IntervaloPermiteTirar(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteTirar_Err
        

        Dim TActual As Long
    
100     TActual = GetTickCount()
    
102     If TActual - UserList(UserIndex).Counters.TimerTirar >= IntervaloTirar Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerTirar = TActual

            End If

108         IntervaloPermiteTirar = True
        Else
110         IntervaloPermiteTirar = False

        End If

        
        Exit Function

IntervaloPermiteTirar_Err:
112     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteTirar", Erl)

        
End Function

Public Function IntervaloPermiteMagiaGolpe(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteMagiaGolpe_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()
    
102     If TActual - UserList(UserIndex).Counters.TimerLanzarSpell >= UserList(UserIndex).Intervals.MagiaGolpe Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerMagiaGolpe = TActual

            End If

108         IntervaloPermiteMagiaGolpe = True
        Else
110         IntervaloPermiteMagiaGolpe = False

        End If

        
        Exit Function

IntervaloPermiteMagiaGolpe_Err:
112     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteMagiaGolpe", Erl)

        
End Function

Public Function IntervaloPermiteGolpeMagia(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteGolpeMagia_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()
    
102     If TActual - UserList(UserIndex).Counters.TimerGolpeMagia >= UserList(UserIndex).Intervals.GolpeMagia Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerGolpeMagia = TActual

            End If

108         IntervaloPermiteGolpeMagia = True
        Else
110         IntervaloPermiteGolpeMagia = False

        End If

        
        Exit Function

IntervaloPermiteGolpeMagia_Err:
112     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteGolpeMagia", Erl)

        
End Function

Public Function IntervaloPermiteGolpeUsar(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteGolpeUsar_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()
    
102     If TActual - UserList(UserIndex).Counters.TimerGolpeUsar >= UserList(UserIndex).Intervals.GolpeUsar Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerGolpeUsar = TActual

            End If

108         IntervaloPermiteGolpeUsar = True
        Else
110         IntervaloPermiteGolpeUsar = False

        End If

        
        Exit Function

IntervaloPermiteGolpeUsar_Err:
112     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteGolpeUsar", Erl)

        
End Function

' TRABAJO
Public Function IntervaloPermiteTrabajarExtraer(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteTrabajar_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()

102     If TActual - UserList(UserIndex).Counters.TimerPuedeTrabajar >= UserList(UserIndex).Intervals.TrabajarExtraer Then
104         If Actualizar Then UserList(UserIndex).Counters.TimerPuedeTrabajar = TActual
106         IntervaloPermiteTrabajarExtraer = True
        Else
108         IntervaloPermiteTrabajarExtraer = False

        End If

        
        Exit Function

IntervaloPermiteTrabajar_Err:
110     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteTrabajar", Erl)

        
End Function

Public Function IntervaloPermiteTrabajarConstruir(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteTrabajar_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()

102     If TActual - UserList(UserIndex).Counters.TimerPuedeTrabajar >= UserList(UserIndex).Intervals.TrabajarConstruir Then
104         If Actualizar Then UserList(UserIndex).Counters.TimerPuedeTrabajar = TActual
106         IntervaloPermiteTrabajarConstruir = True
        Else
108         IntervaloPermiteTrabajarConstruir = False

        End If

        
        Exit Function

IntervaloPermiteTrabajar_Err:
110     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteTrabajar", Erl)

        
End Function
Private Function pushLastTries(ByRef lastTries() As Boolean, ByVal CLK As Boolean)
    Dim i As Long
    'For i = 2 To 3
    lastTries(1) = lastTries(2)
    'Next i
    lastTries(2) = CLK
End Function
Private Function checkLastTries(ByRef lastTries() As Boolean, ByVal toCkeck As Boolean) As Boolean
    Dim i As Long
    For i = 1 To 2
        If lastTries(i) <> toCkeck Then
            checkLastTries = False
            'Debug.Print checkLastTries
            Exit Function
        End If
    Next i
    checkLastTries = True
   ' Debug.Print checkLastTries
    
End Function
' USAR OBJETOS CON U
Public Function IntervaloPermiteUsar(ByVal UserIndex As Integer, Optional ByVal CLK As Boolean) As Boolean
        
        On Error GoTo IntervaloPermiteUsar_Err

        Dim TActual As Long
        TActual = GetTickCount()
        With UserList(UserIndex)
             'Primero me fijo si intenta potear con U o con click
            If CLK Then
                 If TActual - .Counters.TimerUsarClick >= .Intervals.UsarClic Then
                    IntervaloPermiteUsar = True
                    .Counters.TimerUsarClick = TActual
                End If
            Else
                'Si lo fue valido contra el intervalo click
                If TActual - .Counters.TimerUsar >= .Intervals.UsarU Then
                    IntervaloPermiteUsar = True
                    .Counters.TimerUsar = TActual
                End If
            End If
        End With
                
        Exit Function

IntervaloPermiteUsar_Err:
110     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteUsar", Erl)

        
End Function
' USAR OBJETOS CON CLICK
Public Function IntervaloPermiteUsarClick(ByVal UserIndex As Integer) As Boolean

    Dim TActual As Long
    TActual = GetTickCount() And &H7FFFFFFF

    If TActual - UserList(UserIndex).Counters.TimerUsarClick >= UserList(UserIndex).Intervals.UsarClic Then
        IntervaloPermiteUsarClick = True
        Debug.Print "Intervalo click: " & TActual - UserList(UserIndex).Counters.TimerUsarClick
        UserList(UserIndex).Counters.TimerUsarClick = TActual
    Else
        IntervaloPermiteUsarClick = False
    End If

End Function
Public Function IntervaloPermiteUsarArcos(ByVal UserIndex As Integer, Optional ByVal Actualizar As Boolean = True) As Boolean
        
        On Error GoTo IntervaloPermiteUsarArcos_Err
        

        Dim TActual As Long
    
100     TActual = GetTickCount()
    
102     If TActual - UserList(UserIndex).Counters.TimerPuedeUsarArco >= UserList(UserIndex).Intervals.Arco Then
104         If Actualizar Then
106             UserList(UserIndex).Counters.TimerPuedeUsarArco = TActual
                ' Tambien actualizo los otros
108             UserList(UserIndex).Counters.TimerPuedeAtacar = TActual
110             UserList(UserIndex).Counters.TimerLanzarSpell = TActual

            End If

112         IntervaloPermiteUsarArcos = True
        Else
114         IntervaloPermiteUsarArcos = False

        End If

        
        Exit Function

IntervaloPermiteUsarArcos_Err:
116     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteUsarArcos", Erl)

        
End Function

Public Function IntervaloPermiteCaminar(ByVal UserIndex As Integer) As Boolean
        
        On Error GoTo IntervaloPermiteCaminar_Err
        

        Dim TActual As Long
    
100     TActual = GetTickCount()
    
102     If TActual - UserList(UserIndex).Counters.TimerCaminar >= UserList(UserIndex).Intervals.Caminar Then
        
            '  Call AddtoRichTextBox(frmMain.RecTxt, "Usar OK.", 255, 0, 0, True, False, False)
104         UserList(UserIndex).Counters.TimerCaminar = TActual
106         IntervaloPermiteCaminar = True
        Else
108         IntervaloPermiteCaminar = False

        End If

        
        Exit Function

IntervaloPermiteCaminar_Err:
110     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteCaminar", Erl)

        
End Function

Public Function IntervaloPermiteMoverse(ByVal NpcIndex As Integer) As Boolean
        
        On Error GoTo IntervaloPermiteMoverse_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()

102     If TActual - NpcList(NpcIndex).Contadores.IntervaloMovimiento >= NpcList(NpcIndex).IntervaloMovimiento Then
    
            '  Call AddtoRichTextBox(frmMain.RecTxt, "Usar OK.", 255, 0, 0, True, False, False)
104         NpcList(NpcIndex).Contadores.IntervaloMovimiento = TActual
106         IntervaloPermiteMoverse = True
        Else
108         IntervaloPermiteMoverse = False

        End If

        
        Exit Function

IntervaloPermiteMoverse_Err:
110     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteMoverse", Erl)

        
End Function

Public Function IntervaloPermiteLanzarHechizo(ByVal NpcIndex As Integer) As Boolean
    On Error GoTo IntervaloPermiteLanzarHechizo_Err
        
100 With NpcList(NpcIndex)
102     IntervaloPermiteLanzarHechizo = GetTickCount() - .Contadores.IntervaloLanzarHechizo >= .IntervaloLanzarHechizo
    End With
        
    Exit Function

IntervaloPermiteLanzarHechizo_Err:
104 Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteLanzarHechizo", Erl)

        
End Function

Public Function IntervaloPermiteAtacarNPC(ByVal NpcIndex As Integer) As Boolean
        
        On Error GoTo IntervaloPermiteAtacarNPC_Err
        

        Dim TActual As Long

100     TActual = GetTickCount()

102     If TActual - NpcList(NpcIndex).Contadores.IntervaloAtaque >= NpcList(NpcIndex).IntervaloAtaque Then
    
            '  Call AddtoRichTextBox(frmMain.RecTxt, "Usar OK.", 255, 0, 0, True, False, False)
104         NpcList(NpcIndex).Contadores.IntervaloAtaque = TActual
106         IntervaloPermiteAtacarNPC = True
        Else
108         IntervaloPermiteAtacarNPC = False

        End If

        
        Exit Function

IntervaloPermiteAtacarNPC_Err:
110     Call TraceError(Err.Number, Err.Description, "modNuevoTimer.IntervaloPermiteAtacarNPC", Erl)

        
End Function

