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

public void setup() {
  // Create the canvas
  size(50, 50);

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