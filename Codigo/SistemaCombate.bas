Attribute VB_Name = "SistemaCombate"
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
'
'Diseño y corrección del modulo de combate por
'Gerardo Saiz, gerardosaiz@yahoo.com
'

'9/01/2008 Pablo (ToxicWaste) - Ahora TODOS los modificadores de Clase se controlan desde Balance.dat

Option Explicit

Public Const MAXDISTANCIAARCO  As Byte = 18

Public Const MAXDISTANCIAMAGIA As Byte = 18


Private Function ModificadorPoderAtaqueArmas(ByVal clase As eClass) As Single
        
        On Error GoTo ModificadorPoderAtaqueArmas_Err
        

100     ModificadorPoderAtaqueArmas = ModClase(clase).AtaqueArmas

        
        Exit Function

ModificadorPoderAtaqueArmas_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ModificadorPoderAtaqueArmas", Erl)
104     Resume Next
        
End Function

Private Function ModificadorPoderAtaqueProyectiles(ByVal clase As eClass) As Single
        
        On Error GoTo ModificadorPoderAtaqueProyectiles_Err
        
    
100     ModificadorPoderAtaqueProyectiles = ModClase(clase).AtaqueProyectiles

        
        Exit Function

ModificadorPoderAtaqueProyectiles_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ModificadorPoderAtaqueProyectiles", Erl)
104     Resume Next
        
End Function

Private Function ModicadorDañoClaseArmas(ByVal clase As eClass) As Single
        
        On Error GoTo ModicadorDañoClaseArmas_Err
        
    
100     ModicadorDañoClaseArmas = ModClase(clase).DañoArmas

        
        Exit Function

ModicadorDañoClaseArmas_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ModicadorDañoClaseArmas", Erl)
104     Resume Next
        
End Function

Private Function ModicadorApuñalarClase(ByVal clase As eClass) As Single
        
        On Error GoTo ModicadorApuñalarClase_Err
        
    
100     ModicadorApuñalarClase = ModClase(clase).ModApuñalar

        
        Exit Function

ModicadorApuñalarClase_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ModicadorApuñalarClase", Erl)
104     Resume Next
        
End Function

Private Function ModicadorDañoClaseProyectiles(ByVal clase As eClass) As Single
        
        On Error GoTo ModicadorDañoClaseProyectiles_Err
        
        
100     ModicadorDañoClaseProyectiles = ModClase(clase).DañoProyectiles

        
        Exit Function

ModicadorDañoClaseProyectiles_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ModicadorDañoClaseProyectiles", Erl)
104     Resume Next
        
End Function

Private Function ModEvasionDeEscudoClase(ByVal clase As eClass) As Single
        
        On Error GoTo ModEvasionDeEscudoClase_Err
        

100     ModEvasionDeEscudoClase = ModClase(clase).Escudo

        
        Exit Function

ModEvasionDeEscudoClase_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ModEvasionDeEscudoClase", Erl)
104     Resume Next
        
End Function

Private Function Minimo(ByVal a As Single, ByVal b As Single) As Single
        
        On Error GoTo Minimo_Err
        

100     If a > b Then
102         Minimo = b
            Else:
104         Minimo = a

        End If

        
        Exit Function

Minimo_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.Minimo", Erl)
108     Resume Next
        
End Function

Function MinimoInt(ByVal a As Integer, ByVal b As Integer) As Integer
        
        On Error GoTo MinimoInt_Err
        

100     If a > b Then
102         MinimoInt = b
            Else:
104         MinimoInt = a

        End If

        
        Exit Function

MinimoInt_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.MinimoInt", Erl)
108     Resume Next
        
End Function

Private Function Maximo(ByVal a As Single, ByVal b As Single) As Single
        
        On Error GoTo Maximo_Err
        

100     If a > b Then
102         Maximo = a
            Else:
104         Maximo = b

        End If

        
        Exit Function

Maximo_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.Maximo", Erl)
108     Resume Next
        
End Function

Function MaximoInt(ByVal a As Integer, ByVal b As Integer) As Integer
        
        On Error GoTo MaximoInt_Err
        

100     If a > b Then
102         MaximoInt = a
            Else:
104         MaximoInt = b

        End If

        
        Exit Function

MaximoInt_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.MaximoInt", Erl)
108     Resume Next
        
End Function

Private Function PoderEvasionEscudo(ByVal UserIndex As Integer) As Long
        
        On Error GoTo PoderEvasionEscudo_Err
        

100     PoderEvasionEscudo = (UserList(UserIndex).Stats.UserSkills(eSkill.Defensa) * ModEvasionDeEscudoClase(UserList(UserIndex).clase)) / 2

        
        Exit Function

PoderEvasionEscudo_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PoderEvasionEscudo", Erl)
104     Resume Next
        
End Function

Private Function PoderEvasion(ByVal UserIndex As Integer) As Long
        
        On Error GoTo PoderEvasion_Err
        

        Dim lTemp As Long

100     With UserList(UserIndex)
102         lTemp = (.Stats.UserSkills(eSkill.Tacticas) + .Stats.UserSkills(eSkill.Tacticas) / 33 * .Stats.UserAtributos(eAtributos.Agilidad)) * ModClase(.clase).Evasion
       
104         PoderEvasion = (lTemp + (2.5 * Maximo(CInt(.Stats.ELV) - 12, 0)))

        End With

        
        Exit Function

PoderEvasion_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PoderEvasion", Erl)
108     Resume Next
        
End Function

Private Function PoderAtaqueArma(ByVal UserIndex As Integer) As Long
        
        On Error GoTo PoderAtaqueArma_Err
        

        Dim PoderAtaqueTemp As Long

100     If UserList(UserIndex).Stats.UserSkills(eSkill.Armas) < 31 Then
102         PoderAtaqueTemp = (UserList(UserIndex).Stats.UserSkills(eSkill.Armas) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))
104     ElseIf UserList(UserIndex).Stats.UserSkills(eSkill.Armas) < 61 Then
106         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Armas) + UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad)) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))
108     ElseIf UserList(UserIndex).Stats.UserSkills(eSkill.Armas) < 91 Then
110         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Armas) + (2 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad))) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))
        Else
112         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Armas) + (3 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad))) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))

        End If

114     PoderAtaqueArma = (PoderAtaqueTemp + (2.5 * Maximo(CInt(UserList(UserIndex).Stats.ELV) - 12, 0)))

        
        Exit Function

PoderAtaqueArma_Err:
116     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PoderAtaqueArma", Erl)
118     Resume Next
        
End Function

Private Function PoderAtaqueProyectil(ByVal UserIndex As Integer) As Long
        
        On Error GoTo PoderAtaqueProyectil_Err
        

        Dim PoderAtaqueTemp As Long

100     If UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) < 31 Then
102         PoderAtaqueTemp = (UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) * ModificadorPoderAtaqueProyectiles(UserList(UserIndex).clase))
104     ElseIf UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) < 61 Then
106         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) + UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad)) * ModificadorPoderAtaqueProyectiles(UserList(UserIndex).clase))
108     ElseIf UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) < 91 Then
110         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) + (2 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad))) * ModificadorPoderAtaqueProyectiles(UserList(UserIndex).clase))
        Else
112         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Proyectiles) + (3 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad))) * ModificadorPoderAtaqueProyectiles(UserList(UserIndex).clase))

        End If

114     PoderAtaqueProyectil = (PoderAtaqueTemp + (2.5 * Maximo(CInt(UserList(UserIndex).Stats.ELV) - 12, 0)))

        
        Exit Function

PoderAtaqueProyectil_Err:
116     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PoderAtaqueProyectil", Erl)
118     Resume Next
        
End Function

Private Function PoderAtaqueWrestling(ByVal UserIndex As Integer) As Long
        
        On Error GoTo PoderAtaqueWrestling_Err
        

        Dim PoderAtaqueTemp As Long

100     If UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) < 31 Then
102         PoderAtaqueTemp = (UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))
104     ElseIf UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) < 61 Then
106         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) + UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad)) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))
108     ElseIf UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) < 91 Then
110         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) + (2 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad))) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))
        Else
112         PoderAtaqueTemp = ((UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling) + (3 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Agilidad))) * ModificadorPoderAtaqueArmas(UserList(UserIndex).clase))

        End If

114     PoderAtaqueWrestling = (PoderAtaqueTemp + (2.5 * Maximo(CInt(UserList(UserIndex).Stats.ELV) - 12, 0)))

        
        Exit Function

PoderAtaqueWrestling_Err:
116     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PoderAtaqueWrestling", Erl)
118     Resume Next
        
End Function

Private Function UserImpactoNpc(ByVal UserIndex As Integer, ByVal NpcIndex As Integer) As Boolean
        
        On Error GoTo UserImpactoNpc_Err

        Dim PoderAtaque As Long

        Dim Arma        As Integer

        Dim Proyectil   As Boolean

        Dim ProbExito   As Long

100     Arma = UserList(UserIndex).Invent.WeaponEqpObjIndex

102     If Arma = 0 Then Proyectil = False Else Proyectil = ObjData(Arma).Proyectil = 1

104     If Arma > 0 Then 'Usando un arma
106         If Proyectil Then
108             PoderAtaque = PoderAtaqueProyectil(UserIndex)
            Else
110             PoderAtaque = PoderAtaqueArma(UserIndex)

            End If

        Else 'Peleando con puños
112         PoderAtaque = PoderAtaqueWrestling(UserIndex)

        End If

114     ProbExito = Maximo(10, Minimo(90, 70 + ((PoderAtaque - NpcList(NpcIndex).PoderEvasion) * 0.1)))

116     UserImpactoNpc = (RandomNumber(1, 100) <= ProbExito)

118     If UserImpactoNpc Then
120         Call SubirSkillDeArmaActual(UserIndex)
        End If

        Exit Function

UserImpactoNpc_Err:
122     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UserImpactoNpc", Erl)
124     Resume Next
        
End Function

Private Function NpcImpacto(ByVal NpcIndex As Integer, ByVal UserIndex As Integer) As Boolean
        
        On Error GoTo NpcImpacto_Err
        

        '*************************************************
        'Author: Unknown
        'Last modified: 03/15/2006
        'Revisa si un NPC logra impactar a un user o no
        '03/15/2006 Maraxus - Evité una división por cero que eliminaba NPCs
        '*************************************************
        Dim Rechazo           As Boolean

        Dim ProbRechazo       As Long

        Dim ProbExito         As Long

        Dim UserEvasion       As Long

        Dim NpcPoderAtaque    As Long

        Dim PoderEvasioEscudo As Long

        Dim SkillTacticas     As Long

        Dim SkillDefensa      As Long

100     UserEvasion = PoderEvasion(UserIndex)
102     NpcPoderAtaque = NpcList(NpcIndex).PoderAtaque
104     PoderEvasioEscudo = PoderEvasionEscudo(UserIndex)

106     SkillTacticas = UserList(UserIndex).Stats.UserSkills(eSkill.Tacticas)
108     SkillDefensa = UserList(UserIndex).Stats.UserSkills(eSkill.Defensa)

        'Esta usando un escudo ???
110     If UserList(UserIndex).Invent.EscudoEqpObjIndex > 0 Then UserEvasion = UserEvasion + PoderEvasioEscudo

112     ProbExito = Maximo(10, Minimo(90, 50 + ((NpcPoderAtaque - UserEvasion) * 0.2)))

114     NpcImpacto = (RandomNumber(1, 100) <= ProbExito)

        ' el usuario esta usando un escudo ???
116     If UserList(UserIndex).Invent.EscudoEqpObjIndex > 0 Then
118         If Not NpcImpacto Then
120             If SkillDefensa + SkillTacticas > 0 Then  'Evitamos división por cero
122                 ProbRechazo = Maximo(10, Minimo(90, 100 * (SkillDefensa / (SkillDefensa + SkillTacticas))))
124                 Rechazo = (RandomNumber(1, 100) <= ProbRechazo)

126                 If Rechazo = True Then
                        'Se rechazo el ataque con el escudo
128                     Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessagePlayWave(SND_ESCUDO, UserList(UserIndex).Pos.X, UserList(UserIndex).Pos.Y))

130                     If UserList(UserIndex).ChatCombate = 1 Then
132                         Call WriteBlockedWithShieldUser(UserIndex)

                        End If

                        'Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCreateFX(UserList(UserIndex).Char.CharIndex, 88, 0))
                    End If

                End If

            End If
            
134         Call SubirSkill(UserIndex, Defensa)

        End If

        
        Exit Function

NpcImpacto_Err:
136     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.NpcImpacto", Erl)
138     Resume Next
        
End Function

Private Function CalcularDaño(ByVal UserIndex As Integer) As Long

            ' Reescrita por WyroX - 16/01/2021

            On Error GoTo CalcularDaño_Err

            Dim DañoUsuario As Long, DañoArma As Long, DañoMaxArma As Long, ModifClase As Single

100         With UserList(UserIndex)
        
                ' Daño base del usuario
