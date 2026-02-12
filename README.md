# QuickLook.LAVFilters

This is a part of the QuickLook program.

LAV Filters Nightly Build from https://files.1f0.de/lavf/nightly/

LAV Filters - ffmpeg based DirectShow Splitter and Decoders

LAV Filters are a set of DirectShow filters based on the libavformat and libavcodec libraries
from the ffmpeg project, which will allow you to play virtually any format in a DirectShow player.

The filters are still under development, so not every feature is finished, or every format supported.

# Package Reference

For projects that support [PackageReference](https://docs.microsoft.com/nuget/consume-packages/package-references-in-project-files), copy this XML node into the project file to reference the package.

```xml
<PackageReference Include="QuickLook.LAVFilters" Version="*" />
```

For details on including native files in your `.csproj`, see [Reference.xml](nuget\Reference.xml).

Compiling
=============================

Compiling is pretty straightforward using VS2019 (included project files).
Older versions of Visual Studio are not officially supported, but may still work.

It does, however, require that you build your own ffmpeg and libbluray.
You need to place the full ffmpeg package in a directory called "ffmpeg" in the
main source directory (the directory this file was in). There are scripts to
build a proper ffmpeg included.

I recommend using my fork of ffmpeg, as it includes additional patches for
media compatibility:
https://gitea.1f0.de/LAV/FFmpeg

libbluray is compiled with the MSVC project files, however, a specially modified
version of libbluray is required. Similar to ffmpeg, just place the full tree
inside the "libbluray" directory in the main directory.

You can get the modified version here:
https://gitea.1f0.de/LAV/libbluray

Feedback
=============================
GitHub Project: https://github.com/Nevcairiel/LAVFilters
Doom9: https://forum.doom9.org/showthread.php?t=156191
