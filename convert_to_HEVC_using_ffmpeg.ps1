# Converts videos to HEVC for all paths in "video_file_list.txt"

# Note: To copy paths in Windows File Explorer
# Hold down the shift key and right click a selection of video files,
# click "Copy as Path" and paste into "video_file_list.txt" and save.

# Ref: https://trac.ffmpeg.org/wiki/Encode/H.265

# Start Edits (4 in total)
# Edit 1 of 4 - Set to the path of ffmepg.exe:
$ffmpegEXE = 'Z:\Commands\ffmpeg.exe'
# Edit 2 of 4 - Presets are ultrafast, superfast, veryfast,
# faster, fast, medium, slow, slower, or veryslow:
$preset = 'medium'
# Edit 3 of 4: Video List File:
$videosListFile = "$PSScriptRoot\video_file_list.txt"
# Edit 4 of 4:
# Default 'hevc_nvenc' is for recent nVidia GPU.
# Set it to 'hevc_vaapi' if you are using a recent AMD video card instead.
$hardwareEncoder = 'hevc_nvenc'
# End Edits

# DO NOT EDIT BELOW HERE ==================================================

$arguments = ''

if(!(Test-Path $ffmpegEXE -PathType leaf))
{
    Write-Host "ffmpeg.exe not found, please check path in `$ffmpegEXE." -ForegroundColor Yellow
    exit
}

# Gets Video List File Contents
$videos = Get-Content -Path $videosListFile
$videoID = 1
$count = $videos.Count
if($videos.Count -lt 1)
{
    Write-Host "No videos found in: $PSScriptRoot\video_file_list.txt" -ForegroundColor Red
    exit
}

Write-Host "Converting $count videos.." -ForegroundColor Cyan

foreach($video in $videos)
{
    # Converts using ffmpeg
    $video = $video.Replace("`"", "")
    $inputFile = $video
    #$inputFolder = (Get-Item $inputFile).Directory.FullName
    $outputFile = $video.Insert(($video.Length - 4), '(HEVC)')
    #$outputFolder = $inputFolder
    #$inputFile
    #$outputFile
    Write-Host
    Write-Host "Converting video ($videoID of $count), please wait.." -ForegroundColor Magenta
    Write-Host "$video `nto:`n$outputFile" -ForegroundColor White
    Write-Host

    #$outputFilePath = "$outputFolder\$outputFileName" testing: -threads 2
    # hevc_nvenc
    # libx265
    $arguments = "-i `"$inputFile`" -hide_banner -y -xerror -threads 2 -c:a copy -c:s copy -c:v $hardwareEncoder " +
    "-crf 28 -preset $preset `"$outputFile`""
    #$arguments
    #$outputFile
    #exit
    #$videoID
    #Start-Process $ffmpegEXE -ArgumentList $arguments -WindowStyle Minimized -Wait
    Start-Process $ffmpegEXE -ArgumentList $arguments -WindowStyle Minimized
    $processName = 'ffmpeg'
    Start-Sleep -Seconds 8
    # Sets to use 3 cores (always set to one less core that your CPU has)
    # 2 Cores = 3, 3 Cores = 7, 4 cores = 15, 5 cores = 31, 6 cores = 63
    # Code to calculate for your CPU:
    # $noOfCores = Get-WmiObject Win32_Processor | Measure-Object NumberOfLogicalProcessors -Sum
    # $noOfCores.Sum = $noOfCores.Sum - 1
    # [math]::Pow(2,$($noOfCores).Sum) - 1
    #
    $process = Get-Process $processName; $process.ProcessorAffinity=7
    Start-Sleep -Seconds 8
    # Sets priorty to High
    # Values: High, AboveNormal, Normal, BelowNormal, Low
    $process = Get-Process -Id $process.Id
    $process.PriorityClass = 'High'

    # Waits for process to complete
    $processID = (Get-Process $processName).id
    Wait-Process -Id $processID

    # Increments video counter
    $videoID = $videoID + 1
    Start-Sleep -Seconds 4
}

Write-Host "Finished converting $count videos." -ForegroundColor Green

exit