102             DañoUsuario = RandomNumber(.Stats.MinHIT, .Stats.MaxHit)

                ' Daño con arma
104             If .Invent.WeaponEqpObjIndex > 0 Then
                    Dim Arma As ObjData
106                 Arma = ObjData(.Invent.WeaponEqpObjIndex)
                
                    ' Calculamos el daño del arma
108                 DañoArma = RandomNumber(Arma.MinHIT, Arma.MaxHit)
                    ' Daño máximo del arma
110                 DañoMaxArma = Arma.MaxHit

                    ' Si lanza proyectiles
112                 If Arma.Proyectil = 1 Then
                        ' Usamos el modificador correspondiente
114                     ModifClase = ModicadorDañoClaseProyectiles(.clase)

                        ' Si requiere munición
116                     If Arma.Municion = 1 And .Invent.MunicionEqpObjIndex > 0 Then
                            Dim Municion As ObjData
118                         Municion = ObjData(.Invent.MunicionEqpObjIndex)
                            ' Agregamos el daño de la munición al daño del arma
120                         DañoArma = DañoArma + RandomNumber(Municion.MinHIT, Municion.MaxHit)
122                         DañoMaxArma = Arma.MaxHit + Municion.MaxHit
                        End If
                
                    ' Arma melé
                    Else
                        ' Usamos el modificador correspondiente
124                     ModifClase = ModicadorDañoClaseArmas(.clase)
                    End If
        
                ' Daño con puños
                Else
                    ' Modificador de combate sin armas
126                 ModifClase = ModClase(.clase).DañoWrestling
            
                    ' Si tiene nudillos o guantes
128                 If .Invent.NudilloSlot > 0 Then
130                     Arma = ObjData(.Invent.NudilloObjIndex)
                    
                        ' Calculamos el daño del nudillo o guante
132                     DañoArma = RandomNumber(Arma.MinHIT, Arma.MaxHit)
                        ' Daño máximo
134                     DañoMaxArma = Arma.MaxHit
                    End If
                End If

                ' Calculo del daño
136             CalcularDaño = (3 * DañoArma + DañoMaxArma * 0.2 * Maximo(0, .Stats.UserAtributos(Fuerza) - 15) + DañoUsuario) * ModifClase
            
                ' El pirata navegando pega un 20% más
138             If .clase = eClass.Pirat And .flags.Navegando = 1 Then
140                 CalcularDaño = CalcularDaño * 1.2
                End If
            
                ' Daño del barco
142             If .flags.Navegando = 1 And .Invent.BarcoObjIndex > 0 Then
144                 CalcularDaño = CalcularDaño + RandomNumber(ObjData(.Invent.BarcoObjIndex).MinHIT, ObjData(.Invent.BarcoObjIndex).MaxHit)

                ' Daño de la montura
146             ElseIf .flags.Montado = 1 And .Invent.MonturaObjIndex > 0 Then
148                 CalcularDaño = CalcularDaño + RandomNumber(ObjData(.Invent.MonturaObjIndex).MinHIT, ObjData(.Invent.MonturaObjIndex).MaxHit)
                End If

            End With
        
            Exit Function

CalcularDaño_Err:
150      Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.CalcularDaño", Erl)
152      Resume Next
        
End Function

Private Sub UserDañoNpc(ByVal UserIndex As Integer, ByVal NpcIndex As Integer)

        ' Reescrito por WyroX - 16/01/2021
        
        On Error GoTo UserDañoNpc_Err

100     With UserList(UserIndex)

            Dim Daño As Long, DañoBase As Long, DañoExtra As Long, Color As Long, DañoStr As String

102         If .Invent.WeaponEqpObjIndex = EspadaMataDragonesIndex And NpcList(NpcIndex).NPCtype = DRAGON Then
                ' Espada MataDragones
104             DañoBase = NpcList(NpcIndex).Stats.MinHp + NpcList(NpcIndex).Stats.def
                ' La pierde una vez usada
106             Call QuitarObjetos(EspadaMataDragonesIndex, 1, UserIndex)
            Else
                ' Daño normal
108             DañoBase = CalcularDaño(UserIndex)

                ' NPC de pruebas
110             If NpcList(NpcIndex).NPCtype = DummyTarget Then
112                 Call DummyTargetAttacked(NpcIndex)
                End If
            End If
            
            ' Color por defecto rojo
114         Color = vbRed

            ' Defensa del NPC
116         Daño = DañoBase - NpcList(NpcIndex).Stats.def

118         If Daño < 0 Then Daño = 0

            ' Mostramos en consola el golpe
120         If .ChatCombate = 1 Then
122             Call WriteLocaleMsg(UserIndex, "382", FontTypeNames.FONTTYPE_FIGHT, PonerPuntos(Daño))
            End If

            ' Golpe crítico
124         If PuedeGolpeCritico(UserIndex) Then
                ' Si acertó - Doble chance contra NPCs
126             If RandomNumber(1, 100) <= ProbabilidadGolpeCritico(UserIndex) * 1.5 Then
                    ' Daño del golpe crítico (usamos el daño base)
128                 DañoExtra = DañoBase * ModDañoGolpeCritico
                
                    ' Mostramos en consola el daño
130                 If .ChatCombate = 1 Then
132                     Call WriteLocaleMsg(UserIndex, "383", FontTypeNames.FONTTYPE_FIGHT, PonerPuntos(DañoExtra))
                    End If

                    ' Color naranja
134                 Color = RGB(225, 165, 0)
                End If

            ' Apuñalar (le afecta la defensa)
136         ElseIf PuedeApuñalar(UserIndex) Then
                ' Si acertó - Doble chance contra NPCs
138             If RandomNumber(1, 100) <= ProbabilidadApuñalar(UserIndex) * 1.5 Then
                    ' Daño del apuñalamiento
140                 DañoExtra = Daño * ModicadorApuñalarClase(.clase)
                
                    ' Mostramos en consola el daño
142                 If .ChatCombate = 1 Then
144                     Call WriteLocaleMsg(UserIndex, "212", FontTypeNames.FONTTYPE_FIGHT, PonerPuntos(DañoExtra))
                    End If

                    ' Color amarillo
146                 Color = vbYellow
                End If

                ' Sube skills en apuñalar
148             Call SubirSkill(UserIndex, Apuñalar)
            End If
            
150         If DañoExtra > 0 Then
152             Daño = Daño + DañoExtra

154             DañoStr = PonerPuntos(Daño)
                
                ' Mostramos el daño total en consola
156             If .ChatCombate = 1 Then
158                 Call WriteLocaleMsg(UserIndex, "384", FontTypeNames.FONTTYPE_FIGHT, DañoStr)
                End If
                
160             DañoStr = "¡" & DañoStr & "!"
            Else
162             DañoStr = PonerPuntos(Daño)
            End If

            ' Daño sobre el tile
164         Call SendData(SendTarget.ToNPCArea, NpcIndex, PrepareMessageTextCharDrop(DañoStr, NpcList(NpcIndex).Char.CharIndex, Color))

            ' Experiencia
166         Call CalcularDarExp(UserIndex, NpcIndex, Daño)

            ' Restamos el daño al NPC
168         NpcList(NpcIndex).Stats.MinHp = NpcList(NpcIndex).Stats.MinHp - Daño

            ' NPC de invasión
170         If NpcList(NpcIndex).flags.InvasionIndex Then
172             Call SumarScoreInvasion(NpcList(NpcIndex).flags.InvasionIndex, UserIndex, Daño)
            End If

            ' Muere el NPC
174         If NpcList(NpcIndex).Stats.MinHp <= 0 Then
                ' Drop items, respawn, etc.
176             Call MuereNpc(NpcIndex, UserIndex)
            Else
                Call SendData(SendTarget.ToNPCArea, NpcIndex, PrepareMessageNpcUpdateHP(NpcIndex))
            End If

        End With
        
        Exit Sub

UserDañoNpc_Err:
178     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UserDañoNpc", Erl)
180     Resume Next
        
End Sub

Private Sub NpcDaño(ByVal NpcIndex As Integer, ByVal UserIndex As Integer)
        
        On Error GoTo NpcDaño_Err
        

        Dim Daño As Integer, Lugar As Integer, absorbido As Integer

        Dim antdaño As Integer, defbarco As Integer

        Dim obj As ObjData
    
100     Daño = RandomNumber(NpcList(NpcIndex).Stats.MinHIT, NpcList(NpcIndex).Stats.MaxHit)
102     antdaño = Daño
    
104     If UserList(UserIndex).flags.Navegando = 1 And UserList(UserIndex).Invent.BarcoObjIndex > 0 Then
106         obj = ObjData(UserList(UserIndex).Invent.BarcoObjIndex)
108         defbarco = RandomNumber(obj.MinDef, obj.MaxDef)
        End If
    
        Dim defMontura As Integer

110     If UserList(UserIndex).flags.Montado = 1 And UserList(UserIndex).Invent.MonturaObjIndex > 0 Then
112         obj = ObjData(UserList(UserIndex).Invent.MonturaObjIndex)
114         defMontura = RandomNumber(obj.MinDef, obj.MaxDef)
        End If
    
116     Lugar = RandomNumber(1, 6)
    
118     Select Case Lugar
            ' 1/6 de chances de que sea a la cabeza
            Case PartesCuerpo.bCabeza

                'Si tiene casco absorbe el golpe
120             If UserList(UserIndex).Invent.CascoEqpObjIndex > 0 Then
                    Dim Casco As ObjData
122                 Casco = ObjData(UserList(UserIndex).Invent.CascoEqpObjIndex)
124                 absorbido = absorbido + RandomNumber(Casco.MinDef, Casco.MaxDef)
                End If

126         Case Else

                'Si tiene armadura absorbe el golpe
128             If UserList(UserIndex).Invent.ArmourEqpObjIndex > 0 Then
                    Dim Armadura As ObjData
130                 Armadura = ObjData(UserList(UserIndex).Invent.ArmourEqpObjIndex)
132                 absorbido = absorbido + RandomNumber(Armadura.MinDef, Armadura.MaxDef)
                End If
                
                'Si tiene escudo absorbe el golpe
134             If UserList(UserIndex).Invent.EscudoEqpObjIndex > 0 Then
                    Dim Escudo As ObjData
136                 Escudo = ObjData(UserList(UserIndex).Invent.EscudoEqpObjIndex)
138                 absorbido = absorbido + RandomNumber(Escudo.MinDef, Escudo.MaxDef)
                End If

        End Select
        
140     Daño = Daño - absorbido - defbarco - defMontura
        
142     If Daño < 0 Then Daño = 0
    
144     Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageTextCharDrop(PonerPuntos(Daño), UserList(UserIndex).Char.CharIndex, vbRed))

146     If UserList(UserIndex).ChatCombate = 1 Then
148         Call WriteNPCHitUser(UserIndex, Lugar, Daño)
        End If

150     If UserList(UserIndex).flags.Privilegios And PlayerType.user Then UserList(UserIndex).Stats.MinHp = UserList(UserIndex).Stats.MinHp - Daño
    
152     If UserList(UserIndex).flags.Meditando Then
154         If Daño > Fix(UserList(UserIndex).Stats.MinHp / 100 * UserList(UserIndex).Stats.UserAtributos(eAtributos.Inteligencia) * UserList(UserIndex).Stats.UserSkills(eSkill.Meditar) / 100 * 12 / (RandomNumber(0, 5) + 7)) Then
156             UserList(UserIndex).flags.Meditando = False
158             UserList(UserIndex).Char.FX = 0
160             Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageMeditateToggle(UserList(UserIndex).Char.CharIndex, 0))
            End If

        End If
    
        'Muere el usuario
162     If UserList(UserIndex).Stats.MinHp <= 0 Then
    
164         Call WriteNPCKillUser(UserIndex) ' Le informamos que ha muerto ;)
                    
166         If NpcList(NpcIndex).MaestroUser > 0 Then
168             Call AllFollowAmo(NpcList(NpcIndex).MaestroUser)
            Else
                'Al matarlo no lo sigue mas
170             NpcList(NpcIndex).Movement = NpcList(NpcIndex).flags.OldMovement
172             NpcList(NpcIndex).Hostile = NpcList(NpcIndex).flags.OldHostil
174             NpcList(NpcIndex).flags.AttackedBy = vbNullString
176             NpcList(NpcIndex).Target = 0
            End If
        
178         Call UserDie(UserIndex)

        Else
180         Call WriteUpdateHP(UserIndex)
    
        End If

        
        Exit Sub

NpcDaño_Err:
182     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.NpcDaño", Erl)
184     Resume Next
        
End Sub

Public Function NpcAtacaUser(ByVal NpcIndex As Integer, ByVal UserIndex As Integer, ByVal Heading As eHeading) As Boolean
        
        On Error GoTo NpcAtacaUser_Err
        

