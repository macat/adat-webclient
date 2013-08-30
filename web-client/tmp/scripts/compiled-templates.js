Ember.TEMPLATES["application"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  var buffer = '', stack1, hashTypes, hashContexts, escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = '', hashTypes, hashContexts;
  data.buffer.push("\n          <li>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "item", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</li>");
  return buffer;
  }

  data.buffer.push("\n<div class=\"navbar navbar-fixed-top\">\n  <div class=\"navbar-inner\">\n    <div class=\"container-fluid\">\n      <div class=\"brand\">\n        <Your>App</Your>\n      </div>\n    </div>\n  </div>\n</div>\n<div id=\"main\" class=\"container-fluid\">\n  <div class=\"row-fluid\">\n    <div class=\"span3\">\n      <div class=\"well sidebar-nav\"><span class=\"nav-header\">Colors</span>\n        <ul class=\"nav\">\n          nav-list\n          ");
  hashTypes = {};
  hashContexts = {};
  stack1 = helpers.each.call(depth0, "item", "in", "controller", {hash:{},inverse:self.noop,fn:self.program(1, program1, data),contexts:[depth0,depth0,depth0],types:["ID","ID","ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n        </ul>\n      </div>\n    </div>\n    <div class=\"span9\">");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "outlet", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</div>\n  </div>\n</div>");
  return buffer;
  
});

Ember.TEMPLATES["index"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  


  data.buffer.push("\n<div class=\"well\">\n  <Welcome>to Yeoman and Ember.js!</Welcome>\n</div>");
  
});

Ember.TEMPLATES["login"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  var buffer = '', stack1, hashContexts, hashTypes, options, escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  
  data.buffer.push("\n      <div class=\"alert\">\" Invalid username or password.</div>");
  }

  data.buffer.push("\n<div class=\"row\"><form class=\"pure-form\" ");
  hashContexts = {'on': depth0};
  hashTypes = {'on': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "login", {hash:{
    'on': ("submit")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n  <fieldset>\n    <legend>Login</legend>\n    <div class=\"pure-group\">");
  hashTypes = {};
  hashContexts = {};
  stack1 = helpers['if'].call(depth0, "loginFailed", {hash:{},inverse:self.noop,fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n      ");
  hashContexts = {'value': depth0,'type': depth0};
  hashTypes = {'value': "ID",'type': "STRING"};
  options = {hash:{
    'value': ("username"),
    'type': ("text")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n      ");
  hashContexts = {'value': depth0,'type': depth0};
  hashTypes = {'value': "ID",'type': "STRING"};
  options = {hash:{
    'value': ("password"),
    'type': ("password")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n    </div><button class=\"pure-button pure-button-primary pure-input-1-2\" type=\"button\" ");
  hashContexts = {'disabled': depth0};
  hashTypes = {'disabled': "STRING"};
  data.buffer.push(escapeExpression(helpers.bindAttr.call(depth0, {hash:{
    'disabled': ("isProcessing")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("> Sign in </button>\n  </fieldset></form>\n</div>");
  return buffer;
  
});