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
    receiver = new MidiReceiver();
    device = MidiSystem.getMidiDevice(midiDeviceInfo[MIDI_DEVICE_NUMBER]);
    device.open();
    transmitter = device.getTransmitter();
    transmitter.setReceiver(receiver);
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