
# FFmpeg-HEVC-Video-Converter 1.0

A PowerShell script to convert videos to the HEVC video format utilizing GPU hardware acceleration using FFmpeg for Windows.

The main benefit being that you can save disk space significantly (most of the time).

## Space Saving Examples 💡

- 2.5GB MP4 to 500MB HEVC MP4
- 3GB MP4 to 800MB HEVC MP4

_Results vary and depend on the input video's format, bitrate etc._

## Minimum System Requirements 🖥️

- PC with at least 2 cores
- Recent NVidia or AMD graphics card
- Enough free disk space for resulting video files

**VITAL: ALWAYS check the resulting video files, ending with "(HEVC)" for expected length and try them out in a video player checking for quality and smooth playback.**

## Encoding 🎞️

During encoding (conversion) it is normal for high **CPU** and **GPU** usage. Be sure to only run the script when the PC has no other processes hogging up resources.

The script encodes the files alongside the original with (HEVC) at the end of the filename.

## Decoding 📽️

The resulting HEVC videos require a more powerful PC to decode and playback, than the original would.

## Script Usage 📜

1. Download FFmpeg for Windows: https://ffmpeg.zeranoe.com/builds/ (see screenshots below)
2. Extract ffmpeg.exe to a known path/folder
3. Download **convert_to_HEVC_using_ffmpeg.ps1** and create **video_file_list.txt** alongside it
4. Make 4 edits in **convert_to_HEVC_using_ffmpeg.ps1** using PowerShell ISE
5. Copy+paste full paths into **video_file_list.txt** and save
6. Run **convert_to_HEVC_using_ffmpeg.ps1** to convert to HEVC

## Screenshots 📸

[ffmpeg stable release selections shown](https://raw.githubusercontent.com/hl2guide/FFmpeg-HEVC-Video-Converter/master/MEDIA/FFmpeg.png "FFMPEG Download Example")
