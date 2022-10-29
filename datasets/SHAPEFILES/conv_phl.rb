require "json"
require "zlib"
require "fileutils"

# PHL専用

# {
# "type": "FeatureCollection",
# "name": "h27ka16",
# "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:EPSG::4612" } },
# "features": [
# { "type": "Feature", "properties": { "KEY_CODE": "16201001001", "PREF": "16", "CITY": "201", "S_AREA": "001001", "PREF_NAME": "富山県", "CITY_NAME": "富山市", "S_NAME": "桜町１丁目", "KIGO_E": null, "HCODE": 8101, "AREA": 61179.222, "PERIMETER": 1126.625, "H27KAxx_": 3390, "H27KAxx_ID": 3389, "KEN": "16", "KEN_NAME": "富山県", "SITYO_NAME": null, "GST_NAME": "富山市", "CSS_NAME": null, "KIHON1": "0010", "DUMMY1": "-", "KIHON2": "01", "KEYCODE1": "201001001", "KEYCODE2": "201001001", "AREA_MAX_F": "M", "KIGO_D": null, "N_KEN": null, "N_CITY": null, "KIGO_I": null, "MOJI": "桜町１丁目", "KBSUM": 8, "JINKO": 234, "SETAI": 139, "X_CODE": 137.21466, "Y_CODE": 36.69948, "KCODE1": "0010-01" }, "geometry": { "type": "Polygon", "coordinates": [ [ [ 137.215531498955301, 36.699197506423253 ], [ 137.215174930777749, 36.698799012273042 ], [ 137.21465830203482, 36.698411565523259 ], [ 137.214193636790583, 36.69812766335432 ], [ 137.213614304811784, 36.697820148117962 ], [ 137.213137600105483, 36.697969806722895 ], [ 137.213083828626793, 36.698787245303897 ], [ 137.213062510843457, 36.699025860827888 ], [ 137.213032414632238, 36.699338617907799 ], [ 137.212945956075004, 36.700375383304923 ], [ 137.213406552561167, 36.700197496956477 ], [ 137.213914265615983, 36.700984789570299 ], [ 137.214971353180403, 36.700564743706693 ], [ 137.214826657512305, 36.70035435798745 ], [ 137.215224147936027, 36.700188670901717 ], [ 137.216493212826038, 36.699775916604743 ], [ 137.216391807966943, 36.699616982140562 ], [ 137.216024118310258, 36.699047689201514 ], [ 137.215569611386485, 36.699244381957001 ], [ 137.215531498955301, 36.699197506423253 ] ] ] } },


# Barangays
#{
#"type": "FeatureCollection",
#"name": "Barangays",
#"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
#"features": [
#{ "type": "Feature", "properties": { "ADM1_PCODE": "PH010000000", "ADM2_PCODE": "PH015500000", "ADM3_PCODE": "PH015502000", "ADM4_PCODE": "PH015502012", "ADM4_EN": "Pogomboa", "ADM3_EN": "Aguilar", "ADM2_EN": "Pangasinan", "ADM1_EN": "Region I", "ADM_ID": 15502012, "UPDATED": "2017-12-31", "PERIMETER": 5590.506, "AREA": 1745359.904, "LONGITUDE": 120.243, "LATITUDE": 15.882 }, "geometry": { "type": "Polygon", "coordinates": [ [ [ 120.254410793000034, 15.881116968000072 ], [ 120.247230541000022, 15.878702624000027 ], [ 120.241371985000114, 15.876738007000029 ], [ 120.238518596000063, 15.875445783000032 ], [ 120.236951404000024, 15.875995839000041 ], [ 120.235553810000056, 15.87978940000005 ], [ 120.234909401000095, 15.884049919000063 ], [ 120.234408658, 15.885235139000031 ], [ 120.234741217000078, 15.885183429000051 ], [ 120.234944658000018, 15.88519787000007 ], [ 120.235118163000038, 15.885266978000061 ], [ 120.23527669300006, 15.885382126000025 ], [ 120.235633105000034, 15.885849882000059 ], [ 120.235812563000081, 15.886028345000057 ], [ 120.235983079000107, 15.886117597000066 ], [ 120.236129676
# keycode > ADM_ID
# sname > ADM4_EN
# 中央位置は、 LONGITUDE, LATITUDEが使える

