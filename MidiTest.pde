import javax.sound.midi.*;
import java.util.*;

// Objects for interacting with a MIDI device
MidiDevice.Info[] midiDeviceInfo = null;
MidiDevice device = null;
Transmitter keyboard = null;
MidiReceiver output = null;

// Constant to hold the device number for the keyboard
final static int KEYBOARD_DEVICE_NUMBER = 1;

// Boolean array to hold currently held down keys
boolean[] keyDown = new boolean[222];
boolean[] midiKeyDown = new boolean[120];
int[] midiKeyWeight = new int[120];
int cmd = 0, d1 = 0, d2 = 0;

public void setup() {
  // Create the canvas
  size(450, 400);

  midiDeviceInfo = MidiSystem.getMidiDeviceInfo();
  for (int i = 0; i < midiDeviceInfo.length; i++) {
    println("MIDI DEVICE NUMBER " + i + " Name: " + midiDeviceInfo[i].getName()
      + ", Vendor: " + midiDeviceInfo[i].getVendor()
      + ", Description: " + midiDeviceInfo[i].getDescription());
  }

  try {
    output = new MidiReceiver();
    device = MidiSystem.getMidiDevice(midiDeviceInfo[KEYBOARD_DEVICE_NUMBER]);
    device.open();
    keyboard = device.getTransmitter();
    keyboard.setReceiver(output);
  } 
  catch(MidiUnavailableException ex) {
    System.err.println("MIDI UNAVAILABLE");
  }
}

public void draw() {
  background(0);
  fill(255);
  textSize(75);
  text("cmd:" + cmd, 10, 100);
  text("note:" + d1, 10, 200);
  text("velocity:" + d2, 10, 300);
}