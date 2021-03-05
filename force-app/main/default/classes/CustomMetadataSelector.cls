public with sharing class CustomMetadataSelector {
    @TestVisible
    private static CustomMetadataSelector instance;

    public static CustomMetadataSelector getInstance() {
        if (instance == null) {
            instance = new CustomMetadataSelector();
        }
        return instance;
    }

    public List<FeatureGate__mdt> getAllFeatureGates() {
        return FeatureGate__mdt.getAll().values();
    }
}
