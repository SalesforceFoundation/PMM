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
        System.debug('in md selector');
        System.debug(FeatureGate__mdt.getAll().values());
        return FeatureGate__mdt.getAll().values();
    }
}
