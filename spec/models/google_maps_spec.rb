# encoding: utf-8
require 'spec_helper'

describe GoogleMaps do

  describe ".query_for_lonlat" do
    context "successful query" do
      use_vcr_cassette "google-maps-query-lonlat"
    
      it "queries for a longitude and latitude" do
        lonlat = GoogleMaps.query_for_lonlat("Kortumstraße 19-21, 44789 Bochum")
        lonlat.first.should == 7.21643
        lonlat.second.should == 51.47725
      end
    end
    
    context "unknow address" do
      use_vcr_cassette "google-maps-query-lonlat-unknown-address"
      
      it "raises an GoogleMaps::NoResultKnown" do
        expect { GoogleMaps.query_for_lonlat("UnknownStreet 13, 123456 Nups") }.
          to raise_error(GoogleMaps::NoResultKnown)
      end
    end
    
    context "google query error" do
      use_vcr_cassette "google-maps-query-lonlat-google-query-error"
      
      it "raises an GoogleMaps::QueryingProblem" do
        expect { GoogleMaps.query_for_lonlat("Kortumstraße 19-21, 44789 Bochum") }.
          to raise_error(GoogleMaps::QueryingProblem)
      end
    end
    
    context "http error" do
      use_vcr_cassette "google-maps-query-lonlat-google-http-error"
      
      it "raises an GoogleMaps::QueryingProblem" do
        expect { GoogleMaps.query_for_lonlat("httperror") }.
          to raise_error(GoogleMaps::QueryingProblem)
      end
    end
  end

end
