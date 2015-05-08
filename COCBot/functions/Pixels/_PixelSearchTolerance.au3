;==============================================================================================================
;==============================================================================================================
;=== _PixelSearchTolerance ====================================================================================
;--------------------------------------------------------------------------------------------------------------
;Checks the tolerance of each pixel and returns the lowest tolerance.
;It will log the location of any pixel of a tolerance below $iColorVariation
;--------------------------------------------------------------------------------------------------------------

Func _PixelSearchTolerance($iLeft, $iTop, $iRight, $iBottom, $iColor, $iColorVariation = 0)
   _CaptureRegion($iLeft, $iTop, $iRight, $iBottom)
   Local $lowestTolerance = 255
   For $x = $iRight - $iLeft To 0 Step -1
	  For $y = 0 To $iBottom - $iTop
		 Local $tolerance = _ColorCheckTolerance(_GetPixelColor($x, $y), $iColor)
		 If $tolerance < $lowestTolerance Then
			$lowestTolerance = $tolerance
			If $lowestTolerance < $iColorVariation Then
			   Local $Pos[2] = [$iLeft + $x, $iTop + $y]
			   SetLog("Tolerance of " & $lowestTolerance & " at " & $Pos[0] & ', ' & $Pos[1], $COLOR_BLUE)
			EndIf
		 EndIf
	  Next
   Next
   Return $lowestTolerance
EndFunc   ;==>_PixelSearchTolerance