/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void options_click1(GButton source, GEvent event) { //_CODE_:optionsButton:619694:
   Options = GWindow.getWindow(this, "Options Menu", 0, 0, 500, 500, JAVA2D);
  Options.noLoop();
  Options.setActionOnClose(G4P.CLOSE_WINDOW);
  Options.addDrawHandler(this, "win_draw1");
  optionsLabel = new GLabel(Options, 2, 2, 80, 20);
  optionsLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  optionsLabel.setText("Options");
  optionsLabel.setOpaque(false);
  modeTogGroup = new GToggleGroup();
  randomOption = new GOption(Options, 58, 123, 163, 20);
  randomOption.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  randomOption.setText("Random Selection");
  randomOption.setOpaque(false);
  randomOption.addEventHandler(this, "random_clicked1");
  sequenceOption = new GOption(Options, 58, 143, 162, 20);
  sequenceOption.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  sequenceOption.setText("Sequential Selection");
  sequenceOption.setOpaque(false);
  sequenceOption.addEventHandler(this, "sequence_clicked1");
  modeTogGroup.addControl(randomOption);
  randomOption.setSelected(true);
  modeTogGroup.addControl(sequenceOption);
  modeLabel = new GLabel(Options, 59, 102, 80, 20);
  modeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  modeLabel.setText("MODE");
  modeLabel.setOpaque(false);
  displaySlider = new GSlider(Options, 37, 354, 405, 55, 30.0);
  displaySlider.setLimits(5.0, 0.1, 60.0);
  displaySlider.setNbrTicks(30);
  displaySlider.setNumberFormat(G4P.DECIMAL, 4);
  displaySlider.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  displaySlider.setOpaque(false);
  displaySlider.addEventHandler(this, "display_change1");
  infoCheckbox = new GCheckbox(Options, 314, 130, 137, 20);
  infoCheckbox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  infoCheckbox.setText("Display Image Info");
  infoCheckbox.setOpaque(false);
  infoCheckbox.addEventHandler(this, "info_clicked1");
  infoCheckbox.setSelected(true);
  newFolderButton = new GButton(Options, 323, 203, 112, 74);
  newFolderButton.setText("Select New Folder");
  newFolderButton.setTextBold();
  newFolderButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  newFolderButton.addEventHandler(this, "newFolder_click1");
  Options.loop();
} //_CODE_:optionsButton:619694:

public void pause_click1(GButton source, GEvent event) { //_CODE_:pauseButton:288519:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  options_GUI1.isPaused = !options_GUI1.isPaused;
} //_CODE_:pauseButton:288519:

public void hide_click1(GButton source, GEvent event) { //_CODE_:hideButton:523800:
  println("hideButton - GButton >> GEvent." + event + " @ " + millis());
  pauseButton.setVisible(false);
  hideButton.setVisible(false);
  optionsButton.setVisible(false);
  options_GUI1.hidden = true;
} //_CODE_:hideButton:523800:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:Options:269773:
  appc.background(230);
} //_CODE_:Options:269773:

public void random_clicked1(GOption source, GEvent event) { //_CODE_:randomOption:349306:
  println("randomOption - GOption >> GEvent." + event + " @ " + millis());
  options_GUI1.mode = 1;
} //_CODE_:randomOption:349306:

public void sequence_clicked1(GOption source, GEvent event) { //_CODE_:sequenceOption:335136:
  println("sequenceOption - GOption >> GEvent." + event + " @ " + millis());
  options_GUI1.mode = 0;
} //_CODE_:sequenceOption:335136:

public void mode2Option_clicked1(GOption source, GEvent event) { //_CODE_:mode2Option:307731:
  println("mode2Option - GOption >> GEvent." + event + " @ " + millis());
  options_GUI1.mode = 2;
} //_CODE_:mode2Option:307731:

public void mode3Option_clicked1(GOption source, GEvent event) { //_CODE_:mode3Option:464320:
  println("mode3Option - GOption >> GEvent." + event + " @ " + millis());
  options_GUI1.mode = 3;
} //_CODE_:mode3Option:464320:

public void mode4Option_clicked1(GOption source, GEvent event) { //_CODE_:mode4Option:988332:
  println("mode4Option - GOption >> GEvent." + event + " @ " + millis());
  options_GUI1.mode = 4;
} //_CODE_:mode4Option:988332:

public void mode5Option_clicked1(GOption source, GEvent event) { //_CODE_:mode5Option:575129:
  println("mode5Option - GOption >> GEvent." + event + " @ " + millis());
  options_GUI1.mode = 5;
} //_CODE_:mode5Option:575129:

public void display_change1(GSlider source, GEvent event) { //_CODE_:displaySlider:440814:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
  float f = source.getValueF();
  options_GUI1.time1 = f;
} //_CODE_:displaySlider:440814:

public void info_clicked1(GCheckbox source, GEvent event) { //_CODE_:infoCheckbox:333767:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
  if(source.isSelected())
  options_GUI1.displayInfo = true;
  else
  options_GUI1.displayInfo = false;
} //_CODE_:infoCheckbox:333767:

