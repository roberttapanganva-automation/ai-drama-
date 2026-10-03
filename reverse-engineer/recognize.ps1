Add-Type -AssemblyName System.Speech
try {
    $engine = New-Object System.Speech.Recognition.SpeechRecognitionEngine
    $audioPath = Join-Path $PSScriptRoot "speech_input.wav"
    if (-not (Test-Path $audioPath)) {
        Write-Error "Audio file not found: $audioPath"
        exit 1
    }
    $engine.SetInputToWaveFile($audioPath)
    $engine.LoadGrammar((New-Object System.Speech.Recognition.DictationGrammar))
    
    $fullTranscript = @()
    while ($true) {
        $result = $engine.Recognize()
        if ($null -eq $result) {
            break
        }
        $fullTranscript += $result.Text
    }
    if ($fullTranscript.Count -gt 0) {
        $fullTranscript -join " "
    } else {
        "NO_WORDS_DETECTED"
    }
} catch {
    $_.Exception.ToString()
}
