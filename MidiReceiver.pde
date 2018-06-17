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
      CMD = shortMsg.getCommand();
      NOTE = shortMsg.getData1();
      VELOCITY = shortMsg.getData2();

      System.out.println("DEBUG CMD " + CMD + " | NOTE: " + NOTE + " | VELOCITY: " + VELOCITY);
    }
  }

  @Override
    public void close() {
    rcvr.close();
  }
} 