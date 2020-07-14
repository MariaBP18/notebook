run("Bio-Formats Macro Extensions");
setBatchMode("true");
inputDirectory = "C:/Users/presi/Desktop/columbia_chemistry/Project_Fiji_CP_headless/image_in_fiji/";

outputDirectory = "C:/Users/presi/Desktop/columbia_chemistry/Project_Fiji_CP_headless/image_in_fiji_post_fiji/";

fileList = getFileList(inputDirectory);

for (i = 0; i < fileList.length; i++){
    file = inputDirectory + fileList[i];
    Ext.setId(file);
    print("Processing: " + file);
    Ext.openImagePlus(file);
    //check if id is better than title
    czititle = getTitle();
    print("Title: " + czititle);
    imageid = getImageID();
    print('image id : ' + imageid);
    //Ext.setId(imageid);
    run("Z Project...", "projection=[Average Intensity]");
    title = getTitle();
    num = lastIndexOf(title, "/");
	file_name = substring(title, num+1);
    dotIndex = indexOf(file_name, ".");
    name = substring(file_name, 0, dotIndex);
    saveAs("Tiff", outputDirectory + "AVG_" + name + ".tif");
    //getDimensions(w, h, channels, s, f);
    //print(channels);
    close();
    //selectImage(imageid);
    selectWindow(czititle);
    run("Z Project...", "projection=[Max Intensity]");
    title = getTitle();
    num = lastIndexOf(title, "/");
	file_name = substring(title, num+1);
    dotIndex = indexOf(file_name, ".");
    name = substring(file_name, 0, dotIndex);
    saveAs("Tiff", outputDirectory + "MAX_" + name + ".tif");
    getDimensions(w, h, channels, s, f);
    //print(channels);
    close();
    Ext.close();
    close("*");}
exit("error message");


//imageid = getImageID();
//print(imageid);
//Ext.getImageCount(imageCount);
//Ext.openImage("",image);
//outFile = outputDirectory + "test_" + image + ".tif";
//print(outFile);
//saveAs("Tiff", outFile);
//close();}
//Ext.close();}

//for (i = 0; i < fileList.length; i++) {
//	file = directory + fileList[i];
//	Ext.setId(file);
//	Ext.getImageCount(imageCount);
//	Ext.openImage("",image);
//	outFile = outputDirectory + "test_" + image + ".tif";
//	print(outFile);
//	saveAs("Tiff", outFile);
//	close();}
//	Ext.close();}
//	for (image = 0; image < imageCount; image++) {
//		Ext.openImage("",image);
//		outFile = outputDirectory + "test_" + image + ".tif";
//		print(outFile);
//		saveAs("Tiff", outFile);
//		close();}
//		Ext.close();}