100     If UserList(UserIndex).flags.AdminInvisible = 1 Then Exit Function
102     If (Not UserList(UserIndex).flags.Privilegios And PlayerType.user) <> 0 And Not UserList(UserIndex).flags.AdminPerseguible Then Exit Function
    
        ' El npc puede atacar ???
    
104     If Not IntervaloPermiteAtacarNPC(NpcIndex) Then
106         NpcAtacaUser = False
            Exit Function
        End If
        
108     If ((MapData(UserList(UserIndex).Pos.Map, UserList(UserIndex).Pos.X, UserList(UserIndex).Pos.Y).Blocked And 2 ^ (Heading - 1)) <> 0) Then
110         NpcAtacaUser = False
            Exit Function
        End If

112     NpcAtacaUser = True

114     Call AllMascotasAtacanNPC(NpcIndex, UserIndex)

116     If NpcList(NpcIndex).Target = 0 Then NpcList(NpcIndex).Target = UserIndex
    
118     If UserList(UserIndex).flags.AtacadoPorNpc = 0 And UserList(UserIndex).flags.AtacadoPorUser = 0 Then UserList(UserIndex).flags.AtacadoPorNpc = NpcIndex
    
120     If NpcList(NpcIndex).flags.Snd1 > 0 Then
122         Call SendData(SendTarget.ToNPCArea, NpcIndex, PrepareMessagePlayWave(NpcList(NpcIndex).flags.Snd1, NpcList(NpcIndex).Pos.X, NpcList(NpcIndex).Pos.Y))
        End If
        
124     Call CancelExit(UserIndex)

126     If NpcImpacto(NpcIndex, UserIndex) Then
    
128         Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessagePlayWave(SND_IMPACTO, UserList(UserIndex).Pos.X, UserList(UserIndex).Pos.Y))
        
130         If UserList(UserIndex).flags.Navegando = 0 Or UserList(UserIndex).flags.Montado = 0 Then
132             Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCreateFX(UserList(UserIndex).Char.CharIndex, FXSANGRE, 0))
            End If
        
134         Call NpcDaño(NpcIndex, UserIndex)

            '¿Puede envenenar?
136         If NpcList(NpcIndex).Veneno > 0 Then Call NpcEnvenenarUser(UserIndex, NpcList(NpcIndex).Veneno)
        
        Else
138         Call SendData(SendTarget.ToNPCArea, NpcIndex, PrepareMessageCharSwing(NpcList(NpcIndex).Char.CharIndex, False))

        End If

        '-----Tal vez suba los skills------
140     Call SubirSkill(UserIndex, Tacticas)
    
        'Controla el nivel del usuario
142     Call CheckUserLevel(UserIndex)
        

        Exit Function

NpcAtacaUser_Err:
144     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.NpcAtacaUser", Erl)
146     Resume Next
        
End Function

Private Function NpcImpactoNpc(ByVal Atacante As Integer, ByVal Victima As Integer) As Boolean
        
        On Error GoTo NpcImpactoNpc_Err
        

        Dim PoderAtt  As Long, PoderEva As Long

        Dim ProbExito As Long

100     PoderAtt = NpcList(Atacante).PoderAtaque
102     PoderEva = NpcList(Victima).PoderEvasion
104     ProbExito = Maximo(10, Minimo(90, 50 + ((PoderAtt - PoderEva) * 0.4)))
106     NpcImpactoNpc = (RandomNumber(1, 100) <= ProbExito)

        
        Exit Function

NpcImpactoNpc_Err:
108     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.NpcImpactoNpc", Erl)
110     Resume Next
        
End Function

Private Sub NpcDañoNpc(ByVal Atacante As Integer, ByVal Victima As Integer)
        
            On Error GoTo NpcDañoNpc_Err

            Dim Daño As Integer
    
100         With NpcList(Atacante)
102             Daño = RandomNumber(.Stats.MinHIT, .Stats.MaxHit)
104             NpcList(Victima).Stats.MinHp = NpcList(Victima).Stats.MinHp - Daño
            
106             Call SendData(SendTarget.ToNPCArea, Victima, PrepareMessageTextCharDrop(PonerPuntos(Daño), NpcList(Victima).Char.CharIndex, vbRed))
            
                ' Mascotas dan experiencia al amo
108             If .MaestroUser > 0 Then
110                 Call CalcularDarExp(.MaestroUser, Victima, Daño)
                End If
            
112             If NpcList(Victima).Stats.MinHp < 1 Then
114                 .Movement = .flags.OldMovement
                
116                 If LenB(.flags.AttackedBy) <> 0 Then
118                     .Hostile = .flags.OldHostil
                    End If
                
120                 If .MaestroUser > 0 Then
122                     Call FollowAmo(Atacante)
                    End If
                
124                 Call MuereNpc(Victima, .MaestroUser)

                Else
                    Call SendData(SendTarget.ToNPCArea, Victima, PrepareMessageNpcUpdateHP(Victima))
                End If
                
            End With

        
            Exit Sub

NpcDañoNpc_Err:
126         Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.NpcDañoNpc")
128         Resume Next
        
End Sub

Public Sub NpcAtacaNpc(ByVal Atacante As Integer, ByVal Victima As Integer, Optional ByVal cambiarMovimiento As Boolean = True)
        
        On Error GoTo NpcAtacaNpc_Err
        
100     If Not IntervaloPermiteAtacarNPC(Atacante) Then Exit Sub
        Dim Heading As eHeading
102     Heading = GetHeadingFromWorldPos(NpcList(Atacante).Pos, NpcList(Victima).Pos)
104     Call ChangeNPCChar(Atacante, NpcList(Atacante).Char.Body, NpcList(Atacante).Char.Head, Heading)
        
106     If cambiarMovimiento Then
108         NpcList(Victima).TargetNPC = Atacante
110         NpcList(Victima).Movement = TipoAI.NpcAtacaNpc
        End If

112     If NpcList(Atacante).flags.Snd1 > 0 Then
114         Call SendData(SendTarget.ToNPCArea, Atacante, PrepareMessagePlayWave(NpcList(Atacante).flags.Snd1, NpcList(Atacante).Pos.X, NpcList(Atacante).Pos.Y))

        End If

116     If NpcImpactoNpc(Atacante, Victima) Then
    
118         If NpcList(Victima).flags.Snd2 > 0 Then
120             Call SendData(SendTarget.ToNPCArea, Victima, PrepareMessagePlayWave(NpcList(Victima).flags.Snd2, NpcList(Victima).Pos.X, NpcList(Victima).Pos.Y))
            Else
122             Call SendData(SendTarget.ToNPCArea, Victima, PrepareMessagePlayWave(SND_IMPACTO2, NpcList(Victima).Pos.X, NpcList(Victima).Pos.Y))

            End If

124         Call SendData(SendTarget.ToNPCArea, Victima, PrepareMessagePlayWave(SND_IMPACTO, NpcList(Victima).Pos.X, NpcList(Victima).Pos.Y))
    
126         Call NpcDañoNpc(Atacante, Victima)
    
        Else
128         Call SendData(SendTarget.ToNPCArea, Atacante, PrepareMessageCharSwing(NpcList(Atacante).Char.CharIndex, False, True))

        End If

        
        Exit Sub

NpcAtacaNpc_Err:
130     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.NpcAtacaNpc", Erl)
132     Resume Next
        
End Sub

Public Sub UsuarioAtacaNpc(ByVal UserIndex As Integer, ByVal NpcIndex As Integer)
        
        On Error GoTo UsuarioAtacaNpc_Err
        
100     If Not PuedeAtacarNPC(UserIndex, NpcIndex) Then Exit Sub

102     If UserList(UserIndex).flags.invisible = 0 Then Call NPCAtacado(NpcIndex, UserIndex)

104     If UserImpactoNpc(UserIndex, NpcIndex) Then
        
            ' Suena el Golpe en el cliente.
106         If NpcList(NpcIndex).flags.Snd2 > 0 Then
108             Call SendData(SendTarget.ToNPCArea, NpcIndex, PrepareMessagePlayWave(NpcList(NpcIndex).flags.Snd2, NpcList(NpcIndex).Pos.X, NpcList(NpcIndex).Pos.Y))
            Else
110             Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessagePlayWave(SND_IMPACTO2, NpcList(NpcIndex).Pos.X, NpcList(NpcIndex).Pos.Y))
            End If
        
            ' Golpe Paralizador
112         If UserList(UserIndex).flags.Paraliza = 1 And NpcList(NpcIndex).flags.Paralizado = 0 Then

114             If RandomNumber(1, 4) = 1 Then

116                 If NpcList(NpcIndex).flags.AfectaParalisis = 0 Then
118                     NpcList(NpcIndex).flags.Paralizado = 1
120                     NpcList(NpcIndex).Contadores.Paralisis = (IntervaloParalizado / 3) * 7

122                     If UserList(UserIndex).ChatCombate = 1 Then
                            'Call WriteConsoleMsg(UserIndex, "Tu golpe a paralizado a la criatura.", FontTypeNames.FONTTYPE_FIGHT)
124                         Call WriteLocaleMsg(UserIndex, "136", FontTypeNames.FONTTYPE_FIGHT)

                        End If

126                     Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCreateFX(NpcList(NpcIndex).Char.CharIndex, 8, 0))
                                 
                    Else

128                     If UserList(UserIndex).ChatCombate = 1 Then
                            'Call WriteConsoleMsg(UserIndex, "El NPC es inmune al hechizo.", FontTypeNames.FONTTYPE_INFO)
130                         Call WriteLocaleMsg(UserIndex, "381", FontTypeNames.FONTTYPE_INFO)

                        End If

                    End If

                End If

            End If
            
            ' Cambiamos el objetivo del NPC si uno le pega cuerpo a cuerpo.
132         If NpcList(NpcIndex).Target <> UserIndex Then
134             NpcList(NpcIndex).Target = UserIndex
            End If
            
            ' Si te mimetizaste en forma de bicho y le pegas al chobi, el chobi te va a pegar.
136         If UserList(UserIndex).flags.Mimetizado = e_EstadoMimetismo.FormaBicho Then
138             UserList(UserIndex).flags.Mimetizado = e_EstadoMimetismo.FormaBichoSinProteccion
            End If
            
            ' Resta la vida del NPC
140         Call UserDañoNpc(UserIndex, NpcIndex)
            
142         Dim Arma As Integer: Arma = UserList(UserIndex).Invent.WeaponEqpObjIndex
144         Dim municionIndex As Integer: municionIndex = UserList(UserIndex).Invent.MunicionEqpObjIndex
            Dim Particula As Integer
            Dim Tiempo    As Long
            
146         If Arma > 0 Then
148             If municionIndex > 0 And ObjData(Arma).Proyectil Then
150                 If ObjData(municionIndex).CreaFX <> 0 Then
152                     Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCreateFX(NpcList(NpcIndex).Char.CharIndex, ObjData(municionIndex).CreaFX, 0))
                    
                    End If
                                        
154                 If ObjData(municionIndex).CreaParticula <> "" Then
156                     Particula = val(ReadField(1, ObjData(municionIndex).CreaParticula, Asc(":")))
158                     Tiempo = val(ReadField(2, ObjData(municionIndex).CreaParticula, Asc(":")))
160                     Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageParticleFX(NpcList(NpcIndex).Char.CharIndex, Particula, Tiempo, False))
                    End If
                End If
            End If
            
        Else
            
            Dim sendto As SendTarget
            
162         If UserList(UserIndex).clase = eClass.Hunter And UserList(UserIndex).flags.Oculto = 0 Then
164             sendto = SendTarget.ToPCArea
            Else
166             sendto = SendTarget.ToIndex
            End If

168         Call SendData(sendto, UserIndex, PrepareMessageCharSwing(UserList(UserIndex).Char.CharIndex))

        End If

        
        Exit Sub

UsuarioAtacaNpc_Err:
170     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UsuarioAtacaNpc", Erl)
172     Resume Next
        
End Sub

Public Sub UsuarioAtaca(ByVal UserIndex As Integer)
        
        On Error GoTo UsuarioAtaca_Err
        

        'Check bow's interval
100     If Not IntervaloPermiteUsarArcos(UserIndex, False) Then Exit Sub
    
        'Check Spell-Attack interval
102     If Not IntervaloPermiteMagiaGolpe(UserIndex, False) Then Exit Sub

        'Check Attack interval
104     If Not IntervaloPermiteAtacar(UserIndex) Then Exit Sub

        'Quitamos stamina
106     If UserList(UserIndex).Stats.MinSta < 10 Then
            'Call WriteConsoleMsg(UserIndex, "Estas muy cansado para luchar.", FontTypeNames.FONTTYPE_INFO)
108         Call WriteLocaleMsg(UserIndex, "93", FontTypeNames.FONTTYPE_INFO)
            Exit Sub

        End If
    
110     Call QuitarSta(UserIndex, RandomNumber(1, 10))
    
112     If UserList(UserIndex).Counters.Trabajando Then
114         Call WriteMacroTrabajoToggle(UserIndex, False)

        End If
        