# Munincipalities
# {
#"type": "FeatureCollection",
#"name": "Municipalities",
#"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
#"features": [
#{ "type": "Feature", "properties": { "ADM3_EN": "Adams", "ADM3_PCODE": "PH012801000", "ADM2_EN": "Ilocos Norte", "ADM2_PCODE": "PH012800000", "ADM1_EN": "Region I", "ADM1_PCODE": "PH010000000", "ADM_ID": 12801000, "UPDATED": "2019-12-31", "PERIMETER": 45988.487, "AREA": 111143025.3, "LONGITUDE": 120.919, "LATITUDE": 18.453 }, "geometry": { "type": "Polygon", "coordinates": [ [ [ 120.946256722000044, 18.511575597000046 ], [ 120.969145183000023, 18.510116371000038 ], [ 120.958673098000077, 18.463202412000044 ], [ 120.947043607000069, 18.420625793000056 ], [ 120.948363267000104, 18.381693430000041 ], [ 120.914840178000077, 18.37693302100007 ], [ 120.870356695000055, 18.429886047000025 ], [ 120.889293472000077, 18.476307956000028 ], [ 120.872670318000019, 18.509416895000072 ], [ 120.910507757000119, 18.516357390000053 ], [ 120.92154564100008, 18.518382190000068 ], [ 120.92067803000009, 18.51462255000007 ], [ 120.946256722000044, 18.511575597000046 ] ] ] } },

# city > 12801000
# cityname > ADM3_EN

#{
#"type": "FeatureCollection",
#"name": "Provinces",
#"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
#"features": [
#{ "type": "Feature", "properties": { "ADM2_EN": "Abra", "ADM2_PCODE": "PH140100000", "ADM1_EN": "Cordillera Administrative Region", "ADM1_PCODE": "PH140000000", "ADM_ID": 140100000, "UPDATED": "2019-12-31", "PERIMETER": 286873.674, "AREA": 3926646159.0, "LONGITUDE": 120.803, "LATITUDE": 17.578 }, "geometry": { "type": "Polygon", "coordinates": [ [ [ 120.961093448000042, 17.95347692200005 ], [ 120.972008601000084, 17.946069066000064 ], [ 120.984689908000064, 17.94174900400003 ], [ 120.987228433000041, 17.938800343000025 ], [ 120.991582870000116, 17.93133750800007 ], [ 120.994345566000106, 17.924710094000034 ], [ 120.997011167000096, 17.915013086000044 ], [ 121.000191451000092, 17.903133044000072 ], [ 121.000615109000023, 17.886468613000034 ], [ 121.000727575000042, 17.882357908000074 ], [ 121.001162595000096, 17.866530141000055 ], [ 121.002466039000069, 17.853323841000076 ], [ 121.006031950000079, 17.848259769000038 ], [ 121.01063238100005, 17.844534031000023 ], [ 121.01914682000006, 17.841822682000043 ], [

# pref > ADM_ID
# prefname > ADM2_EN

# {
# "type": "FeatureCollection",
# "name": "Regions",
# "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
# "features": [
# { "type": "Feature", "properties": { "ADM1_EN": "Region VII", "ADM1_PCODE": "PH070000000", "ADM_ID": 70000000, "UPDATED": "2019-12-31", "PERIMETER": 3205930.229, "AREA": 14293657845.0, "LONGITUDE": 123.615, "LATITUDE": 9.921 }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 123.117637890000083, 9.649499695000031 ], [ 123.117648212000063, 9.649492064000071 ], [ 123.117674017000013, 9.649507327000038 ], [ 123.117684339000107, 9.649507327000038 ], [ 123.117723047000027, 9.649484431000076 ], [ 123.117730788000017, 9.64947425500003 ], [ 123.117730788000017, 9.64946407900004 ], [ 123.117735948000018, 9.649453903000051 ], [ 123.117743691000101, 9.649446271000045 ], [ 123.117772076000051, 9.649446271000045 ], [ 123.117

# Regionsは使わない
# 
              

print "unlinking..\n";
begin
  FileUtils.rm_rf("polygons")
  FileUtils.rm_rf("cities")
  FileUtils.rm_rf("prefs")  
rescue
end
print "unlinking done\n";
Dir.mkdir("polygons")
Dir.mkdir("cities")
Dir.mkdir("prefs")


#
# Province
#

log_of=File.open("prefs_phl.sql","w")
json=File.open("Provinces.json").read()
o=JSON.parse(json)

lat0_h={}
lat1_h={}
lng0_h={}
lng1_h={}
info_h={}
features = o["features"]

