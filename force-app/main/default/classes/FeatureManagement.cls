public inherited sharing class FeatureManagement {
    @TestVisible
    private static FeatureManagement instance;

    //This is a wrapper class around FeatureManagement for stubbing purposes.
    public static FeatureManagement getInstance() {
        if (instance == null) {
            instance = new FeatureManagement();
        }
        return instance;
    }

    public void setPackageIntegerValue(String apiName, Integer value) {
        System.FeatureManagement.setPackageIntegerValue(apiName, value);
    }

    public Integer checkPackageIntegerValue(String apiName) {
        return System.FeatureManagement.checkPackageIntegerValue(apiName);
    }

    // ----------     Interface     ---------- //
    public interface FeatureParameter {
        void send();
    }
}
