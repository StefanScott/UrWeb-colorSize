CREATE TABLE uw_ColorSize_color(uw_id int8 NOT NULL, uw_nam text NOT NULL,
 PRIMARY KEY (uw_id),
  CONSTRAINT uw_ColorSize_color_Nam UNIQUE (uw_nam),
                                                    
   CONSTRAINT uw_ColorSize_color_Id CHECK (uw_id >= 0::int8)
 );
 
 CREATE TABLE uw_ColorSize_size(uw_id int8 NOT NULL, uw_nam text NOT NULL,
  PRIMARY KEY (uw_id),
   CONSTRAINT uw_ColorSize_size_Nam UNIQUE (uw_nam),
                                                    
    CONSTRAINT uw_ColorSize_size_Id CHECK (uw_id >= 0::int8)
  );
  
  CREATE TABLE uw_ColorSize_thing(uw_id int8 NOT NULL, uw_nam text NOT NULL, 
                                   uw_color int8 NOT NULL, 
                                   uw_size int8 NOT NULL,
   PRIMARY KEY (uw_id),
    CONSTRAINT uw_ColorSize_thing_Id CHECK (uw_id >= 0::int8),
                                                              
     CONSTRAINT uw_ColorSize_thing_Thing_isof_Color
      FOREIGN KEY (uw_color) REFERENCES uw_ColorSize_color (uw_id),
                                                                   
     CONSTRAINT uw_ColorSize_thing_Thing_isof_Size
      FOREIGN KEY (uw_size) REFERENCES uw_ColorSize_size (uw_id)
   );
   
   CREATE SEQUENCE uw_ColorSize_COLOR_seq;
    
    CREATE SEQUENCE uw_ColorSize_SIZE_seq;
     
     CREATE SEQUENCE uw_ColorSize_THING_seq;
      
      