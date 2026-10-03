Add-Type -AssemblyName System.Speech
try {
    $engine = New-Object System.Speech.Recognition.SpeechRecognitionEngine
    $audioPath = Join-Path $PSScriptRoot "audio.wav"
    if (-not (Test-Path $audioPath)) {
        Write-Error "Audio file not found: $audioPath"
        exit 1
    }
    $engine.SetInputToWaveFile($audioPath)
    $engine.LoadGrammar((New-Object System.Speech.Recognition.DictationGrammar))
    $allText = @()
    while ($true) {
        $res = $engine.Recognize()
        if ($null -eq $res) { break }
        $allText += $res.Text
    }
    if ($allText.Count -gt 0) {
        $allText -join " "
    } else {
        "No text recognized"
    }
} catch {
    $_.Exception.Message
}