116     If UserList(UserIndex).Counters.Ocultando Then UserList(UserIndex).Counters.Ocultando = UserList(UserIndex).Counters.Ocultando - 1
        
        'Movimiento de arma, solo lo envio si no es GM invisible.
118     If UserList(UserIndex).flags.AdminInvisible = 0 Then
120         Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageArmaMov(UserList(UserIndex).Char.CharIndex))
        End If

        Dim AttackPos As WorldPos
122         AttackPos = UserList(UserIndex).Pos

124     Call HeadtoPos(UserList(UserIndex).Char.Heading, AttackPos)
       
        'Exit if not legal
126     If AttackPos.X >= XMinMapSize And AttackPos.X <= XMaxMapSize And AttackPos.Y >= YMinMapSize And AttackPos.Y <= YMaxMapSize Then

128         If ((MapData(AttackPos.Map, AttackPos.X, AttackPos.Y).Blocked And 2 ^ (UserList(UserIndex).Char.Heading - 1)) <> 0) Then
130             Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCharSwing(UserList(UserIndex).Char.CharIndex, True, False))
                Exit Sub
            End If

            Dim index As Integer

132         index = MapData(AttackPos.Map, AttackPos.X, AttackPos.Y).UserIndex

            'Look for user
134         If index > 0 Then
136             Call UsuarioAtacaUsuario(UserIndex, index)

            'Look for NPC
138         ElseIf MapData(AttackPos.Map, AttackPos.X, AttackPos.Y).NpcIndex > 0 Then

140             index = MapData(AttackPos.Map, AttackPos.X, AttackPos.Y).NpcIndex

142             If NpcList(index).Attackable Then
144                 If NpcList(index).MaestroUser > 0 And MapInfo(NpcList(index).Pos.Map).Seguro = 1 Then
146                     Call WriteConsoleMsg(UserIndex, "No podés atacar mascotas en zonas seguras", FontTypeNames.FONTTYPE_FIGHT)
                        Exit Sub
                    End If

148                 Call UsuarioAtacaNpc(UserIndex, index)

                Else
150                 Call WriteConsoleMsg(UserIndex, "No podés atacar a este NPC", FontTypeNames.FONTTYPE_FIGHT)

                End If

                Exit Sub
            Else
152             Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCharSwing(UserList(UserIndex).Char.CharIndex, True, False))
            End If

        Else
154         Call SendData(SendTarget.ToPCArea, UserIndex, PrepareMessageCharSwing(UserList(UserIndex).Char.CharIndex, True, False))
        End If

        Exit Sub

UsuarioAtaca_Err:
156     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UsuarioAtaca", Erl)
158     Resume Next
        
End Sub

Private Function UsuarioImpacto(ByVal AtacanteIndex As Integer, ByVal VictimaIndex As Integer) As Boolean

        On Error GoTo UsuarioImpacto_Err

        Dim ProbRechazo            As Long
        Dim Rechazo                As Boolean
        Dim ProbExito              As Long
        Dim PoderAtaque            As Long
        Dim UserPoderEvasion       As Long
        Dim Arma                   As Integer
        Dim Proyectil              As Boolean
        Dim SkillTacticas          As Long
        Dim SkillDefensa           As Long

100     If UserList(AtacanteIndex).flags.GolpeCertero = 1 Then
102         UsuarioImpacto = True
104         UserList(AtacanteIndex).flags.GolpeCertero = 0
            Exit Function

        End If

106     SkillTacticas = UserList(VictimaIndex).Stats.UserSkills(eSkill.Tacticas)
108     SkillDefensa = UserList(VictimaIndex).Stats.UserSkills(eSkill.Defensa)

110     Arma = UserList(AtacanteIndex).Invent.WeaponEqpObjIndex

112     If Arma > 0 Then
114         Proyectil = ObjData(Arma).Proyectil = 1

116         If Proyectil Then
118             PoderAtaque = PoderAtaqueProyectil(AtacanteIndex)
            Else
120             PoderAtaque = PoderAtaqueArma(AtacanteIndex)
            End If
        Else
122         Proyectil = False
124         PoderAtaque = PoderAtaqueWrestling(AtacanteIndex)
        End If

        'Calculamos el poder de evasion...
126     UserPoderEvasion = PoderEvasion(VictimaIndex)

128     If UserList(VictimaIndex).Invent.EscudoEqpObjIndex > 0 Then
130         UserPoderEvasion = UserPoderEvasion + PoderEvasionEscudo(VictimaIndex)
132         If SkillDefensa > 0 Then
134             ProbRechazo = Maximo(10, Minimo(90, 100 * (SkillDefensa / (SkillDefensa + SkillTacticas))))
            Else
136             ProbRechazo = 10
            End If
        Else
138         ProbRechazo = 0
        End If

140     ProbExito = Maximo(10, Minimo(90, 50 + ((PoderAtaque - UserPoderEvasion) * 0.4)))

142     UsuarioImpacto = (RandomNumber(1, 100) <= ProbExito)

144     If UsuarioImpacto Then
146       Call SubirSkillDeArmaActual(AtacanteIndex)

        Else ' Falló
148         If RandomNumber(1, 100) <= ProbRechazo Then
                'Se rechazo el ataque con el escudo
150             Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessagePlayWave(SND_ESCUDO, UserList(VictimaIndex).Pos.X, UserList(VictimaIndex).Pos.Y))
152             Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageEscudoMov(UserList(VictimaIndex).Char.CharIndex))

154             If UserList(AtacanteIndex).ChatCombate = 1 Then
156                 Call WriteBlockedWithShieldOther(AtacanteIndex)
                End If

158             If UserList(VictimaIndex).ChatCombate = 1 Then
160                 Call WriteBlockedWithShieldUser(VictimaIndex)
                End If

162             Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageCreateFX(UserList(VictimaIndex).Char.CharIndex, 88, 0))
164             Call SubirSkill(VictimaIndex, eSkill.Defensa)
            Else
166             Call WriteConsoleMsg(VictimaIndex, "¡" & UserList(AtacanteIndex).Name & " te atacó y falló! ", FontTypeNames.FONTTYPE_FIGHT)

            End If
        End If

        Exit Function

UsuarioImpacto_Err:
168     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UsuarioImpacto", Erl)
170     Resume Next

End Function

Public Sub UsuarioAtacaUsuario(ByVal AtacanteIndex As Integer, ByVal VictimaIndex As Integer)
        
        On Error GoTo UsuarioAtacaUsuario_Err

        Dim sendto As SendTarget
        Dim Probabilidad As Byte
        Dim HuboEfecto   As Boolean
100         HuboEfecto = False

102     If Not PuedeAtacar(AtacanteIndex, VictimaIndex) Then Exit Sub

104     If Distancia(UserList(AtacanteIndex).Pos, UserList(VictimaIndex).Pos) > MAXDISTANCIAARCO Then
106         Call WriteLocaleMsg(AtacanteIndex, "8", FontTypeNames.FONTTYPE_INFO)
            ' Call WriteConsoleMsg(atacanteindex, "Estás muy lejos para disparar.", FontTypeNames.FONTTYPE_FIGHT)
            Exit Sub

        End If

108     Call UsuarioAtacadoPorUsuario(AtacanteIndex, VictimaIndex)

110     If UsuarioImpacto(AtacanteIndex, VictimaIndex) Then

112         'Call SendData(SendTarget.ToPCArea, AtacanteIndex, PrepareMessagePlayWave(SND_IMPACTO, UserList(AtacanteIndex).Pos.X, UserList(AtacanteIndex).Pos.Y))

114         If UserList(VictimaIndex).flags.Navegando = 0 Or UserList(VictimaIndex).flags.Montado = 0 Then
116             Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageCreateFX(UserList(VictimaIndex).Char.CharIndex, FXSANGRE, 0))
            End If

118         Call UserDañoUser(AtacanteIndex, VictimaIndex)

        Else

120         If UserList(AtacanteIndex).flags.invisible Or UserList(AtacanteIndex).flags.Oculto Then
122             sendto = SendTarget.ToIndex
            Else
124             sendto = SendTarget.ToPCArea
            End If

126         Call SendData(sendto, AtacanteIndex, PrepareMessageCharSwing(UserList(AtacanteIndex).Char.CharIndex))

        End If

        Exit Sub

UsuarioAtacaUsuario_Err:
128     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UsuarioAtacaUsuario", Erl)
130     Resume Next

End Sub

Private Sub UserDañoUser(ByVal AtacanteIndex As Integer, ByVal VictimaIndex As Integer)
        On Error GoTo UserDañoUser_Err

100     With UserList(VictimaIndex)

            Dim Daño As Long, DañoBase As Long, DañoExtra As Long, Defensa As Long, Color As Long, DañoStr As String, Lugar As PartesCuerpo

            ' Daño normal
102         DañoBase = CalcularDaño(AtacanteIndex)

            ' Color por defecto rojo
104         Color = vbRed

            ' Elegimos al azar una parte del cuerpo
106         Lugar = min(RandomNumber(1, 8), 6)

108         Select Case Lugar
                ' 1/6 de chances de que sea a la cabeza
                Case PartesCuerpo.bCabeza

                    'Si tiene casco absorbe el golpe
110                 If .Invent.CascoEqpObjIndex > 0 Then
                        Dim Casco As ObjData
112                     Casco = ObjData(.Invent.CascoEqpObjIndex)
114                     Defensa = Defensa + RandomNumber(Casco.MinDef, Casco.MaxDef)
                    End If

116             Case Else

                    'Si tiene armadura absorbe el golpe
118                 If .Invent.ArmourEqpObjIndex > 0 Then
                        Dim Armadura As ObjData
120                     Armadura = ObjData(.Invent.ArmourEqpObjIndex)
122                     Defensa = Defensa + RandomNumber(Armadura.MinDef, Armadura.MaxDef)
                    End If
                    
                    'Si tiene escudo absorbe el golpe
124                 If .Invent.EscudoEqpObjIndex > 0 Then
                        Dim Escudo As ObjData
126                     Escudo = ObjData(.Invent.EscudoEqpObjIndex)
128                     Defensa = Defensa + RandomNumber(Escudo.MinDef, Escudo.MaxDef)
                    End If
    
            End Select

            ' Defensa del barco de la víctima
130         If .Invent.BarcoObjIndex > 0 Then
                Dim Barco As ObjData
132             Barco = ObjData(.Invent.BarcoObjIndex)
134             Defensa = Defensa + RandomNumber(Barco.MinDef, Barco.MaxDef)

            ' Defensa de la montura de la víctima
136         ElseIf .Invent.MonturaObjIndex > 0 Then
                Dim Montura As ObjData
138             Montura = ObjData(.Invent.MonturaObjIndex)
140             Defensa = Defensa + RandomNumber(Montura.MinDef, Montura.MaxDef)
            End If
            
            ' Refuerzo de la espada - Ignora parte de la armadura
142         If UserList(AtacanteIndex).Invent.WeaponEqpObjIndex > 0 Then
144             Defensa = Defensa - ObjData(UserList(AtacanteIndex).Invent.WeaponEqpObjIndex).Refuerzo

146             If Defensa < 0 Then Defensa = 0
            End If
            
            ' Restamos la defensa
148         Daño = DañoBase - Defensa

150         If Daño < 0 Then Daño = 0

152         DañoStr = PonerPuntos(Daño)

            ' Mostramos en consola el golpe al atacante
154         If UserList(AtacanteIndex).ChatCombate = 1 Then
156             Call WriteUserHittedUser(AtacanteIndex, Lugar, .Char.CharIndex, DañoStr)
            End If
            ' Y a la víctima
158         If .ChatCombate = 1 Then
160             Call WriteUserHittedByUser(VictimaIndex, Lugar, UserList(AtacanteIndex).Char.CharIndex, DañoStr)
            End If

            ' Golpe crítico (ignora defensa)
162         If PuedeGolpeCritico(AtacanteIndex) Then
                ' Si acertó
164             If RandomNumber(1, 100) <= ProbabilidadGolpeCritico(AtacanteIndex) Then
                    ' Daño del golpe crítico (usamos el daño base)
166                 DañoExtra = Daño * ModDañoGolpeCritico

168                 DañoStr = PonerPuntos(DañoExtra)

                    ' Mostramos en consola el daño al atacante
170                 If UserList(AtacanteIndex).ChatCombate = 1 Then
172                     Call WriteLocaleMsg(AtacanteIndex, "383", FontTypeNames.FONTTYPE_FIGHT, .Name & "¬" & DañoStr)
                    End If
                    ' Y a la víctima
174                 If .ChatCombate = 1 Then
176                     Call WriteLocaleMsg(VictimaIndex, "385", FontTypeNames.FONTTYPE_FIGHT, UserList(AtacanteIndex).Name & "¬" & DañoStr)
                    End If
                    Call SendData(SendTarget.ToPCArea, AtacanteIndex, PrepareMessagePlayWave(SND_IMPACTO_CRITICO, UserList(AtacanteIndex).Pos.X, UserList(AtacanteIndex).Pos.Y))
                    ' Color naranja
