;==============================================================================================================
;==============================================================================================================
;=== _ColorCheckTolerance =====================================================================================
;--------------------------------------------------------------------------------------------------------------
;Returns the tolerance between 2 colors.
;--------------------------------------------------------------------------------------------------------------

Func _ColorCheckTolerance($nColor1, $nColor2, $Ignore = "")
   Local $Red1, $Red2, $Blue1, $Blue2, $Green1, $Green2, $values[3]

   $Red1 = Dec(StringMid(String($nColor1), 1, 2))
   $Blue1 = Dec(StringMid(String($nColor1), 3, 2))
   $Green1 = Dec(StringMid(String($nColor1), 5, 2))

   $Red2 = Dec(StringMid(String($nColor2), 1, 2))
   $Blue2 = Dec(StringMid(String($nColor2), 3, 2))
   $Green2 = Dec(StringMid(String($nColor2), 5, 2))

   Switch $Ignore
	  Case "Red" ; mask RGB - Red
		 $values[0] = Abs($Blue1 - $Blue2)
		 $values[1] = Abs($Green1 - $Green2)
		 $values[2] = 0
	  Case Else
		 $values[0] = Abs($Blue1 - $Blue2)
		 $values[1] = Abs($Green1 - $Green2)
		 $values[2] = Abs($Red1 - $Red2)
   EndSwitch
   Return _ArrayMax($values)
EndFunc   ;==>_ColorCheckTolerance
