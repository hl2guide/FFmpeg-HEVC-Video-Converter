# FFmpeg-HEVC-Video-Converter

A PowerShell script to convert videos to the HEVC video format utilizing hardware acceleration using FFmpeg for Windows.

VITAL: Always check the resulting video files, ending with "(HEVC)" for expected length and try them out in a videop player.

## Usage

1. download FFmpeg for Windows: https://ffmpeg.zeranoe.com/builds/
2. extract ffmepg.exe to a known path
3. download **convert_to_HEVC_using_ffmpeg.ps1** and create **video_file_list.txt** alongside it
4. make 4 edits in **convert_to_HEVC_using_ffmpeg.ps1** using PowerShell ISE
5. copy+paste full paths into **video_file_list.txt** and save
6. run **convert_to_HEVC_using_ffmpeg.ps1** to convert to HEVC
