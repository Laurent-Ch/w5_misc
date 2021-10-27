# README

## Answers

A.
A1.
number_of_albums = Album.all.size
   (1.5ms)  SELECT COUNT(*) FROM "albums"
 => 347 

A2.
artist = Track.find_by(title: 'White Room')
  Track Load (0.4ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."title" = ? LIMIT ?  [["title", "White Room"], ["LIMIT", 1]]
 => #<Track id: 505, title: "White Room", album: "The Cream Of Clapton", artist: "Eric Clapton", duration: 301583, size: 9872606, price: 0.99, c... 
artist = Track.where(title: 'White Room')
  Track Load (0.2ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."title" = ? LIMIT ?  [["title", "White Room"], ["LIMIT", 11]]
 => #<ActiveRecord::Relation [#<Track id: 505, title: "White Room", album: "The Cream Of Clapton", artist: "Eric Clapton", duration: 301583, siz... 

A3.
song = Track.where(duration: 188133)
  Track Load (0.3ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."duration" = ? LIMIT ?  [["duration", 188133], ["LIMIT", 11]]
 => #<ActiveRecord::Relation [#<Track id: 40, title: "Perfect", album: "Jagged Little Pill", artist: "Alanis Morissette", duration: 188133, size... 

A4.
mystery_album = Album.where(title: "Use Your Illusion II")
  Album Load (0.2ms)  SELECT  "albums".* FROM "albums" WHERE "albums"."title" = ? LIMIT ?  [["title", "Use Your Illusion II"], ["LIMIT", 11]]
 => #<ActiveRecord::Relation [#<Album id: 786, title: "Use Your Illusion II", artist: "Guns N Roses", created_at: "2021-10-27 16:21:41", updated... 

B.
B1.
2.7.4 :030 > number_of_great = Album.where("title like ?", "%Great%").count
2.7.4 :031 >   
   (2.0ms)  SELECT COUNT(*) FROM "albums" WHERE (title like '%Great%')
 => 13 

B2.
2.7.4 :039 > delete_music = Album.where("title like ?", "%music%").delete_all
  Album Destroy (5.2ms)  DELETE FROM "albums" WHERE (title like '%music%')
 => 4 

B3.
2.7.4 :040 > AC_CD_albums = Album.where(artist: 'AC/DC').count
   (1.5ms)  SELECT COUNT(*) FROM "albums" WHERE "albums"."artist" = ?  [["artist", "AC/DC"]]
 => 2

B4.
2.7.4 :042 > weirdly_specific_request = Track.where(duration: 158589).count
   (1.6ms)  SELECT COUNT(*) FROM "tracks" WHERE "tracks"."duration" = ?  [["duration", 158589]]
 => 0 

C.
C1.
Track.where(artist:"AC/DC").each { |song| puts song.title }
  Track Load (0.4ms)  SELECT "tracks".* FROM "tracks" WHERE "tracks"."artist" = ?  [["artist", "AC/DC"]]
For Those About To Rock (We Salute You)
Put The Finger On You
Lets Get It Up
Inject The Venom
Snowballed
Evil Walks
C.O.D.
Breaking The Rules
Night Of The Long Knives
Spellbound
Go Down
Dog Eat Dog
Let There Be Rock
Bad Boy Boogie
Problem Child
Overdose
Hell Aint A Bad Place To Be
Whole Lotta Rosie

C2.
.7.4 :002 > Track.where(album:"Let There Be Rock").each { |song| puts song.title }
  Track Load (1.9ms)  SELECT "tracks".* FROM "tracks" WHERE "tracks"."album" = ?  [["album", "Let There Be Rock"]]
Go Down
Dog Eat Dog
Let There Be Rock
Bad Boy Boogie
Problem Child
Overdose
Hell Aint A Bad Place To Be
Whole Lotta Rosie


C3.1.
2.7.4 :008 > Track.where(album:"Let There Be Rock").sum(:price)
   (0.3ms)  SELECT SUM("tracks"."price") FROM "tracks" WHERE "tracks"."album" = ?  [["album", "Let There Be Rock"]]
 => 7.920000000000001 

C3.2.
2.7.4 :009 > Track.where(album:"Let There Be Rock").sum(:duration)
   (0.2ms)  SELECT SUM("tracks"."duration") FROM "tracks" WHERE "tracks"."album" = ?  [["album", "Let There Be Rock"]]
 => 2453259 

C4.
2.7.4 :010 > Track.where(artist: 'Deep Purple').sum(:price)
   (0.3ms)  SELECT SUM("tracks"."price") FROM "tracks" WHERE "tracks"."artist" = ?  [["artist", "Deep Purple"]]
 => 90.0899999999999 

C5.
2.7.4 :001 > Track.where(artist: 'Eric Clapton').each do |i|
2.7.4 :002 >   i.artist = "Britney Spears"
2.7.4 :003 >   i.save
2.7.4 :004 > end