178                 Color = RGB(225, 165, 0)
                End If

            ' Apuñalar (le afecta la defensa)
180         ElseIf PuedeApuñalar(AtacanteIndex) Then
182             If RandomNumber(1, 100) <= ProbabilidadApuñalar(AtacanteIndex) Then
                    ' Daño del apuñalamiento
184                 DañoExtra = Daño * ModicadorApuñalarClase(UserList(AtacanteIndex).clase)

186                 DañoStr = PonerPuntos(DañoExtra)
                
                    ' Mostramos en consola el daño al atacante
188                 If UserList(AtacanteIndex).ChatCombate = 1 Then
190                     Call WriteLocaleMsg(AtacanteIndex, "210", FontTypeNames.FONTTYPE_FIGHT, .Name & "¬" & DañoStr)
                    End If
                    ' Y a la víctima
192                 If .ChatCombate = 1 Then
194                     Call WriteLocaleMsg(VictimaIndex, "211", FontTypeNames.FONTTYPE_FIGHT, UserList(AtacanteIndex).Name & "¬" & DañoStr)
                    End If
                    
                    Call SendData(SendTarget.ToPCArea, AtacanteIndex, PrepareMessagePlayWave(SND_IMPACTO_APU, UserList(AtacanteIndex).Pos.X, UserList(AtacanteIndex).Pos.Y))

                    ' Color amarillo
196                 Color = vbYellow

                    ' Efecto en la víctima
198                 Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageCreateFX(UserList(VictimaIndex).Char.CharIndex, 89, 0))
                    
                    ' Efecto en pantalla a ambos
200                 Call WriteFlashScreen(VictimaIndex, &H3C3CFF, 200, True)
202                 Call WriteFlashScreen(AtacanteIndex, &H3C3CFF, 150, True)
                    Call SendData(SendTarget.ToPCArea, AtacanteIndex, PrepareMessagePlayWave(SND_IMPACTO, UserList(AtacanteIndex).Pos.X, UserList(AtacanteIndex).Pos.Y))
                End If

                ' Sube skills en apuñalar
204             Call SubirSkill(AtacanteIndex, Apuñalar)
206         ElseIf PuedeDesequiparDeUnGolpe(AtacanteIndex) Then
208             If RandomNumber(1, 100) <= ProbabilidadDesequipar(AtacanteIndex) Then
210                 Call DesequiparObjetoDeUnGolpe(AtacanteIndex, VictimaIndex, Lugar)
                End If

            End If
            
212         If DañoExtra > 0 Then
214             Daño = Daño + DañoExtra

216             DañoStr = PonerPuntos(Daño)
                
                ' Mostramos el daño total en consola al atacante
218             If UserList(AtacanteIndex).ChatCombate = 1 Then
220                 Call WriteLocaleMsg(AtacanteIndex, "384", FontTypeNames.FONTTYPE_FIGHT, DañoStr)
                End If
                ' Y a la víctima
222             If .ChatCombate = 1 Then
224                 Call WriteLocaleMsg(VictimaIndex, "387", FontTypeNames.FONTTYPE_FIGHT, UserList(AtacanteIndex).Name & "¬" & DañoStr)
                End If
                
226             DañoStr = "¡" & PonerPuntos(Daño) & "!"
            Else
228             DañoStr = PonerPuntos(Daño)
            End If

            ' Daño sobre el tile
230         Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageTextCharDrop(DañoStr, .Char.CharIndex, Color))

            ' Restamos el daño a la víctima
232         .Stats.MinHp = .Stats.MinHp - Daño

            ' Muere la víctima
234         If .Stats.MinHp <= 0 Then
                ' Sumar frag y rutina de muerte
236             Call Statistics.StoreFrag(AtacanteIndex, VictimaIndex)
238             Call ContarMuerte(VictimaIndex, AtacanteIndex)
240             Call ActStats(VictimaIndex, AtacanteIndex)
            ' Si sigue vivo
            Else
                ' Enviamos la vida
242             Call WriteUpdateHP(VictimaIndex)

                Call SendData(SendTarget.ToPCArea, AtacanteIndex, PrepareMessagePlayWave(SND_IMPACTO, UserList(AtacanteIndex).Pos.X, UserList(AtacanteIndex).Pos.Y))

                ' Intentamos aplicar algún efecto de estado
244             Call UserDañoEspecial(AtacanteIndex, VictimaIndex)
            End If

        End With

        Exit Sub

UserDañoUser_Err:
246     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UserDañoUser", Erl)
248     Resume Next
        
End Sub

Private Sub DesequiparObjetoDeUnGolpe(ByVal AttackerIndex As Integer, ByVal VictimIndex As Integer, ByVal parteDelCuerpo As PartesCuerpo)
        On Error GoTo DesequiparObjetoDeUnGolpe_Err
    
        Dim desequiparCasco As Boolean, desequiparArma As Boolean, desequiparEscudo As Boolean
    
100     With UserList(VictimIndex)
    
102         Select Case parteDelCuerpo
            Case PartesCuerpo.bCabeza
                ' Si pega en la cabeza, desequipamos el casco si tiene
104             desequiparCasco = .Invent.CascoEqpObjIndex > 0
                ' Si no tiene casco, intentaremos desequipar otra cosa porque un golpe en la cabeza
                ' algo te tiene que desequipar.
106             desequiparArma = (Not desequiparCasco) And (.Invent.WeaponEqpObjIndex > 0)
108             desequiparEscudo = (Not desequiparCasco) And (Not desequiparArma) And (.Invent.EscudoEqpObjIndex > 0)
         
110         Case PartesCuerpo.bBrazoDerecho, PartesCuerpo.bBrazoIzquierdo, PartesCuerpo.bTorso
112             desequiparArma = (.Invent.WeaponEqpObjIndex > 0)
114             desequiparEscudo = (Not desequiparArma) And (.Invent.EscudoEqpObjIndex > 0)
116             desequiparCasco = False
            
118         Case PartesCuerpo.bPiernaDerecha, PartesCuerpo.bPiernaIzquierda
120             desequiparEscudo = (.Invent.EscudoEqpObjIndex > 0)
122             desequiparCasco = False
124             desequiparArma = False
            
            End Select
        
126         If desequiparCasco Then
128             Call Desequipar(VictimIndex, .Invent.CascoEqpSlot)
            
130             Call WriteCombatConsoleMsg(AttackerIndex, "Has logrado desequipar el casco de tu oponente!")
132             Call WriteCombatConsoleMsg(VictimIndex, UserList(AttackerIndex).name & " te ha desequipado el casco.")
            
134         ElseIf desequiparArma Then
136             Call Desequipar(VictimIndex, .Invent.WeaponEqpSlot)
                
138             Call WriteCombatConsoleMsg(AttackerIndex, "Has logrado desarmar a tu oponente!")
140             Call WriteCombatConsoleMsg(VictimIndex, UserList(AttackerIndex).name & " te ha desarmado.")

142         ElseIf desequiparEscudo Then
144             Call Desequipar(VictimIndex, .Invent.EscudoEqpSlot)
                
146             Call WriteCombatConsoleMsg(AttackerIndex, "Has logrado desequipar el escudo de " & .name & ".")
148             Call WriteCombatConsoleMsg(VictimIndex, UserList(AttackerIndex).name & " te ha desequipado el escudo.")
            Else
150             Call WriteCombatConsoleMsg(AttackerIndex, "No has logrado desequipar ningun item a tu oponente!")
            End If
            
        End With
        
        Exit Sub

DesequiparObjetoDeUnGolpe_Err:
152     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.DesequiparObjetoDeUnGolpe", Erl)
 
End Sub

Sub UsuarioAtacadoPorUsuario(ByVal AttackerIndex As Integer, ByVal VictimIndex As Integer)
        '***************************************************
        'Autor: Unknown
        'Last Modification: 10/01/08
        'Last Modified By: Lucas Tavolaro Ortiz (Tavo)
        ' 10/01/2008: Tavo - Se cancela la salida del juego si el user esta saliendo
        '***************************************************

        On Error GoTo UsuarioAtacadoPorUsuario_Err

        'Si la victima esta saliendo se cancela la salida
100     Call CancelExit(VictimIndex)

102     If UserList(VictimIndex).flags.Meditando Then
104         UserList(VictimIndex).flags.Meditando = False
106         UserList(VictimIndex).Char.FX = 0
108         Call SendData(SendTarget.ToPCArea, VictimIndex, PrepareMessageMeditateToggle(UserList(VictimIndex).Char.CharIndex, 0))
        End If
    
110     If TriggerZonaPelea(AttackerIndex, VictimIndex) = TRIGGER6_PERMITE Then Exit Sub
    
        Dim EraCriminal As Byte
    
112     UserList(VictimIndex).Counters.EnCombate = IntervaloEnCombate
114     UserList(AttackerIndex).Counters.EnCombate = IntervaloEnCombate
    
116     If Status(AttackerIndex) = 1 And Status(VictimIndex) = 1 Or Status(VictimIndex) = 3 Then
118         Call VolverCriminal(AttackerIndex)

        End If

120     EraCriminal = Status(AttackerIndex)
    
122     If EraCriminal = 2 And Status(AttackerIndex) < 2 Then
124         Call RefreshCharStatus(AttackerIndex)
126     ElseIf EraCriminal < 2 And Status(AttackerIndex) = 2 Then
128         Call RefreshCharStatus(AttackerIndex)
        End If

130     If Status(AttackerIndex) = 2 Then If UserList(AttackerIndex).Faccion.ArmadaReal = 1 Then Call ExpulsarFaccionReal(AttackerIndex)


132     Call AllMascotasAtacanUser(VictimIndex, AttackerIndex)
134     Call AllMascotasAtacanUser(AttackerIndex, VictimIndex)

        Exit Sub

UsuarioAtacadoPorUsuario_Err:
136     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UsuarioAtacadoPorUsuario", Erl)
138     Resume Next
        
End Sub

Public Function PuedeAtacar(ByVal AttackerIndex As Integer, ByVal VictimIndex As Integer) As Boolean
        
        On Error GoTo PuedeAtacar_Err
        

        '***************************************************
        'Autor: Unknown
        'Last Modification: 24/01/2007
        'Returns true if the AttackerIndex is allowed to attack the VictimIndex.
        '24/01/2007 Pablo (ToxicWaste) - Ordeno todo y agrego situacion de Defensa en ciudad Armada y Caos.
        '***************************************************
        Dim T    As eTrigger6
        Dim rank As Integer

        'MUY importante el orden de estos "IF"...

        'Estas muerto no podes atacar
100     If UserList(AttackerIndex).flags.Muerto = 1 Then
102         Call WriteLocaleMsg(AttackerIndex, "77", FontTypeNames.FONTTYPE_INFO)
            'Call WriteConsoleMsg(attackerIndex, "No podés atacar porque estas muerto", FontTypeNames.FONTTYPE_INFO)
104         PuedeAtacar = False
            Exit Function

        End If
        
106     If UserList(AttackerIndex).flags.EnReto Then
108         If Retos.Salas(UserList(AttackerIndex).flags.SalaReto).TiempoItems > 0 Then
110             Call WriteConsoleMsg(AttackerIndex, "No podés atacar en este momento.", FontTypeNames.FONTTYPE_INFO)
112             PuedeAtacar = False
                Exit Function
            End If
        End If

        'No podes atacar a alguien muerto
114     If UserList(VictimIndex).flags.Muerto = 1 Then
116         Call WriteConsoleMsg(AttackerIndex, "No podés atacar a un espiritu.", FontTypeNames.FONTTYPE_INFO)
118         PuedeAtacar = False
            Exit Function

        End If
        
        ' No podes atacar si estas en consulta
120     If UserList(AttackerIndex).flags.EnConsulta Then
122         Call WriteConsoleMsg(AttackerIndex, "No puedes atacar usuarios mientras estas en consulta.", FontTypeNames.FONTTYPE_INFO)
124         PuedeAtacar = False
            Exit Function
    
        End If
        
        ' No podes atacar si esta en consulta
126     If UserList(VictimIndex).flags.EnConsulta Then
128         Call WriteConsoleMsg(AttackerIndex, "No puedes atacar usuarios mientras estan en consulta.", FontTypeNames.FONTTYPE_INFO)
130         PuedeAtacar = False
            Exit Function
    
        End If
        
132     If UserList(AttackerIndex).flags.Maldicion = 1 Then
134         Call WriteConsoleMsg(AttackerIndex, "¡Estas maldito! No podes atacar.", FontTypeNames.FONTTYPE_INFO)
136         PuedeAtacar = False
            Exit Function

        End If
        
138     If UserList(AttackerIndex).flags.Montado = 1 Then
140         Call WriteConsoleMsg(AttackerIndex, "No podés atacar usando una montura.", FontTypeNames.FONTTYPE_INFO)
142         PuedeAtacar = False
            Exit Function

        End If

        'Estamos en una Arena? o un trigger zona segura?
