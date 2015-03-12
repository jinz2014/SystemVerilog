module enum_data();

enum integer {IDLE=0, GNT0=1, GNT1=2} state;
enum {RED,GREEN,ORANGE} color;
enum {BRONZE=3, SILVER, GOLD} medal;
enum {US, CHINA, INDIA} country;

// a=0, b=7, c=8
enum {a, b=7, c} alphabet;

// Width declaration
enum bit [3:0] {bronze='h1, silver, gold='h5} newMedal;

// Using enum in typedef
typedef enum { red, green, blue, yellow, white, black } Colors;

Colors Lcolors;

initial begin
  state = IDLE;
  color = RED;
  medal = BRONZE;
  alphabet = c;
  newMedal = silver;
  Lcolors = yellow;
  country = CHINA;

  $display (" state = %0d", state);
  $display (" state = %s", state.name());
  $display (" color = %s", color.name());
  $display (" medal = %s", medal.name());
  $display (" alphabet = %s", alphabet.name());
  $display (" newMedal = %s", newMedal.name());
  $display (" Lcolors = %s", Lcolors.name());

  $display (" country = %s", country.name());

  $finish;
end

endmodule
