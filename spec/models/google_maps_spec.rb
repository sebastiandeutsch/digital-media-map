# encoding: utf-8
require 'spec_helper'

describe GoogleMaps do
  it "should query for a longitude and latitude" do
    lonlat = GoogleMaps.query_for_lonlat("Kortumstraße 19-21, 44789 Bochum")
    lonlat.first.should == 7.21643
    lonlat.second.should == 51.47725
  end
end
