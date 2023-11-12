### EPub-Optimizer

Improve your EPub experience with faster page turning on any device, including E-Ink. Streamline your EPub files by significantly reducing their size. A lighter EPub leads to quicker page turns, making your reading more seamless.

### Usage:

1. Download the tool (600 MB compressed, 100 MB download).
2. Extract and keep the "data" folder unchanged.
3. Run "Optimise.bat" by dragging and dropping the EPub file onto it.

### How It Works:

This tool addresses the main reason behind slow EPub page turns: excessive file sizes, often falsely attributed to high-quality ebook covers. EPubs, especially from platforms like Amazon Kindle, can be burdened with unnecessary details, causing huge delays. The tool optimizes cover quality, focusing on a practical solution to enhance overall performance, especially on E-Ink devices.

### Settings:

Customize settings by editing the batch file:

1. **Quality:**
   - Locate the lines:
     ```batch
        :: Set quality { 1 - 100 }:
        set "quality=35"
     ```
   - Adjust the value of "quality=35" for optimal results. The default is 35% (recommended).

2. **Color:**
   - Locate the lines:
     ```batch
        :: Set Color { Gray / RGB }:
        set "color=Gray"
     ```
   - Opt for "color=Gray" for E-Ink devices, eliminating unnecessary color processing and improving speed.

3. **Send to E-Ink:**
   - Locate the lines:
     ```batch
     :: Set Send To E-Ink { 0 - 1 }:
     set "send_to_eink=0"

     :: Set Device Label { Any }:
     set "device_label=Tolino"

     :: Set path on device { ! Case sensitive ! }:
     set "path_on_device=Downloads"
     ```
   - Set "send_to_eink=1" to enable sending the optimized EPub to an E-Ink device.
   - Set "device_label=Tolino" with the label of your E-Ink device found in "This PC" section in the File Explorer. Modify it as needed, just ensure it's not already in use from another device.
   - Set "path_on_device=Downloads" for the destination path on the device.

Save the file, and with these new settings, the EPub-Optimizer will automatically send the optimized EPub to the specified E-Ink device, enhancing your reading experience with faster page turns.

3. **Background:**
I embarked on creating this tool after searching for a solution online and finding none that effectively addressed the issue. Frustrated with the lack of options, I decided to develop the EPub-Optimizer to be the first to provide a practical and efficient solution.

Enjoy effortless optimization!