features.each do |ft|
  next if ft["type"]!="Feature"
  props = ft["properties"]
  pref = props["ADM2_PCODE"].sub("PH","")[0..3].to_i #   "PH015500000" > "015500000" > "0155"
  prefname = props["ADM2_EN"].sub("'","\\'") # "Pangasinan"
      
  geom = ft["geometry"]
  if geom["type"]!="Polygon" and geom["type"]!="MultiPolygon" then
    print "invalid type: ",geom["type"],"\n"
    exit(0)
    next
  end
  multi=false
  multi=true if geom["type"]=="MultiPolygon"

  coords = geom["coordinates"]
  # 緯度経度の範囲を事前計算

  if multi then
    lng0,lat0=coords[0][0][0]
    lng1,lat1=coords[0][0][0]    
    coords_ary=coords
  else
    lng0,lat0=coords[0][0]
    lng1,lat1=coords[0][0]
    coords_ary=[coords]
  end
  coords_ary.each do |list|
    list.each do |coordset| # 飛び地があるので配列になっているんだろう. coordsetは [lng,lat]の配列
      coordset.each do |coord|
        lng0=coord[0] if coord[0] < lng0
        lat0=coord[1] if coord[1] < lat0
        lng1=coord[0] if coord[0] > lng1
        lat1=coord[1] if coord[1] > lat1
      end
    end    
  end
  lat0_h[pref]=lat0 if !lat0_h[pref]
  lng0_h[pref]=lng0 if !lng0_h[pref]
  lat1_h[pref]=lat1 if !lat1_h[pref]
  lng1_h[pref]=lng1 if !lng1_h[pref]
  lat0_h[pref]=lat0 if lat0<lat0_h[pref]
  lng0_h[pref]=lng0 if lng0<lng0_h[pref]
  lat1_h[pref]=lat1 if lat1>lat1_h[pref]
  lng1_h[pref]=lng1 if lng1>lng1_h[pref]      

  info_h[pref]=[pref,prefname]

  print "pref=#{pref} prefname=#{prefname}\n"
  path="prefs/#{pref}.json" 
  json = JSON.generate(coords) # array of array of [lng,lat]
  File.open(path,"w") do |f| f.write(json) end

end

log_of.print("delete from prefs where country_iso='PHL'");
info_h.keys.each do |code|
  ary=info_h[code]
  pref,prefname=ary
  lat0=lat0_h[pref]
  lng0=lng0_h[pref]
  lat1=lat1_h[pref]
  lng1=lng1_h[pref]
  center_lat=(lat0+lat1)/2.0
  center_lng=(lng0+lng1)/2.0
  log_of.print("insert into prefs set country_iso='PHL',pref=#{pref},name='#{prefname}',lat0=#{lat0},lng0=#{lng0},lat1=#{lat1},lng1=#{lng1},center_lat=#{center_lat},center_lng=#{center_lng};\n")
end


#
# Munincipalities
#

log_of=File.open("cities_phl.sql","w")
json=File.open("Munincipalities.json").read()
o=JSON.parse(json)

lat0_h={}
lat1_h={}
lng0_h={}
lng1_h={}
info_h={}
features = o["features"]

features.each do |ft|
  next if ft["type"]!="Feature"
  props = ft["properties"]
  pref = props["ADM2_PCODE"].sub("PH","")[0..3].to_i #   "PH015500000" > "015500000" > "0155"
  city = props["ADM3_PCODE"].sub("PH","")[0..5].to_i
  prefname = props["ADM2_EN"].sub("'","\\'") # "Pangasinan"
  cityname = props["ADM3_EN"].sub("'","\\'") # "Aguilar"
      
  geom = ft["geometry"]
  if geom["type"]!="Polygon" and geom["type"]!="MultiPolygon" then
    print "invalid type: ",geom["type"],"\n"
    exit(0)
    next
  end
  multi=false
  multi=true if geom["type"]=="MultiPolygon"

  coords = geom["coordinates"]
  # 緯度経度の範囲を事前計算

  if multi then
    lng0,lat0=coords[0][0][0]
    lng1,lat1=coords[0][0][0]    
    coords_ary=coords
  else
    lng0,lat0=coords[0][0]
    lng1,lat1=coords[0][0]
    coords_ary=[coords]
  end
  coords_ary.each do |list|
    list.each do |coordset| # 飛び地があるので配列になっているんだろう. coordsetは [lng,lat]の配列
      coordset.each do |coord|
        lng0=coord[0] if coord[0] < lng0
        lat0=coord[1] if coord[1] < lat0
        lng1=coord[0] if coord[0] > lng1
        lat1=coord[1] if coord[1] > lat1
      end
    end    
  end
  lat0_h[city]=lat0 if !lat0_h[city]
  lng0_h[city]=lng0 if !lng0_h[city]
  lat1_h[city]=lat1 if !lat1_h[city]
  lng1_h[city]=lng1 if !lng1_h[city]
  lat0_h[city]=lat0 if lat0<lat0_h[city]
  lng0_h[city]=lng0 if lng0<lng0_h[city]
  lat1_h[city]=lat1 if lat1>lat1_h[city]
  lng1_h[city]=lng1 if lng1>lng1_h[city]      

  info_h[city]=[pref,city,prefname,cityname]

  print "city=#{city} pref=#{pref} cityname=#{cityname} prefname=#{prefname}\n"
  path="cities/#{city}.json" 
  json = JSON.generate(coords) # array of array of [lng,lat]
  File.open(path,"w") do |f| f.write(json) end

end