144     T = TriggerZonaPelea(AttackerIndex, VictimIndex)

146     If T = eTrigger6.TRIGGER6_PERMITE Then
148         PuedeAtacar = True
            Exit Function
150     ElseIf T = eTrigger6.TRIGGER6_PROHIBE Then
152         PuedeAtacar = False
            Exit Function
154     ElseIf T = eTrigger6.TRIGGER6_AUSENTE Then

            'Si no estamos en el Trigger 6 entonces es imposible atacar un gm
            ' If Not UserList(VictimIndex).flags.Privilegios And PlayerType.User Then
            '   If UserList(VictimIndex).flags.AdminInvisible = 0 Then Call WriteConsoleMsg(attackerIndex, "El ser es demasiado poderoso", FontTypeNames.FONTTYPE_WARNING)
            ' PuedeAtacar = False
            '    Exit Function
            ' End If
        End If
        
        'Solo administradores pueden atacar a usuarios (PARA TESTING)
156     If (UserList(AttackerIndex).flags.Privilegios And (PlayerType.user Or PlayerType.Admin)) = 0 Then
158         PuedeAtacar = False
            Exit Function
        End If
        
        'Estas queriendo atacar a un GM?
160     rank = PlayerType.Admin Or PlayerType.Dios Or PlayerType.SemiDios Or PlayerType.Consejero

162     If (UserList(VictimIndex).flags.Privilegios And rank) > (UserList(AttackerIndex).flags.Privilegios And rank) Then
164         If UserList(VictimIndex).flags.AdminInvisible = 0 Then Call WriteConsoleMsg(AttackerIndex, "El ser es demasiado poderoso", FontTypeNames.FONTTYPE_WARNING)
166         PuedeAtacar = False
            Exit Function

        End If

        'Sos un Armada atacando un ciudadano?
168     If (Status(VictimIndex) = 1) And (esArmada(AttackerIndex)) Then
170         Call WriteConsoleMsg(AttackerIndex, "Los soldados del Ejercito Real tienen prohibido atacar ciudadanos.", FontTypeNames.FONTTYPE_WARNING)
172         PuedeAtacar = False
            Exit Function

        End If

        'Tenes puesto el seguro?
174     If UserList(AttackerIndex).flags.Seguro Then
176         If Status(VictimIndex) = 1 Then
178             Call WriteConsoleMsg(AttackerIndex, "No podes atacar ciudadanos, para hacerlo debes desactivar el seguro.", FontTypeNames.FONTTYPE_WARNING)
180             PuedeAtacar = False
                Exit Function

            End If

        End If

        'Es un ciuda queriando atacar un imperial?
182     If UserList(AttackerIndex).flags.Seguro Then
184         If (Status(AttackerIndex) = 1) And (esArmada(VictimIndex)) Then
186             Call WriteConsoleMsg(AttackerIndex, "Los ciudadanos no pueden atacar a los soldados imperiales.", FontTypeNames.FONTTYPE_WARNING)
188             PuedeAtacar = False
                Exit Function

            End If

        End If
        
190     If esCaos(AttackerIndex) And esCaos(VictimIndex) Then
192         Call WriteConsoleMsg(AttackerIndex, "Los miembros de las fuerzas del caos se pueden atacar entre si.", FontTypeNames.FONTTYPE_WARNING)
194         PuedeAtacar = False
            Exit Function
        End If

        'Estas en un Mapa Seguro?
196     If MapInfo(UserList(VictimIndex).Pos.Map).Seguro = 1 Then

198         If esArmada(AttackerIndex) Then
200             If UserList(AttackerIndex).Faccion.RecompensasReal >= 3 Then
202                 If UserList(VictimIndex).Pos.Map = 58 Or UserList(VictimIndex).Pos.Map = 59 Or UserList(VictimIndex).Pos.Map = 60 Then
204                     Call WriteConsoleMsg(VictimIndex, "Huye de la ciudad! estas siendo atacado y no podrás defenderte.", FontTypeNames.FONTTYPE_WARNING)
206                     PuedeAtacar = True 'Beneficio de Armadas que atacan en su ciudad.
                        Exit Function

                    End If

                End If

            End If

208         If esCaos(AttackerIndex) Then
210             If UserList(AttackerIndex).Faccion.RecompensasCaos >= 3 Then
212                 If UserList(VictimIndex).Pos.Map = 195 Or UserList(VictimIndex).Pos.Map = 196 Then
214                     Call WriteConsoleMsg(VictimIndex, "Huye de la ciudad! estas siendo atacado y no podrás defenderte.", FontTypeNames.FONTTYPE_WARNING)
216                     PuedeAtacar = True 'Beneficio de Caos que atacan en su ciudad.
                        Exit Function

                    End If

                End If

            End If

218         Call WriteConsoleMsg(AttackerIndex, "Esta es una zona segura, aqui no podes atacar otros usuarios.", FontTypeNames.FONTTYPE_WARNING)
220         PuedeAtacar = False
            Exit Function

        End If

        'Estas atacando desde un trigger seguro? o tu victima esta en uno asi?
222     If MapData(UserList(VictimIndex).Pos.Map, UserList(VictimIndex).Pos.X, UserList(VictimIndex).Pos.Y).trigger = eTrigger.ZONASEGURA Or MapData(UserList(AttackerIndex).Pos.Map, UserList(AttackerIndex).Pos.X, UserList(AttackerIndex).Pos.Y).trigger = eTrigger.ZONASEGURA Then
224         Call WriteConsoleMsg(AttackerIndex, "No podes pelear aqui.", FontTypeNames.FONTTYPE_WARNING)
226         PuedeAtacar = False
            Exit Function

        End If

228     PuedeAtacar = True

        
        Exit Function

PuedeAtacar_Err:
230     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PuedeAtacar", Erl)
232     Resume Next
        
End Function

Public Function PuedeAtacarNPC(ByVal AttackerIndex As Integer, ByVal NpcIndex As Integer) As Boolean
        '***************************************************
        'Autor: Unknown Author (Original version)
        'Returns True if AttackerIndex can attack the NpcIndex
        'Last Modification: 24/01/2007
        '24/01/2007 Pablo (ToxicWaste) - Orden y corrección de ataque sobre una mascota y guardias
        '14/08/2007 Pablo (ToxicWaste) - Reescribo y agrego TODOS los casos posibles cosa de usar
        'esta función para todo lo referente a ataque a un NPC. Ya sea Magia, Físico o a Distancia.
        '***************************************************
        
        On Error GoTo PuedeAtacarNPC_Err
        

        'Estas muerto?
100     If UserList(AttackerIndex).flags.Muerto = 1 Then
            'Call WriteConsoleMsg(attackerIndex, "No podés atacar porque estas muerto", FontTypeNames.FONTTYPE_INFO)
102         Call WriteLocaleMsg(AttackerIndex, "77", FontTypeNames.FONTTYPE_INFO)
104         PuedeAtacarNPC = False
            Exit Function

        End If
             
106     If UserList(AttackerIndex).flags.Montado = 1 Then
108         Call WriteConsoleMsg(AttackerIndex, "No podés atacar usando una montura.", FontTypeNames.FONTTYPE_INFO)
110         PuedeAtacarNPC = False
            Exit Function

        End If
        
        If UserList(AttackerIndex).flags.Inmunidad = 1 Then
            Call WriteConsoleMsg(AttackerIndex, "Espera un momento antes de atacar a la criatura.", FontTypeNames.FONTTYPE_INFO)
            PuedeAtacarNPC = False
            Exit Function
        End If

        'Solo administradores pueden atacar a usuarios (PARA TESTING)
112     If (UserList(AttackerIndex).flags.Privilegios And (PlayerType.user Or PlayerType.Dios Or PlayerType.Admin)) = 0 Then
114         PuedeAtacarNPC = False
            Exit Function
        End If
        
        ' No podes atacar si estas en consulta
116     If UserList(AttackerIndex).flags.EnConsulta Then
118         Call WriteConsoleMsg(AttackerIndex, "No puedes atacar npcs mientras estas en consulta.", FontTypeNames.FONTTYPE_INFO)
120         PuedeAtacarNPC = False
            Exit Function

        End If
        
        'Es una criatura atacable?
122     If NpcList(NpcIndex).Attackable = 0 Then
            'No es una criatura atacable
124         Call WriteConsoleMsg(AttackerIndex, "No podés atacar esta criatura.", FontTypeNames.FONTTYPE_INFO)
126         PuedeAtacarNPC = False
            Exit Function

        End If

        'Es valida la distancia a la cual estamos atacando?
128     If Distancia(UserList(AttackerIndex).Pos, NpcList(NpcIndex).Pos) >= MAXDISTANCIAARCO Then
130         Call WriteLocaleMsg(AttackerIndex, "8", FontTypeNames.FONTTYPE_INFO)
            'Call WriteConsoleMsg(attackerIndex, "Estás muy lejos para disparar.", FontTypeNames.FONTTYPE_FIGHT)
132         PuedeAtacarNPC = False
            Exit Function

        End If


        'Si el usuario pertenece a una faccion
134     If esArmada(AttackerIndex) Or esCaos(AttackerIndex) Then
            ' Y el NPC pertenece a la misma faccion
136         If NpcList(NpcIndex).flags.Faccion = UserList(AttackerIndex).Faccion.Status Then
138             Call WriteConsoleMsg(AttackerIndex, "No podés atacar NPCs de tu misma facción, para hacerlo debes desenlistarte.", FontTypeNames.FONTTYPE_INFO)
140             PuedeAtacarNPC = False
                Exit Function
            End If
            
            ' Si es una mascota, checkeamos en el Maestro
142         If NpcList(NpcIndex).MaestroUser > 0 Then
144             If UserList(NpcList(NpcIndex).MaestroUser).Faccion.Status = UserList(AttackerIndex).Faccion.Status Then
146                 Call WriteConsoleMsg(AttackerIndex, "No podés atacar NPCs de tu misma facción, para hacerlo debes desenlistarte.", FontTypeNames.FONTTYPE_INFO)
148                 PuedeAtacarNPC = False
                    Exit Function
                End If
            End If
        End If
        
150     If Status(AttackerIndex) = Ciudadano Then
152         If NpcList(NpcIndex).MaestroUser > 0 And NpcList(NpcIndex).MaestroUser = AttackerIndex Then
154             Call WriteConsoleMsg(AttackerIndex, "No puedes atacar a tus mascotas siendo un ciudadano.", FontTypeNames.FONTTYPE_INFO)
156             PuedeAtacarNPC = False
                Exit Function
            End If
        End If
        
        
        ' El seguro es SOLO para ciudadanos. La armada debe desenlistarse antes de querer atacar y se checkea arriba.
        ' Los criminales o Caos, ya estan mas alla del seguro.
158     If Status(AttackerIndex) = Ciudadano Then
            
160         If NpcList(NpcIndex).flags.Faccion = Armada Then
162             If UserList(AttackerIndex).flags.Seguro Then
164                 Call WriteConsoleMsg(AttackerIndex, "Debes quitar el seguro para atacar miembros de la Armada Real (/seg)", FontTypeNames.FONTTYPE_INFO)
166                 PuedeAtacarNPC = False
                    Exit Function
                Else
168                 Call WriteConsoleMsg(AttackerIndex, "Atacaste un miembro de la Armada Real! Te has convertido en un Criminal.", FontTypeNames.FONTTYPE_INFO)
170                 Call VolverCriminal(AttackerIndex)
172                 PuedeAtacarNPC = True
                    Exit Function
                End If
            End If
            
            'Es el NPC mascota de alguien?
174         If NpcList(NpcIndex).MaestroUser > 0 Then
176             Select Case UserList(NpcList(NpcIndex).MaestroUser).Faccion.Status
                    Case e_Facciones.Armada
178                     If UserList(AttackerIndex).flags.Seguro Then
180                         Call WriteConsoleMsg(AttackerIndex, "Debes quitar el seguro para atacar mascotas de la Armada Real (/seg)", FontTypeNames.FONTTYPE_INFO)
182                         PuedeAtacarNPC = False
                            Exit Function
                        Else
184                         Call WriteConsoleMsg(AttackerIndex, "Atacaste una mascota de la Armada Real! Te has convertido en un Criminal.", FontTypeNames.FONTTYPE_INFO)
186                         Call VolverCriminal(AttackerIndex)
188                         PuedeAtacarNPC = True
                            Exit Function
                        End If
                        
190                 Case e_Facciones.Ciudadano
192                     If UserList(AttackerIndex).flags.Seguro Then
194                         Call WriteConsoleMsg(AttackerIndex, "Debes quitar el seguro para atacar mascotas de otros ciudadanos(/seg)", FontTypeNames.FONTTYPE_INFO)
196                         PuedeAtacarNPC = False
                            Exit Function
                        Else
198                         Call WriteConsoleMsg(AttackerIndex, "Atacaste un la mascota de un ciudadano! Te has convertido en un Criminal.", FontTypeNames.FONTTYPE_INFO)
200                         Call VolverCriminal(AttackerIndex)
202                         PuedeAtacarNPC = True
                            Exit Function
                        End If
                    
