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