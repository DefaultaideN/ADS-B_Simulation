- # 1 ADS-B Signal Encoding (Week 2)
  - ## 1.1 Information Extraction from JSON
    Current JSON consists of mixed information and is hard to seperate them to diferent ADS-B frames.
    - Data fields:
      - | Field | Usage  |
        |-------|--------|
        |   Id  | No use.|
        |Rcvr   |Rceiver ID, no use|
        |HasSig |Signal level? No use|
        |Icao   |Useful, ICAO ID|
        |Reg    |Plane register, no use|
        |FSeen  |First time see plane, no use|
        |Tsecs  |Time tracked, no use|
        |CMsgs  |Msg counter, no use|
        |Alt    |Useful. Standard pressure altitude, in feet|
        |Galt   |Useful? altitude adjusted for local air pressure, should be roughly the height above mean sea level|
        |InHG   |Useful? The air pressure in inches of mercury that was used to calculate the AMSL altitude from the standard pressure altitude.|
        |AltT   |The type of altitude transmitted by the aircraft: 0 = standard pressure altitude, 1 = indicated altitude (above mean sea level). Default to standard pressure altitude until told otherwise.|
        |Lat    |Useful. Latitude over ground|
        |Long   |Useful. Longitude over the ground|
        |PostTime| No use|
        |Mlat   |


    TODO:
    - [x] Ask Vidon for doc for JSON.
    - [ ] Seperate JSON to different data frames.
    - [ ] Optimize encoder.py to a usable status. Possible revisions: 1. Add other TYPE CODE instance. 2. Add binary output.
  - ## 1.2 DF17 Binary Array Creation
      Format the output of encoder to binary arrays. Should be in a 112 bits format. Easy for you to add relative noise.
- # 2 ADS-B Signal Decoding (Week 3)
  - ## 2.1 Reread Standard Decoding Procedure
    - Currently found standard decoding procedure in [The 1090MHz Riddle](https://mode-s.org/decode/content/ads-b/).
    - Can use part code from PyModeS.
- # 3 Adding ADS-B Signal Noise (Week 4)
  - ## 3.1 Phase shift noise.
  - ## 3.2 Receiver noise.
- # 4 Feeding to DAA (Week 5)
  - ## 4.1 Transform binary array to DAA structure.
  - ## 4.2 Possible data mixing part. (Ask Vidon for help)
- # 5 Batch Test (Week 6)
  - ## 5.1 Create possible test instances.
  - ## 5.2 Test in a automatic way.