204                 Case Else
206                     PuedeAtacarNPC = True
                        Exit Function
                End Select
            End If
        End If
        
        'Es el Rey Preatoriano?
208     If NpcList(NpcIndex).NPCtype = eNPCType.Pretoriano Then
210         If Not ClanPretoriano(NpcList(NpcIndex).ClanIndex).CanAtackMember(NpcIndex) Then
212             Call WriteConsoleMsg(AttackerIndex, "Debes matar al resto del ejercito antes de atacar al rey.", FontTypeNames.FONTTYPE_FIGHT)
                Exit Function
    
            End If
    
        End If

214     PuedeAtacarNPC = True

        
        Exit Function

PuedeAtacarNPC_Err:
216     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PuedeAtacarNPC", Erl)
218     Resume Next
        
End Function

Sub CalcularDarExp(ByVal UserIndex As Integer, ByVal NpcIndex As Integer, ByVal ElDaño As Long)
        '***************************************************
        'Autor: Nacho (Integer)
        'Last Modification: 03/09/06 Nacho
        'Reescribi gran parte del Sub
        'Ahora, da toda la experiencia del npc mientras este vivo.
        '***************************************************
        
        On Error GoTo CalcularDarExp_Err
        
100     If NpcList(NpcIndex).MaestroUser <> 0 Then
            Exit Sub
        End If

102     If UserList(UserIndex).Grupo.EnGrupo Then
104         Call CalcularDarExpGrupal(UserIndex, NpcIndex, ElDaño)
        Else

            Dim ExpaDar As Double
    
            '[Nacho] Chekeamos que las variables sean validas para las operaciones
106         If ElDaño <= 0 Then ElDaño = 0
108         If NpcList(NpcIndex).Stats.MaxHp <= 0 Then Exit Sub

            '[Nacho] La experiencia a dar es la porcion de vida quitada * toda la experiencia
            
110         ExpaDar = CDbl(ElDaño) * CDbl(NpcList(NpcIndex).GiveEXP) / NpcList(NpcIndex).Stats.MaxHp

112         If ExpaDar <= 0 Then Exit Sub

            '[Nacho] Vamos contando cuanta experiencia sacamos, porque se da toda la que no se dio al user que mata al NPC
            'Esto es porque cuando un elemental ataca, no se da exp, y tambien porque la cuenta que hicimos antes
            'Podria dar un numero fraccionario, esas fracciones se acumulan hasta formar enteros ;P
114         If ExpaDar > NpcList(NpcIndex).flags.ExpCount Then
116             ExpaDar = NpcList(NpcIndex).flags.ExpCount
118             NpcList(NpcIndex).flags.ExpCount = 0
            Else
120             NpcList(NpcIndex).flags.ExpCount = NpcList(NpcIndex).flags.ExpCount - ExpaDar

            End If
    
122         If ExpMult > 0 Then
124             ExpaDar = ExpaDar * ExpMult * UserList(UserIndex).flags.ScrollExp
    
            End If
    
126         If UserList(UserIndex).donador.activo = 1 Then
128             ExpaDar = ExpaDar * 1.1

            End If

130         If ExpaDar > 0 Then
                If NpcList(NpcIndex).nivel Then
                    Dim DeltaLevel As Integer
                    DeltaLevel = UserList(UserIndex).Stats.ELV - NpcList(NpcIndex).nivel
                    If Abs(DeltaLevel) > 5 Then ' Qué pereza da desharcodear
                        ExpaDar = Math.Exp(15 - Abs(3 * DeltaLevel))
                        
                        Call WriteConsoleMsg(UserIndex, "La criatura es demasiado " & IIf(DeltaLevel < 0, "poderosa", "débil") & " y obtienes experiencia reducida al luchar contra ella", FontTypeNames.FONTTYPE_WARNING)
                    End If
                End If

132             If UserList(UserIndex).Stats.ELV < STAT_MAXELV Then
134                 UserList(UserIndex).Stats.Exp = UserList(UserIndex).Stats.Exp + ExpaDar

136                 If UserList(UserIndex).Stats.Exp > MAXEXP Then UserList(UserIndex).Stats.Exp = MAXEXP

138                 Call WriteUpdateExp(UserIndex)
140                 Call CheckUserLevel(UserIndex)

                End If
            
142             Call WriteTextOverTile(UserIndex, "+" & PonerPuntos(ExpaDar), UserList(UserIndex).Pos.X, UserList(UserIndex).Pos.Y, RGB(0, 169, 255))

            End If

        End If

        
        Exit Sub

CalcularDarExp_Err:
144     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.CalcularDarExp", Erl)
146     Resume Next
        
End Sub

Private Sub CalcularDarExpGrupal(ByVal UserIndex As Integer, ByVal NpcIndex As Integer, ByVal ElDaño As Long)
        
        On Error GoTo CalcularDarExpGrupal_Err
        

        '***************************************************
        'Autor: Nacho (Integer)
        'Last Modification: 03/09/06 Nacho
        'Reescribi gran parte del Sub
        'Ahora, da toda la experiencia del npc mientras este vivo.
        '***************************************************
        Dim ExpaDar                 As Long
        Dim BonificacionGrupo       As Single
        Dim CantidadMiembrosValidos As Integer
        Dim i                       As Long
        Dim index                   As Integer

        'If UserList(UserIndex).Grupo.EnGrupo Then
        '[Nacho] Chekeamos que las variables sean validas para las operaciones
100     If NpcIndex = 0 Then Exit Sub
102     If UserIndex = 0 Then Exit Sub
104     If ElDaño <= 0 Then ElDaño = 0
106     If NpcList(NpcIndex).Stats.MaxHp <= 0 Then Exit Sub
108     If ElDaño > NpcList(NpcIndex).Stats.MinHp Then ElDaño = NpcList(NpcIndex).Stats.MinHp
    
        '[Nacho] La experiencia a dar es la porcion de vida quitada * toda la experiencia
110     ExpaDar = CLng((ElDaño) * (NpcList(NpcIndex).GiveEXP / NpcList(NpcIndex).Stats.MaxHp))

112     If ExpaDar <= 0 Then Exit Sub

        '[Nacho] Vamos contando cuanta experiencia sacamos, porque se da toda la que no se dio al user que mata al NPC
        'Esto es porque cuando un elemental ataca, no se da exp, y tambien porque la cuenta que hicimos antes
        'Podria dar un numero fraccionario, esas fracciones se acumulan hasta formar enteros ;P
114     If ExpaDar > NpcList(NpcIndex).flags.ExpCount Then
116         ExpaDar = NpcList(NpcIndex).flags.ExpCount
118         NpcList(NpcIndex).flags.ExpCount = 0
        Else
120         NpcList(NpcIndex).flags.ExpCount = NpcList(NpcIndex).flags.ExpCount - ExpaDar
        End If
        
122     For i = 1 To UserList(UserList(UserIndex).Grupo.Lider).Grupo.CantidadMiembros
124         index = UserList(UserList(UserIndex).Grupo.Lider).Grupo.Miembros(i)
126         If UserList(index).flags.Muerto = 0 Then
128             If UserList(UserIndex).Pos.Map = UserList(index).Pos.Map Then
130                 If Abs(UserList(UserIndex).Pos.X - UserList(index).Pos.X) < 20 Then
132                     If Abs(UserList(UserIndex).Pos.Y - UserList(index).Pos.Y) < 20 Then
134                         If UserList(UserIndex).Stats.ELV < STAT_MAXELV Then 'hay una var del lvl max?
136                             CantidadMiembrosValidos = CantidadMiembrosValidos + 1
                            End If
                        End If
                    End If
                End If
            End If
        Next
        
138     If CantidadMiembrosValidos = 0 Then Exit Sub
        
140     If ExpMult > 0 Then
142         ExpaDar = ExpaDar * ExpMult
        End If

144     ExpaDar = ExpaDar / CantidadMiembrosValidos

        Dim ExpUser As Long, DeltaLevel As Integer

146     If ExpaDar > 0 Then
148         For i = 1 To UserList(UserList(UserIndex).Grupo.Lider).Grupo.CantidadMiembros
150             index = UserList(UserList(UserIndex).Grupo.Lider).Grupo.Miembros(i)
    
152             If UserList(index).flags.Muerto = 0 Then
154                 If Distancia(UserList(UserIndex).Pos, UserList(index).Pos) < 20 Then

156                     ExpUser = 0

158                     If UserList(index).donador.activo = 1 Then
160                         ExpUser = ExpaDar * 1.1
                        Else
162                         ExpUser = ExpaDar
                        End If
                    
164                     ExpUser = ExpUser * UserList(index).flags.ScrollExp
                
166                     If UserList(Index).Stats.ELV < STAT_MAXELV Then
                            If NpcList(NpcIndex).nivel Then
                                DeltaLevel = UserList(Index).Stats.ELV - NpcList(NpcIndex).nivel
                                If Abs(DeltaLevel) > 5 Then ' Qué pereza da desharcodear
                                    ExpaDar = Math.Exp(15 - Abs(3 * DeltaLevel))
                                    
                                    Call WriteConsoleMsg(Index, "La criatura es demasiado " & IIf(DeltaLevel < 0, "poderosa", "débil") & " y obtienes experiencia reducida al luchar contra ella", FontTypeNames.FONTTYPE_WARNING)
                                End If
                            End If

168                         UserList(Index).Stats.Exp = UserList(Index).Stats.Exp + ExpUser

170                         If UserList(index).Stats.Exp > MAXEXP Then UserList(index).Stats.Exp = MAXEXP

172                         If UserList(index).ChatCombate = 1 Then
174                             Call WriteLocaleMsg(index, "141", FontTypeNames.FONTTYPE_EXP, ExpUser)

                            End If

176                         Call WriteUpdateExp(index)
178                         Call CheckUserLevel(index)

                        End If
    
                    Else
    
                        'Call WriteConsoleMsg(Index, "Estas demasiado lejos del grupo, no has ganado experiencia.", FontTypeNames.FONTTYPE_INFOIAO)
180                     If UserList(index).ChatCombate = 1 Then
182                         Call WriteLocaleMsg(index, "69", FontTypeNames.FONTTYPE_New_GRUPO)
    
                        End If
    
                    End If
    
                Else
    
184                 If UserList(index).ChatCombate = 1 Then
186                     Call WriteConsoleMsg(Index, "Estás muerto, no has ganado experencia del grupo.", FontTypeNames.FONTTYPE_New_GRUPO)
    
                    End If
    
                End If
    
188         Next i
        End If

        'Else
        '    Call WriteConsoleMsg(UserIndex, "No te encontras en ningun grupo, experencia perdida.", FontTypeNames.FONTTYPE_New_GRUPO)
        'End If

        
        Exit Sub

CalcularDarExpGrupal_Err:
190     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.CalcularDarExpGrupal", Erl)
192     Resume Next
        
End Sub

Private Sub CalcularDarOroGrupal(ByVal UserIndex As Integer, ByVal GiveGold As Long)
        
        On Error GoTo CalcularDarOroGrupal_Err
        

        '***************************************************
        'Autor: Nacho (Integer)
        'Last Modification: 03/09/06 Nacho
        'Reescribi gran parte del Sub
        'Ahora, da toda la experiencia del npc mientras este vivo.
        '***************************************************
        Dim OroDar            As Long

100     OroDar = GiveGold * OroMult

        Dim orobackup As Long

102     orobackup = OroDar

        Dim i     As Byte

        Dim index As Byte

104     OroDar = OroDar / UserList(UserList(UserIndex).Grupo.Lider).Grupo.CantidadMiembros

106     For i = 1 To UserList(UserList(UserIndex).Grupo.Lider).Grupo.CantidadMiembros
108         index = UserList(UserList(UserIndex).Grupo.Lider).Grupo.Miembros(i)

110         If UserList(index).flags.Muerto = 0 Then
112             If UserList(UserIndex).Pos.Map = UserList(index).Pos.Map Then
114                 If OroDar > 0 Then

116                     UserList(index).Stats.GLD = UserList(index).Stats.GLD + OroDar

118                     If UserList(index).ChatCombate = 1 Then
120                         Call WriteConsoleMsg(Index, "¡El grupo ha ganado " & PonerPuntos(OroDar) & " monedas de oro!", FontTypeNames.FONTTYPE_New_GRUPO)

                        End If

122                     Call WriteUpdateGold(index)

                    End If

                Else

                    'Call WriteConsoleMsg(Index, "Estas demasiado lejos del grupo, no has ganado experiencia.", FontTypeNames.FONTTYPE_INFOIAO)
                    'Call WriteLocaleMsg(Index, "69", FontTypeNames.FONTTYPE_INFOIAO)
                End If

            Else

                '  Call WriteConsoleMsg(Index, "Estas muerto, no has ganado oro del grupo.", FontTypeNames.FONTTYPE_INFOIAO)
            End If

