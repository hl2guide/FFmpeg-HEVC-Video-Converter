# FFmpeg-HEVC-Video-Converter 1.0

A PowerShell script to convert videos to the HEVC video format utilizing GPU hardware acceleration using FFmpeg for Windows.

The main benefit being that you can save disk space significantly (most of the time):

## Examples

- 2.5GB MP4 to 500MB HEVC MP4
- 3GB MP4 to 800MB HEVC MP4

_Results vary and depend on the input video's format, bitrate etc._

## Minimum System Requirements

- PC with at least 2 cores
- Recent NVidia or AMD graphics card

**VITAL: ALWAYS check the resulting video files, ending with "(HEVC)" for expected length and try them out in a video player.**

**Please note that the resulting HEVC videos require a more powerful PC to decode and playback, than the original would.**

## Script Usage

1. download FFmpeg for Windows: https://ffmpeg.zeranoe.com/builds/ (see screenshots below)
2. extract ffmpeg.exe to a known path/folder
3. download **convert_to_HEVC_using_ffmpeg.ps1** and create **video_file_list.txt** alongside it
4. make 4 edits in **convert_to_HEVC_using_ffmpeg.ps1** using PowerShell ISE
5. copy+paste full paths into **video_file_list.txt** and save
6. run **convert_to_HEVC_using_ffmpeg.ps1** to convert to HEVC

# Screenshots

[ffmpeg stable release selections shown](https://raw.githubusercontent.com/hl2guide/FFmpeg-HEVC-Video-Converter/master/MEDIA/FFmpeg.png "FFMPEG")