public void newFolder_click1(GButton source, GEvent event) { //_CODE_:newFolderButton:607300:
  println("newFolderButton - GButton >> GEvent." + event + " @ " + millis());
  options_GUI1.isPaused = true;
  loc = -1;
  selectFolder("Select a folder to process", "folderSelected");
} //_CODE_:newFolderButton:607300:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  optionsButton = new GButton(this, 1, 50, 200, 100);
  optionsButton.setText("Options");
  optionsButton.setTextBold();
  optionsButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  optionsButton.addEventHandler(this, "options_click1");
  pauseButton = new GButton(this, 205, 50, 80, 49);
  pauseButton.setText("Play/Pause");
  pauseButton.setTextBold();
  pauseButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  pauseButton.addEventHandler(this, "pause_click1");
  hideButton = new GButton(this, 205, 100, 80, 49);
  hideButton.setText("Hide Menu");
  hideButton.setTextBold();
  hideButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  hideButton.addEventHandler(this, "hide_click1");
  Options = GWindow.getWindow(this, "Options Menu", 0, 0, 500, 500, JAVA2D);
  Options.noLoop();
  Options.setActionOnClose(G4P.CLOSE_WINDOW);
  Options.addDrawHandler(this, "win_draw1");
  optionsLabel = new GLabel(Options, 2, 2, 80, 20);
  optionsLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  optionsLabel.setText("Options");
  optionsLabel.setOpaque(false);
  modeTogGroup = new GToggleGroup();
  randomOption = new GOption(Options, 58, 123, 163, 20);
  randomOption.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  randomOption.setText("Random Selection");
  randomOption.setOpaque(false);
  randomOption.addEventHandler(this, "random_clicked1");
  sequenceOption = new GOption(Options, 58, 143, 162, 20);
  sequenceOption.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  sequenceOption.setText("Sequential Selection");
  sequenceOption.setOpaque(false);
  sequenceOption.addEventHandler(this, "sequence_clicked1");
  mode2Option = new GOption(Options, 58, 163, 162, 20);
  mode2Option.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  mode2Option.setText("Mode 2");
  mode2Option.setOpaque(false);
  mode2Option.addEventHandler(this, "mode2Option_clicked1");
  mode3Option = new GOption(Options, 58, 183, 162, 20);
  mode3Option.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  mode3Option.setText("Mode 3");
  mode3Option.setOpaque(false);
  mode3Option.addEventHandler(this, "mode3Option_clicked1");
  mode4Option = new GOption(Options, 58, 203, 162, 20);
  mode4Option.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  mode4Option.setText("Mode 4");
  mode4Option.setOpaque(false);
  mode4Option.addEventHandler(this, "mode4Option_clicked1");
  mode5Option = new GOption(Options, 58, 223, 162, 20);
  mode5Option.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  mode5Option.setText("Mode 5");
  mode5Option.setOpaque(false);
  mode5Option.addEventHandler(this, "mode5Option_clicked1");
  modeTogGroup.addControl(randomOption);
  randomOption.setSelected(true);
  modeTogGroup.addControl(sequenceOption);
  modeTogGroup.addControl(mode2Option);
  modeTogGroup.addControl(mode3Option);
  modeTogGroup.addControl(mode4Option);
  modeTogGroup.addControl(mode5Option);
  modeLabel = new GLabel(Options, 59, 102, 80, 20);
  modeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  modeLabel.setText("MODE");
  modeLabel.setOpaque(false);
  displaySlider = new GSlider(Options, 37, 354, 405, 55, 30.0);
  displaySlider.setLimits(5.0, 0.1, 60.0);
  displaySlider.setNbrTicks(30);
  displaySlider.setNumberFormat(G4P.DECIMAL, 4);
  displaySlider.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  displaySlider.setOpaque(false);
  displaySlider.addEventHandler(this, "display_change1");
  infoCheckbox = new GCheckbox(Options, 314, 130, 137, 20);
  infoCheckbox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  infoCheckbox.setText("Display Image Info");
  infoCheckbox.setOpaque(false);
  infoCheckbox.addEventHandler(this, "info_clicked1");
  infoCheckbox.setSelected(true);
  newFolderButton = new GButton(Options, 323, 203, 112, 74);
  newFolderButton.setText("Select New Folder");
  newFolderButton.setTextBold();
  newFolderButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  newFolderButton.addEventHandler(this, "newFolder_click1");
  Options.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton optionsButton; 
GButton pauseButton; 
GButton hideButton; 
GWindow Options;
GLabel optionsLabel; 
GToggleGroup modeTogGroup; 
GOption randomOption; 
GOption sequenceOption; 
GOption mode2Option; 
GOption mode3Option; 
GOption mode4Option; 
GOption mode5Option; 
GLabel modeLabel; 
GSlider displaySlider; 
GCheckbox infoCheckbox; 
GButton newFolderButton; 