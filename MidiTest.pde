import javax.sound.midi.*;
import java.util.*;

// Objects for interacting with a MIDI device
MidiDevice.Info[] midiDeviceInfo = null;
MidiDevice device = null;
Transmitter keyboard = null;
MidiReceiver output = null;

// Constant to hold the device number for the MIDI device
final static int MIDI_DEVICE_NUMBER = 3;

int CMD = 0, NOTE = 0, VELOCITY = 0;

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
    device = MidiSystem.getMidiDevice(midiDeviceInfo[MIDI_DEVICE_NUMBER]);
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
  text("cmd:" + CMD, 10, 100);
  text("note:" + NOTE, 10, 200);
  text("velocity:" + VELOCITY, 10, 300);
}