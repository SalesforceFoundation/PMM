public with sharing class FeatureGateSelector {
    public List<FeatureGate__mdt> getAllFeatureGates() {
        System.debug(FeatureGate__mdt.getAll().values());
        return FeatureGate__mdt.getAll().values();
    }
}
