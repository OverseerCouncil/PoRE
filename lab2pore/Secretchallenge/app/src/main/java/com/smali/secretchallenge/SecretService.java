package com.smali.secretchallenge;

import android.Manifest;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.support.v4.app.ActivityCompat;
import android.widget.Toast;

import static com.smali.secretchallenge.MainActivity.mActivity;

public class SecretService extends Service {

    protected MyBinder myBinder = new MyBinder();

    @Override
    public void onCreate() {
        super.onCreate();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startID) {
        return super.onStartCommand(intent, flags, startID);
    }

    @Override
    public IBinder onBind(Intent intent) {
        getLocation();
        return myBinder;
    }

    @Override
    public boolean onUnbind(Intent intent) {
        return super.onUnbind(intent);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    protected void getLocation() {
        LocationManager locationManager = (LocationManager) this.getSystemService(Context.LOCATION_SERVICE);
        Criteria criteria = new Criteria();
        criteria.setAccuracy(Criteria.ACCURACY_FINE);
        criteria.setAltitudeRequired(false);
        criteria.setBearingRequired(false);
        criteria.setSpeedRequired(false);
        criteria.setCostAllowed(false);
        criteria.setPowerRequirement(Criteria.POWER_LOW);
        assert locationManager != null;
        String provider = locationManager.getBestProvider(criteria, true);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(mActivity,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 1);
            return;
        }
        locationManager.requestLocationUpdates(provider, 3000, 0, new LocationListener() {
            @Override
            public void onLocationChanged(Location location) {
                locationToast(location);
            }

            @Override
            public void onStatusChanged(String provider, int status, Bundle extras) {

            }

            @Override
            public void onProviderEnabled(String provider) {
                locationToast(null);
            }

            @Override
            public void onProviderDisabled(String provider) {
                locationToast(null);
            }
        });
    }

    private void locationToast(Location location) {
        double latitude = 0;
        double longitude = 0;
        float accuracy = 0;
        if (location != null) {
            latitude = location.getLatitude();
            longitude = location.getLongitude();
            accuracy = location.getAccuracy();
        }
        String loc = "getAccuracy:" + accuracy + "\r\n" + "getLatitude:" +
                latitude + "\r\n" + "getLongitude:" + longitude;
        serviceToast(loc);
    }

    private void serviceToast(final String toasting) {
        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(() -> Toast.makeText(getApplicationContext(), toasting, Toast.LENGTH_SHORT).show());
    }

    private static class MyBinder extends Binder {
    }

}