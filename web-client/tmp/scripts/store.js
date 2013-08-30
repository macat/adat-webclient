(function() {
  WebClient.Store = DS.Store.extend({
    adapter: DS.FixtureAdapter.create()
  });

}).call(this);