124     Next i

        'Else
        '    Call WriteConsoleMsg(UserIndex, "No te encontras en ningun grupo, oro perdido.", FontTypeNames.FONTTYPE_New_GRUPO)
        'End If

        
        Exit Sub

CalcularDarOroGrupal_Err:
126     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.CalcularDarOroGrupal", Erl)
128     Resume Next
        
End Sub

Public Function TriggerZonaPelea(ByVal Origen As Integer, ByVal Destino As Integer) As eTrigger6
        On Error GoTo ErrHandler

        Dim tOrg As eTrigger
        Dim tDst As eTrigger

100     tOrg = MapData(UserList(Origen).Pos.Map, UserList(Origen).Pos.X, UserList(Origen).Pos.Y).trigger
102     tDst = MapData(UserList(Destino).Pos.Map, UserList(Destino).Pos.X, UserList(Destino).Pos.Y).trigger
    
104     If tOrg = eTrigger.ZONAPELEA Or tDst = eTrigger.ZONAPELEA Then
106         If tOrg = tDst Then
108             TriggerZonaPelea = TRIGGER6_PERMITE
            Else
110             TriggerZonaPelea = TRIGGER6_PROHIBE

            End If

        Else
112         TriggerZonaPelea = TRIGGER6_AUSENTE

        End If

        Exit Function
ErrHandler:
114     TriggerZonaPelea = TRIGGER6_AUSENTE
116     LogError ("Error en TriggerZonaPelea - " & Err.Description)

End Function

Private Sub UserDañoEspecial(ByVal AtacanteIndex As Integer, ByVal VictimaIndex As Integer)
        On Error GoTo UserDañoEspecial_Err

        Dim ArmaObjInd As Integer, ObjInd As Integer
100     ArmaObjInd = UserList(AtacanteIndex).Invent.WeaponEqpObjIndex
102     ObjInd = 0

104     If ArmaObjInd = 0 Then
106      ArmaObjInd = UserList(AtacanteIndex).Invent.NudilloObjIndex

        End If

        ' Preguntamos una vez mas, si no tiene Nudillos o Arma, no tiene sentido seguir.
108     If ArmaObjInd = 0 Then
          Exit Sub
        End If

110     If ObjData(ArmaObjInd).Proyectil = 0 Then
112         ObjInd = ArmaObjInd
        Else
114         ObjInd = UserList(AtacanteIndex).Invent.MunicionEqpObjIndex
        End If

        Dim puedeEnvenenar, puedeEstupidizar, puedeIncinierar, puedeParalizar As Boolean
116     puedeEnvenenar = (UserList(AtacanteIndex).flags.Envenena > 0) Or (ObjInd > 0 And ObjData(ObjInd).Envenena)
118     puedeEstupidizar = (UserList(AtacanteIndex).flags.Estupidiza > 0) Or (ObjInd > 0 And ObjData(ObjInd).Estupidiza)
120     puedeIncinierar = (UserList(AtacanteIndex).flags.incinera > 0) Or (ObjInd > 0 And ObjData(ObjInd).incinera)
122     puedeParalizar = (UserList(AtacanteIndex).flags.Paraliza > 0) Or (ObjInd > 0 And ObjData(ObjInd).Paraliza)

124     If puedeEnvenenar And (UserList(VictimaIndex).flags.Envenenado = 0) Then
126         If RandomNumber(1, 100) < 30 Then
128             UserList(VictimaIndex).flags.Envenenado = ObjData(ObjInd).Envenena
130             Call WriteCombatConsoleMsg(VictimaIndex, "¡" & UserList(AtacanteIndex).Name & " te ha envenenado!")
132             Call WriteCombatConsoleMsg(AtacanteIndex, "¡Has envenenado a " & UserList(VictimaIndex).Name & "!")
            
                Exit Sub
            End If
        End If

134     If puedeIncinierar And (UserList(VictimaIndex).flags.Incinerado = 0) Then
136         If RandomNumber(1, 100) < 10 Then
138             UserList(VictimaIndex).flags.Incinerado = 1
140             UserList(VictimaIndex).Counters.Incineracion = 1
142             Call WriteCombatConsoleMsg(VictimaIndex, "¡" & UserList(AtacanteIndex).Name & " te ha Incinerado!")
144             Call WriteCombatConsoleMsg(AtacanteIndex, "¡Has Incinerado a " & UserList(VictimaIndex).Name & "!")
            
                Exit Sub
            End If
        End If

146     If puedeParalizar And (UserList(VictimaIndex).flags.Paralizado = 0) Then
148         If RandomNumber(1, 100) < 10 Then
150             UserList(VictimaIndex).flags.Paralizado = 1
152             UserList(VictimaIndex).Counters.Paralisis = 6

154             Call WriteParalizeOK(VictimaIndex)
156             Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageCreateFX(UserList(VictimaIndex).Char.CharIndex, 8, 0))

158             Call WriteCombatConsoleMsg(VictimaIndex, "¡" & UserList(AtacanteIndex).Name & " te ha paralizado!")
160             Call WriteCombatConsoleMsg(AtacanteIndex, "¡Has paralizado a " & UserList(VictimaIndex).Name & "!")

                Exit Sub
            End If
        End If

162     If puedeEstupidizar And (UserList(VictimaIndex).flags.Estupidez = 0) Then
164         If RandomNumber(1, 100) < 13 Then
166             UserList(VictimaIndex).flags.Estupidez = 1
168             UserList(VictimaIndex).Counters.Estupidez = 3 ' segundos?

170             Call WriteDumb(VictimaIndex)
172             Call SendData(SendTarget.ToPCArea, VictimaIndex, PrepareMessageParticleFX(UserList(VictimaIndex).Char.CharIndex, 30, 30, False))

174             Call WriteCombatConsoleMsg(VictimaIndex, "¡" & UserList(AtacanteIndex).Name & " te ha estupidizado!")
176             Call WriteCombatConsoleMsg(AtacanteIndex, "¡Has estupidizado a " & UserList(VictimaIndex).Name & "!")

                Exit Sub
            End If
        End If

        Exit Sub

UserDañoEspecial_Err:
178     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.UserDañoEspecial", Erl)
180     Resume Next

End Sub

Sub AllMascotasAtacanUser(ByVal victim As Integer, ByVal Maestro As Integer)
        'Reaccion de las mascotas
        
        On Error GoTo AllMascotasAtacanUser_Err

        Dim iCount As Long
        Dim mascotaIndex As Integer
    
100     With UserList(Maestro)
    
102         For iCount = 1 To MAXMASCOTAS
104             mascotaIndex = .MascotasIndex(iCount)
            
106             If mascotaIndex > 0 Then
108                 If NpcList(mascotaIndex).flags.AtacaUsuarios Then
110                     NpcList(mascotaIndex).flags.AttackedBy = UserList(victim).name
112                     NpcList(mascotaIndex).Target = victim
114                     NpcList(mascotaIndex).Movement = TipoAI.NpcDefensa
116                     NpcList(mascotaIndex).Hostile = 1
                    End If
                    
                End If
            
118         Next iCount
    
        End With
        
        Exit Sub

AllMascotasAtacanUser_Err:
120     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.AllMascotasAtacanUser", Erl)
        
End Sub

Public Sub AllMascotasAtacanNPC(ByVal NpcIndex As Integer, ByVal UserIndex As Integer)
        On Error GoTo AllMascotasAtacanNPC_Err
        
        Dim j As Long
        Dim mascotaIdx As Integer
        
100     For j = 1 To MAXMASCOTAS
102         mascotaIdx = UserList(UserIndex).MascotasIndex(j)
            
104         If mascotaIdx > 0 And mascotaIdx <> NpcIndex Then
106             With NpcList(mascotaIdx)
                    
108                 If .flags.AtacaNPCs And .TargetNPC = 0 Then
110                     .TargetNPC = NpcIndex
112                     .Movement = TipoAI.NpcAtacaNpc
                    End If
            
                End With
            End If
114     Next j
        
        Exit Sub

AllMascotasAtacanNPC_Err:
116     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.AllMascotasAtacanNPC", Erl)
        
End Sub

Private Function PuedeDesequiparDeUnGolpe(ByVal UserIndex As Integer) As Boolean
        On Error GoTo PuedeDesequiparDeUnGolpe_Err
    
100     With UserList(UserIndex)
102         Select Case .clase
    
            Case eClass.Bandit, eClass.Thief
104             PuedeDesequiparDeUnGolpe = (.Stats.UserSkills(eSkill.Wrestling) >= 100) And (.Invent.WeaponEqpObjIndex = 0)

106         Case Else
108             PuedeDesequiparDeUnGolpe = False
    
            End Select
            
        End With
        
        Exit Function

PuedeDesequiparDeUnGolpe_Err:
110     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PuedeDesequiparDeUnGolpe", Erl)
112     Resume Next
        
End Function

Private Function PuedeApuñalar(ByVal UserIndex As Integer) As Boolean
        
        On Error GoTo PuedeApuñalar_Err
        
100     With UserList(UserIndex)

102         If .Invent.WeaponEqpObjIndex > 0 Then
104             PuedeApuñalar = (.clase = eClass.Assasin Or .Stats.UserSkills(eSkill.Apuñalar) >= MIN_APUÑALAR) And ObjData(.Invent.WeaponEqpObjIndex).Apuñala = 1
            End If
            
        End With
        
        Exit Function

PuedeApuñalar_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PuedeApuñalar", Erl)
108     Resume Next
        
End Function

Private Function PuedeGolpeCritico(ByVal UserIndex As Integer) As Boolean
        ' Autor: WyroX - 16/01/2021
        
        On Error GoTo PuedeGolpeCritico_Err
        
100     With UserList(UserIndex)
    
102         If .Invent.WeaponEqpObjIndex > 0 Then
                ' Esto me parece que esta MAL; subtipo 2 es incinera :/
104             PuedeGolpeCritico = .clase = eClass.Bandit And ObjData(.Invent.WeaponEqpObjIndex).Subtipo = 2
            End If
            
        End With
        
        Exit Function

PuedeGolpeCritico_Err:
106     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.PuedeGolpeCritico", Erl)
108     Resume Next
        
End Function

Private Function ProbabilidadApuñalar(ByVal UserIndex As Integer) As Integer

        ' Autor: WyroX - 16/01/2021
        
        On Error GoTo ProbabilidadApuñalar_Err

100     With UserList(UserIndex)

            Dim Skill  As Integer
102         Skill = .Stats.UserSkills(eSkill.Apuñalar)
        
104         Select Case .clase
    
                Case eClass.Assasin '20%
106                 ProbabilidadApuñalar = 0.33 * Skill
    
108             Case eClass.Pirat, eClass.Hunter '15%
110                 ProbabilidadApuñalar = 0.15 * Skill
    
112             Case Else ' 10%
114                 ProbabilidadApuñalar = 0.1 * Skill
    
            End Select
            
            ' Daga especial da +5 de prob. de apu
116         If ObjData(.Invent.WeaponEqpObjIndex).Subtipo = 42 Then
118             ProbabilidadApuñalar = ProbabilidadApuñalar + 5
            End If
            
        End With
        
        Exit Function

ProbabilidadApuñalar_Err:
120     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ProbabilidadApuñalar", Erl)
122     Resume Next
        
End Function

Private Function ProbabilidadGolpeCritico(ByVal UserIndex As Integer) As Integer
        On Error GoTo ProbabilidadGolpeCritico_Err

100     ProbabilidadGolpeCritico = 0.2 * UserList(UserIndex).Stats.UserSkills(eSkill.Wrestling)

        Exit Function

ProbabilidadGolpeCritico_Err:
102     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ProbabilidadGolpeCritico", Erl)
104     Resume Next

End Function

Private Function ProbabilidadDesequipar(ByVal UserIndex As Integer) As Integer
        On Error GoTo ProbabilidadDesequipar_Err

100     With UserList(UserIndex)

102         Select Case .clase
    
            Case eClass.Bandit
104             ProbabilidadDesequipar = 0.2 * 100
    
106         Case eClass.Thief
108             ProbabilidadDesequipar = 0.33 * 100
    
110         Case Else
112             ProbabilidadDesequipar = 0
    
            End Select
               
        End With
        
        Exit Function

ProbabilidadDesequipar_Err:
114     Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.ProbabilidadDesequipar", Erl)
116     Resume Next
        
End Function


' Helper function to simplify the code. Keep private!
Private Sub WriteCombatConsoleMsg(ByVal UserIndex As Integer, ByVal message As String)
            On Error GoTo WriteCombatConsoleMsg_Err

100         If UserList(UserIndex).ChatCombate = 1 Then
102             Call WriteConsoleMsg(UserIndex, message, FontTypeNames.FONTTYPE_FIGHT)
            End If

            Exit Sub

WriteCombatConsoleMsg_Err:
104         Call RegistrarError(Err.Number, Err.Description, "SistemaCombate.WriteCombatConsoleMsg", Erl)
106         Resume Next

End Sub
