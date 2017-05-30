import g4p_controls.*; //<>// //<>//

import java.util.*;
import java.io.*;
import javax.swing.*;
import javax.imageio.ImageIO;

File root;
ArrayList<File> images;
int loc=-1;
PImage current, play1, pause;
File f;
options_GUI options_GUI1= new options_GUI();
boolean live;


void setup() {
  size(1000, 1000);
  live = false;
  surface.setResizable(true);
  createGUI();
  images = new ArrayList<File>();
  selectFolder("Select a folder to process", "folderSelected");  
  frameRate(20);
  play1 = loadImage("play.png");
  pause = loadImage("pause.png");
}

void folderSelected(File selection) {
  if (selection == null) {
    selectFolder("Select a folder to process", "folderSelected");
  } else {
    root = selection;
    images = new ArrayList<File>();
    loadFolder(root, images);
    live = true;
  }
}

void draw() {
  if (live) {
    background(0);

    if (!options_GUI1.isPaused)
      options_GUI1.count++;


    if (options_GUI1.count > options_GUI1.time1*20) {
      options_GUI1.count = 0;
      selectImage();
    }
    fill(255);
    textSize(20);
    if (current.width > current.height) {
      image(current, 0, height/2 - width*current.height/current.width/2, width, width*current.height/current.width);
    } else {
      image(current, width/2 - height*current.width/current.height/2, 0, height*current.width/current.height, height);
    }
    if (options_GUI1.displayInfo) {
      text(f.getName(), 0, 25);
      text(f.getParentFile().getName(), width-400, 25);
    }

    fill(255);
    if (!options_GUI1.hidden) {
      if (!options_GUI1.isPaused) {
        rect(300, 50, 100, 100);
        image(play1, 300, 50, 100, 100);
      } else {
        rect(300, 50, 100, 100);
        image(pause, 300, 50, 100, 100);
      }
    }
  }
}


void mousePressed() {
  if (options_GUI1.hidden) {
    options_GUI1.hidden = false;
    pauseButton.setVisible(true);
    hideButton.setVisible(true);
    optionsButton.setVisible(true);
  }
}


void loadFolder(File folder, ArrayList<File> list) {
  File[] children = folder.listFiles();

  for (File child : children) {
    if (child.isDirectory()) {
      if (!child.getName().toLowerCase().contains("unorganized")&&!child.getName().toLowerCase().contains("delete"))
        loadFolder(child, list);
    } else {
      list.add(child);
    }
  }
}


void selectImage() {
  current = null;
  while (current == null) {
    File temp = null; 
    switch(options_GUI1.mode) {
    case 0: //Pure Sequencial (Left To Right)
      loc++;
      if (loc == images.size())
        loc=0;
      temp = images.get(loc);
      break;
    case 1: //Completely random
      loc = (int)random(0, images.size());
      temp = images.get(loc);
      break;
    case 2: //1 deep folder sequence, then pure random
      File[] children = root.listFiles();
      loc++;
      if (loc >= children.length) {
        loc = 0;
      }
      while (!children[loc].isDirectory()) {
        loc++;
        if (loc >= children.length) {
          loc = 0;
        }
      }
      temp = getRandomFile(children[loc]);
      break;
    case 3: //weighted random (based on folder)
      temp = getPseudoRandomFile(root);
      break;
    case 4: //sloppy sequential
    loc+= (int) random(5,10);
      if (loc >= images.size())
        loc= (int) random(0,5);
      temp = images.get(loc);
      break;
    case 5: 
      File[] childrenz = root.listFiles();
      loc++;
      if (loc >= childrenz.length) {
        loc = 0;
      }
      while (!childrenz[loc].isDirectory()) {
        loc++;
        if (loc >= childrenz.length) {
          loc = 0;
        }
      }
      temp = getPseudoRandomFile(childrenz[loc]);
    }

    try {
      if (ImageIO.read(temp) != null) {
        current = loadImage(temp.getPath());
        println(temp);
        f = temp;
      }else{
        temp = null;
      }
    }
    catch(Exception e) {
      println("Exception: " + e);
    }
  }
}


File getRandomFile(File folder) {
  ArrayList<File> temp = new ArrayList<File>();
  loadFolder(folder, temp);
  int i = (int)random(0, temp.size());
  return temp.get(i);
}

File getPseudoRandomFile(File folder) {
  ArrayList<File> folders = new ArrayList<File>();
  ArrayList<File> foliage = new ArrayList<File>();
  File[] children = folder.listFiles();
  for (File child : children) {
    if (child.isDirectory()) {
      folders.add(child);
    } else {
      foliage.add(child);
    }
  }
  int i = 0;
  if(foliage.size() > 0){
  i = (int)random(0, folders.size() + 1);
  }else{
   i = (int)random(0, folders.size());
  }
  if (i == folders.size()) {
    try{
    int j = (int)random(0, foliage.size());
    return foliage.get(j);
    }catch(Exception e){
      println(e);
      return null;
    }
  } else {
    return getPseudoRandomFile(folders.get(i));
  }
}