log_of.print("delete from cities where country_iso='PHL'");
info_h.keys.each do |keycode|
  ary=info_h[keycode]
  pref,city,prefname,cityname=ary
  lat0=lat0_h[city]
  lng0=lng0_h[city]
  lat1=lat1_h[city]
  lng1=lng1_h[city]
  center_lat=(lat0+lat1)/2.0
  center_lng=(lng0+lng1)/2.0
  log_of.print("insert into cities set country_iso='PHL',pref=#{pref},city=#{city},cityname='#{cityname}',jcode=0,lat0=#{lat0},lng0=#{lng0},lat1=#{lat1},lng1=#{lng1},center_lat=#{center_lat},center_lng=#{center_lng};\n")
end


#
# Barangays
#

log_of=File.open("polygons_phl.sql","w")

json=File.open("Barangays.json").read()
o=JSON.parse(json)

lat0_h={}
lat1_h={}
lng0_h={}
lng1_h={}
info_h={}
features = o["features"]

features.each do |ft|
  next if ft["type"]!="Feature"
  props = ft["properties"]
  keycode = props["ADM_ID"]
  if !keycode then
    print "keycode empty\n"
    next
  end  
  pref = props["ADM2_PCODE"].sub("PH","")[0..3].to_i #   "PH015500000" > "015500000" > "0155"
  city = props["ADM3_PCODE"].sub("PH","")[4..5].to_i #   "PH015502000"
  kihon = props["ADM4_PCODE"].sub("PH","")[6..8].to_i # "PH015502012"
  prefname = props["ADM2_EN"].sub("'","\\'") # "Pangasinan"
  cityname = props["ADM3_EN"].sub("'","\\'") # "Aguilar"
  sname = props["ADM4_EN"].sub("'","\\'") # "Pogomboa"
      
  geom = ft["geometry"]
  if geom["type"]!="Polygon" and geom["type"]!="MultiPolygon" then
    print "invalid type: ",geom["type"],"\n"
    exit(0)
    next
  end
  multi=false
  multi=true if geom["type"]=="MultiPolygon"

  coords = geom["coordinates"]
  # 緯度経度の範囲を事前計算

  if multi then
    lng0,lat0=coords[0][0][0]
    lng1,lat1=coords[0][0][0]    
    coords_ary=coords
  else
    lng0,lat0=coords[0][0]
    lng1,lat1=coords[0][0]
    coords_ary=[coords]
  end
  coords_ary.each do |list|
    list.each do |coordset| # 飛び地があるので配列になっているんだろう. coordsetは [lng,lat]の配列
      coordset.each do |coord|
        lng0=coord[0] if coord[0] < lng0
        lat0=coord[1] if coord[1] < lat0
        lng1=coord[0] if coord[0] > lng1
        lat1=coord[1] if coord[1] > lat1
      end
    end    
  end
  lat0_h[keycode]=lat0 if !lat0_h[keycode]
  lng0_h[keycode]=lng0 if !lng0_h[keycode]
  lat1_h[keycode]=lat1 if !lat1_h[keycode]
  lng1_h[keycode]=lng1 if !lng1_h[keycode]
  lat0_h[keycode]=lat0 if lat0<lat0_h[keycode]
  lng0_h[keycode]=lng0 if lng0<lng0_h[keycode]
  lat1_h[keycode]=lat1 if lat1>lat1_h[keycode]
  lng1_h[keycode]=lng1 if lng1>lng1_h[keycode]      

  info_h[keycode]=[pref,city,kihon,prefname,cityname,sname]

  print "keycode=#{keycode} pref=#{pref} city=#{city} kihon=#{kihon} prefname=#{prefname} cityname=#{cityname} sname=#{sname}\n"
  path="polygons/#{keycode}.json" 
  json = JSON.generate(coords) # array of array of [lng,lat]
  File.open(path,"w") do |f| f.write(json) end

end

log_of.print("delete from polygons where country_iso='PHL'");
info_h.keys.each do |keycode|
  ary=info_h[keycode]
  pref,city,kihon,prefname,cityname,sname=ary
  id="PHL.#{pref}.#{city}.#{kihon}"
  lat0=lat0_h[keycode]
  lng0=lng0_h[keycode]
  lat1=lat1_h[keycode]
  lng1=lng1_h[keycode]
  center_lat=(lat0+lat1)/2.0
  center_lng=(lng0+lng1)/2.0
  log_of.print("insert into polygons set id='#{id}',country_iso='PHL',keycode=#{keycode},pref=#{pref},city=#{city},kihon=#{kihon},cityname='#{cityname}',prefname='#{prefname}',sname='#{sname}',lat0=#{lat0},lng0=#{lng0},lat1=#{lat1},lng1=#{lng1},center_lat=#{center_lat},center_lng=#{center_lng};\n")
end

