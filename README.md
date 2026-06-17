With this Visual Studio 2022 sample project one can create your own tracker for EthoVision 18 and 19. EthoVision can use custom trackers plugins. A tracker 
plugin has the following setup:
- component plugin implementing interface INECAdinsTiTrackerInterface3. A component should be registered in category CATID_VtsAddinsTrackerInterface3
- an arena tracker plugin implementing interface INECAdinsTiArenaTracker2. Arena trackers are created per trial / arena combination.
The sample project uses ATL to fill in the required COM boilerplate code.

The tracker on arena level gets three arena images (i.e. one raw 8-bit; one raw 24-bit and one preprocessed 8-bit image) in which object detection 
should take place. The sample project uses a simple blob detection algorithm from Claude which treats neighboring pixels as one blob. The largest blobs are returned to EthoVision as identified subjects per sample.

Download the project and build it with Visual Studio 2022. For debugging use EthoVision.exe as startup exe. The component should be loaded on open experiment;
arena trackers are created in detection settings and acquisition. GUID's should be globally unique so change the GUID's listed in readme.txt when the component
is used outside in the world to prevent clashes with other components.
