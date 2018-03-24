// Constants to hold the MIDI commands sent from my Akai MPK Mini MKII 
final static int KEY_ON = 144, KEY_OFF = 128;
final static int DRUMPAD_START = 1, DRUMPAD_END = 16;
final static int KNOB = 176, FOOTPEDAL = 64;

class MidiReceiver implements Receiver {
  Receiver rcvr;
  public MidiReceiver() {
    try {
      this.rcvr = MidiSystem.getReceiver();
    } 
    catch (MidiUnavailableException mue) {
      mue.printStackTrace();
    }
  }

  @Override
    public void send(MidiMessage message, long timeStamp) {
    if (message instanceof ShortMessage)
    {
      ShortMessage shortMsg = (ShortMessage) message;
      cmd = shortMsg.getCommand();
      d1 = shortMsg.getData1();
      d2 = shortMsg.getData2();

      System.out.println("DEBUG cmd " + cmd + " | note: " + d1 + " | velocity: " + d2);
    }
  }

  @Override
    public void close() {
    rcvr.close();
  }
} 