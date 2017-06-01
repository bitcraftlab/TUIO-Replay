
// start replaying OSC packets using bittwist
// you can install it using homebrew  ( brew install bittwist )

void setupNetwork() {
  
  // kill previously running instances of bittwist
  exec(new String[] { "killall", "bittwist" });
  
  // use bittwist -d to list network devices 
  int lo = 12;
   
  // replay pcap file that was captured with wireshark
  exec(new String[] { "/usr/local/bin/bittwist", "-i", str(lo), dataPath("drawing-bots.pcap") });
  
}